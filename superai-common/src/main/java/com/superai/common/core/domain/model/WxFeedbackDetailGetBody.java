package com.superai.common.core.domain.model;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


/**
 * 用户反馈详情查询 参数
 */
@Data
public class WxFeedbackDetailGetBody {

    @ApiModelProperty("反馈id")
    private String id;


}
