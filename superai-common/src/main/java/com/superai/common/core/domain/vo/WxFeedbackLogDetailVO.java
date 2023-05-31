package com.superai.common.core.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.superai.common.core.domain.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * 问题反馈对象 wx_feedback_log
 * 
 * @author superai
 * @date 2023-04-03
 */
@Data
public class WxFeedbackLogDetailVO
{
    private static final long serialVersionUID = 1L;

    @ApiModelProperty("反馈id")
    private String id;

    @ApiModelProperty("问题标题")
    private String questionTitle;

    @ApiModelProperty("反馈时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    @ApiModelProperty("问题描述")
    private String questionDesc;

    @ApiModelProperty("问题分类")
    private String questionType;

    @ApiModelProperty("答复")
    private String answer;

    @ApiModelProperty("是否已答复")
    private Boolean isAnswer;

    @ApiModelProperty("联系方式")
    private String contact;

    @ApiModelProperty("答复时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

}
