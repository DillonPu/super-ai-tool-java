package com.superai.common.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * @author AL
 * @date 2023/3/8 15:52
 */
@Data
@ConfigurationProperties(prefix = "express.kdnaio")
@Configuration
public class ExpressKdNiaoConfig {

    private String userId;

    private String apiKey;

    private String ebusinessOrderHandleApiUrl;
}
