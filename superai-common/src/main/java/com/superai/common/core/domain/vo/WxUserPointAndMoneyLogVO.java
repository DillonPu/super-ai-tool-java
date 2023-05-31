package com.superai.common.core.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.util.Date;

/**
 * 微信用户充值记录对象 wx_user_point_log
 * 
 * @author superai
 * @date 2023-03-23
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class WxUserPointAndMoneyLogVO
{
    private static final long serialVersionUID = 1L;

    @ApiModelProperty("时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date time;

    @ApiModelProperty("描述")
    private String description;

    @ApiModelProperty("积分值")
    private String value;

}
