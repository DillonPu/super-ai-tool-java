package com.superai.common.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * 百度智能云配置
 * @date  2023/3/28 14:19
 * @author AL
 **/
@Data
@Configuration
public class BaiduBceConfig {

    /**
     * https://aip.baidubce.com/oauth/2.0/token?grant_type=client_credentials&client_id=CLIENTID&client_secret=CLIENT_SECRET
     */
    @Value("${baidubce.tokenApiUrl}")
    private String tokenApiUrl;

}
