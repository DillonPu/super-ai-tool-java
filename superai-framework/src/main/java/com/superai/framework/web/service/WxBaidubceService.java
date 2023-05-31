package com.superai.framework.web.service;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.superai.common.config.BaiduBceConfig;
import com.superai.common.core.domain.model.tool.BaidubceTokenCodeForm;
import com.superai.common.enums.tool.BaidubceKeyEnum;
import com.superai.common.enums.tool.PointToEnum;
import com.superai.common.utils.StringUtils;
import com.superai.common.utils.http.HttpUtils;
import com.superai.system.service.IWxUserPointLogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import javax.annotation.Resource;
import java.util.Objects;


/** 
 * Baidubce 服务
 * @date  2023/3/28 11:08
 * @author AL
 **/
@Slf4j
@Component
public class WxBaidubceService {
    
    @Resource
    private BaiduBceConfig baiduBceConfig;

    @Resource
    private IWxUserPointLogService wxUserPointLogService;

    public String getBaidubceToken(BaidubceTokenCodeForm form) {

        BaidubceKeyEnum keyEnum = BaidubceKeyEnum.getByCode(form.getCode());
        if (Objects.isNull(keyEnum)){
            log.info("------baidubce秘钥对授权码错误------");
            return "";
        }

        // 检查积分是否够用
        PointToEnum pointToEnum = null;
        switch (keyEnum){
            case BAIDU_LOOK_INGREDIENT:
                pointToEnum = PointToEnum.TO_BAIDU_LOOK_INGREDIENT;
                break;
            case BAIDU_LOOK_PLANT:
                pointToEnum = PointToEnum.TO_BAIDU_LOOK_PLANT;
                break;
            case BAIDU_LOOK_ANIMAL:
                pointToEnum = PointToEnum.TO_BAIDU_LOOK_ANIMAL;
                break;
            case BAIDU_LOOK_FOOD:
                pointToEnum = PointToEnum.TO_BAIDU_LOOK_FOOD;
                break;
            case BAIDU_LOOK_MONEY:
                pointToEnum = PointToEnum.TO_BAIDU_LOOK_MONEY;
                break;

        }
        wxUserPointLogService.checkTotalPointIsEnough(pointToEnum);


        // 调用百度获取token
        String requestUrl = baiduBceConfig.getTokenApiUrl()
                .replace("CLIENTID", keyEnum.getKey())
                .replace("CLIENT_SECRET", keyEnum.getSecret());
        String result = HttpUtils.sendPost(requestUrl,null);
        if (StringUtils.isNotBlank(result)) {
            JSONObject jsonObject = JSON.parseObject(result);
            Object access_token = jsonObject.get("access_token");
            if (!Objects.isNull(access_token)){
                // 减少积分
                wxUserPointLogService.decreasePointByPay(pointToEnum);
                return access_token.toString();
            }
        }
        return "";

    }
}
