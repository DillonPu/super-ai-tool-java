package com.superai.system.domain;

import com.superai.common.annotation.Excel;
import com.superai.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

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
public class WxUserPointLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 租户号 */
    private String id;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 积分来源，1签到，2看视频，3充值兑换 */
    @Excel(name = "积分来源，1签到，2看视频，3充值兑换")
    private String pointFrom;

    /** 积分去向 */
    @Excel(name = "积分去向")
    private String pointTo;

    /** 积分 */
    @Excel(name = "积分")
    private Integer point;

    /** 描述 */
    @Excel(name = "描述")
    private String description;

}
