package com.superai.common.core.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.superai.common.annotation.Excel;
import com.superai.common.core.domain.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 问题反馈对象 wx_feedback_log
 * 
 * @author superai
 * @date 2023-04-03
 */
@Data
public class WxFeedbackLogVO
{
    private static final long serialVersionUID = 1L;

    @ApiModelProperty("反馈id")
    private String id;

    @ApiModelProperty("问题标题")
    private String questionTitle;

    @ApiModelProperty("是否已答复")
    private Boolean isAnswer;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
}
