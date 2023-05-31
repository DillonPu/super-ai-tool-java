package com.superai.system.domain;

import java.math.BigDecimal;
import com.superai.common.annotation.Excel;
import com.superai.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 微信用户充值消费记录对象 wx_user_money_log
 * 
 * @author superai
 * @date 2023-03-23
 */
public class WxUserMoneyLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 租户号 */
    private String id;

    /** 用户id */
    @Excel(name = "用户id")
    private String userId;

    /** 金额来源1微信充值，2转账，3初始 */
    @Excel(name = "金额来源1微信充值，2转账，3初始")
    private String moneyFrom;

    /** 金额去向1、兑换积分，2、使用产品 */
    @Excel(name = "金额去向1、兑换积分，2、使用产品")
    private String moneyTo;

    /** 金额 */
    @Excel(name = "金额")
    private BigDecimal money;

    /** 描述 */
    @Excel(name = "描述")
    private String description;

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }
    public void setUserId(String userId) 
    {
        this.userId = userId;
    }

    public String getUserId() 
    {
        return userId;
    }
    public void setMoneyFrom(String moneyFrom) 
    {
        this.moneyFrom = moneyFrom;
    }

    public String getMoneyFrom() 
    {
        return moneyFrom;
    }
    public void setMoneyTo(String moneyTo) 
    {
        this.moneyTo = moneyTo;
    }

    public String getMoneyTo() 
    {
        return moneyTo;
    }
    public void setMoney(BigDecimal money) 
    {
        this.money = money;
    }

    public BigDecimal getMoney() 
    {
        return money;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("moneyFrom", getMoneyFrom())
            .append("moneyTo", getMoneyTo())
            .append("money", getMoney())
            .append("description", getDescription())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
