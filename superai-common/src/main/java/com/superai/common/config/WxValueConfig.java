package com.superai.common.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * @author AL
 * @date 2022/7/28 8:56
 */
@Data
@Configuration
public class WxValueConfig {


    @Value("${weixin.miniProgram.appId}")
    private String miniProgramAppId;

    @Value("${weixin.miniProgram.appSecret}")
    private String miniProgramAppSecret;

    // https://api.weixin.qq.com/sns/jscode2session?appid=APPID&secret=SECRET&js_code=JSCODE&grant_type=authorization_code
    @Value("${weixin.miniProgram.wxJscode2sessionApi}")
    private String wxJscode2sessionApi;

    // https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET
    @Value("${weixin.miniProgram.wxTokenApi}")
    private String wxTokenApi;


}
