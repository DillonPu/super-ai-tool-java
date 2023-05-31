package com.superai.framework.web.service;

import com.alibaba.fastjson2.JSON;
import com.google.gson.Gson;
import com.superai.common.core.domain.model.tool.ExpressLookForm;
import com.superai.common.core.domain.vo.ExpressResultVO;
import com.superai.common.enums.tool.PointToEnum;
import com.superai.common.exception.base.BaseException;
import com.superai.common.utils.StringUtils;
import com.superai.common.utils.http.HttpUtils;
import com.superai.common.utils.sign.Base64;
import com.superai.common.utils.sign.Md5Utils;
import com.superai.common.config.ExpressKdNiaoConfig;
import com.superai.system.service.IWxUserPointLogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

/** 
 * 快递查询服务
 * @date  2023/3/28 11:04
 * @author AL
 **/
@Slf4j
@Component
public class WxExpressService {

    @Resource
    private ExpressKdNiaoConfig kdNiaoConfig;

    @Resource
    private IWxUserPointLogService wxUserPointLogService;

    /**
     * 快递查询
     * @param param
     * @return
     * @throws BaseException
     */
    public ExpressResultVO lookExpress(ExpressLookForm param) throws BaseException {

        log.info("----------------查询快递轨迹----------------，参数：{}", JSON.toJSONString(param));

        // 检查积分是否足够
        wxUserPointLogService.checkTotalPointIsEnough(PointToEnum.TO_EXPRESS);

        // 调用快递鸟
        Map<String,String> requestDataMap = new HashMap<>();
        Gson gson = new Gson();
        Map<String,String> requestData = new HashMap<>();
        requestData.put("ShipperCode",param.getShipperCode());
        requestData.put("LogisticCode",param.getLogisticCode());

        requestDataMap.put("RequestData",gson.toJson(requestData));
        requestDataMap.put("DataType","2");
        requestDataMap.put("EBusinessID",kdNiaoConfig.getUserId());
        requestDataMap.put("DataSign",getDataSign(gson.toJson(requestData)));
        // 1002只能：限500次/天;（即时查询 支持3家 申通、圆通、百世）;有效期半年 2023-09-08到期
        requestDataMap.put("RequestType","1002");

        String result = HttpUtils.sendGetByMap(kdNiaoConfig.getEbusinessOrderHandleApiUrl(),requestDataMap);
        if (StringUtils.isNotBlank(result)){
            ExpressResultVO expressResult = JSON.parseObject(result, ExpressResultVO.class);
            // 减少积分
            wxUserPointLogService.decreasePointByPay(PointToEnum.TO_EXPRESS);
            return expressResult;
        }
        return new ExpressResultVO();
    }

    private String getDataSign(String requestData){
        // 把(请求体(未编码)+ApiKey)进行MD5加密（32位小写），然后Base64编码，最后进行URL(utf-8)编码
        String beforeMd5 = requestData+kdNiaoConfig.getApiKey();
        String md5Str = Md5Utils.md5To32(beforeMd5);

        String sign = Base64.encode(md5Str.getBytes(StandardCharsets.UTF_8));
        return sign;
    }
}
