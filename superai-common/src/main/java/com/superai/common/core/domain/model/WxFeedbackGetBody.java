package com.superai.common.core.domain.model;

import com.superai.common.core.page.PageDomain;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.v3.oas.annotations.Hidden;
import lombok.Data;


/**
 * 用户反馈查询 参数
 */
@Data
public class WxFeedbackGetBody extends PageDomain {

    @Hidden()
    @ApiModelProperty("反馈用户id")
    private Long userId;

    @ApiModelProperty("问题标题")
    private String questionTitle;

    @ApiModelProperty("问题描述")
    private String questionDesc;

    @ApiModelProperty("问题分类")
    private String questionType;

}
