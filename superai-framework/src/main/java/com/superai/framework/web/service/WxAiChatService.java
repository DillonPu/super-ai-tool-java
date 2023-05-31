package com.superai.framework.web.service;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.superai.common.core.domain.model.tool.AiChatForm;
import com.superai.common.core.domain.model.tool.BaidubceTokenCodeForm;
import com.superai.common.core.domain.vo.AiChatMsgVO;
import com.superai.common.enums.tool.*;
import com.superai.common.exception.ServiceException;
import com.superai.common.exception.base.BaseException;
import com.superai.common.exception.user.UserAiChatMsgEmptyException;
import com.superai.common.utils.SecurityUtils;
import com.superai.common.utils.StringUtils;
import com.superai.common.utils.http.HttpUtils;
import com.superai.common.utils.uuid.UUID;
import com.superai.system.domain.WxAbnormalWord;
import com.superai.system.domain.WxAiMsgLog;
import com.superai.system.service.IWxAbnormalWordService;
import com.superai.system.service.IWxAiMsgLogService;
import com.superai.system.service.IWxUserPointLogService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RandomUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;


/** 
 * Ai chat
 * @date  2023/3/31 10:50
 * @author AL
 **/
@Slf4j
@Component
public class WxAiChatService {

    @Resource
    private IWxAiMsgLogService wxAiMsgLogService;

    @Resource
    private IWxUserPointLogService wxUserPointLogService;

    @Resource
    private WxBaidubceService wxBaidubceService;

    @Resource
    private IWxAbnormalWordService iWxAbnormalWordService;

    /**作画请求地址*/
    private final static String BAIDU_TXT2IMG_URL = "https://aip.baidubce.com/rpc/2.0/ernievilg/v1/txt2img";
    /**作画查询地址*/
    private final static String BAIDU_GET_IMG_URL = "https://aip.baidubce.com/rpc/2.0/ernievilg/v1/getImg";

    private final static String QING_YUN_KE_URL = "http://api.qingyunke.com/api.php?key=free&appid=0&msg=";

    /**
     * Ai聊天请求消息
     * @param form
     * @return
     */
    public AiChatMsgVO getAiChatAnswer(AiChatForm form,MESSAGE_TYPE messageAnswerType) {

        String msg = form.getMsg();
        if (StringUtils.isBlank(msg)){
            throw new UserAiChatMsgEmptyException();
        }

        // 产生一条客户端发的文字消息存储到数据库
        this.customerToServerMsg(msg, MESSAGE_TYPE.TEXT);

        // 调用api返回信息
        String serverMsg = "AI正在调试中,暂未分析得出结果...";
        PointToEnum pointToEnum = null;
        switch (messageAnswerType){
            case IMAGE:
                // 请求AI绘画api得出图片结果
                serverMsg = this.getAiDrawMsg(msg);
                pointToEnum = PointToEnum.TO_AI_DRAW;
                break;
            case TEXT:
                // 请求AI聊天api获取文字结果
                serverMsg = this.getAiChatMsg(msg);
                pointToEnum = PointToEnum.TO_AI_CHAT;
                break;
            case RANDOM:
                // 请求AI随机文本
                serverMsg = this.getRandomAbnormalSentence();
                pointToEnum = PointToEnum.TO_AI_RANDOM_CHAT;
                break;
            case ROBOT:
                // 请求AI机器人文本
                serverMsg = this.getAiRobotChatMsg(msg);
                pointToEnum = PointToEnum.TO_AI_ROBOT_CHAT;
                break;
            default:
                return new AiChatMsgVO();
        }

        // 减少积分
        wxUserPointLogService.decreasePointByPay(pointToEnum);

        //产生一条服务器存储第三方返回的结果消息存储到数据库
        WxAiMsgLog serverMsgLog = this.serverToCustomerMsg(serverMsg, messageAnswerType);
        AiChatMsgVO vo = new AiChatMsgVO();
        BeanUtils.copyProperties(serverMsgLog,vo);
        return vo;
    }

    /**
     * 获取随机组合句子
     * @return
     */
    private String getRandomAbnormalSentence(){
        Integer count = iWxAbnormalWordService.count();
        List<Integer> idList = new ArrayList<>();
        // 从0到count之间产生3个不一样的随机数（获取主谓宾）
        int totalRandomCount = 3;
        while (idList.size()<totalRandomCount){
            Integer num = RandomUtils.nextInt(0, count);
            if (!idList.contains(num)){
                idList.add(num);
            }
        }

        StringBuilder sentenceSb = new StringBuilder();
        List<WxAbnormalWord> wordList = iWxAbnormalWordService.selectListByIdList(idList);
        List<String> subjectList = wordList.stream().map(WxAbnormalWord::getSubject).collect(Collectors.toList());
        List<String> predicateList = wordList.stream().map(WxAbnormalWord::getPredicate).collect(Collectors.toList());
        List<String> objectList = wordList.stream().map(WxAbnormalWord::getObject).collect(Collectors.toList());
        // 打乱顺序
        Collections.shuffle(subjectList);
        Collections.shuffle(predicateList);
        Collections.shuffle(objectList);
        sentenceSb.append(subjectList.get(0)).append(predicateList.get(0)).append(objectList.get(0));
        return sentenceSb.toString();
    }

    private String getAiChatMsg(String msg){
       return "智能接入中...";
    }

    private String getAiRobotChatMsg(String msg){
        String url = QING_YUN_KE_URL+msg;
        String result = HttpUtils.sendGet(url);
        if (StringUtils.isNotBlank(result)){
            JSONObject jsonObject = JSONObject.parseObject(result);
            Object content = jsonObject.get("content");
            if (Objects.nonNull(content)){
                return content.toString();
            }
        }
        return "智能接入中...";
    }
    /**
     * 获取AI绘画结果
     * @return
     */
    private String getAiDrawMsg(String msg){
        BaidubceTokenCodeForm tokenCodeForm = new BaidubceTokenCodeForm();
        tokenCodeForm.setCode(BaidubceKeyEnum.WENXIN_AI_DRAW.getCode());
        String baidubceToken = wxBaidubceService.getBaidubceToken(tokenCodeForm);

        Object taskId = this.postBaiduTxt2img(baidubceToken, msg);
        if (Objects.isNull(taskId)){
            throw new ServiceException();
        }

        String img = this.postBaiduGetImg(baidubceToken, taskId);
        if (StringUtils.isNotBlank(img)){
            return img;
        }else {
            throw new ServiceException();
        }

    }

    /**
     * 调用baidu ai开始作画
     * @param baidubceToken
     * @param msg
     * @return
     */
    private Object postBaiduTxt2img(String baidubceToken,String msg){
        Map postParamMap = new HashMap();
        postParamMap.put("text",msg);
        postParamMap.put("resolution","1024*1024");
        postParamMap.put("style", AiImgTypeEnum.TSWX.getName());
        postParamMap.put("num",1);

        String url = BAIDU_TXT2IMG_URL+"?access_token="+baidubceToken;
        String params = JSON.toJSONString(postParamMap);
        String result = HttpUtils.sendPost(url, params);
        log.info("postBaiduTxt2img result:{}",result);
        if (StringUtils.isNotBlank(result)){

            // 若正确返回taskId再用taskId查询绘画结果
            JSONObject jsonObject = JSON.parseObject(result);
            Object taskId = jsonObject.get("taskId");
            if (Objects.nonNull(taskId)){
                return taskId;
            }
        }
        return null;
    }

    /**
     * 调用百度ai查询作画结果
     * @param baidubceToken
     * @param taskId
     * @return
     */
    private String postBaiduGetImg(String baidubceToken,Object taskId){
        String url = BAIDU_GET_IMG_URL+"?access_token="+baidubceToken;
        Map map = new HashMap();
        map.put("taskId",taskId);
        String params = JSON.toJSONString(map);
        String result = HttpUtils.sendPost(url, params);
        log.info("postBaiduGetImg result:{}",result);
        if (StringUtils.isNotBlank(result)){
            JSONObject jsonObject = JSON.parseObject(result);
            Object data = jsonObject.get("data");
            if (Objects.nonNull(data)){
                JSONObject dataObj = JSON.parseObject(JSON.toJSONBytes(data));
                if (Objects.nonNull(dataObj)) {
                    Object img = dataObj.get("img");
                    return img.toString();
                }
            }
        }
        return "";
    }


    /**
     * 客户端产生消息给服务器
     * @param msg
     * @return
     */
    private WxAiMsgLog customerToServerMsg(String msg,MESSAGE_TYPE msgType){
       return this.addMsg(msg,MESSAGE_ORIGIN.SERVER.getOrigin(),MESSAGE_ORIGIN.CUSTOMER.getOrigin(),msgType);
    }

    /**
     * 服务器产生消息给客户端
     * @param msg
     * @return
     */
    private WxAiMsgLog serverToCustomerMsg(String msg,MESSAGE_TYPE msgType){
        return this.addMsg(msg,MESSAGE_ORIGIN.CUSTOMER.getOrigin(),MESSAGE_ORIGIN.SERVER.getOrigin(),msgType);
    }

    /**
     * 添加消息
     * @param msg
     * @param tojid
     * @param jid
     * @return
     */
    private WxAiMsgLog addMsg(String msg,String tojid,String jid, MESSAGE_TYPE msgType){
        WxAiMsgLog msgLog = new WxAiMsgLog();
        msgLog.setMsgId(UUID.fastUUID().toString());
        msgLog.setUserId(SecurityUtils.getUserId());
        msgLog.setTojid(tojid);
        msgLog.setJid(jid);
        msgLog.setMsg(msg);
        msgLog.setType(msgType.getType());
        msgLog.setIsread(MESSAGE_READ.READ.getStatus());
        msgLog.setTimestampValue(System.currentTimeMillis()+"");
        msgLog.setCreateTime(new Date());
        msgLog.setCreateBy(SecurityUtils.getUsername());
        wxAiMsgLogService.insertWxAiMsgLog(msgLog);
        return msgLog;
    }


}
