package com.superai.common.core.domain.vo;

import com.alibaba.fastjson2.JSON;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.superai.common.annotation.Excel;
import com.superai.common.annotation.Excel.ColumnType;
import com.superai.common.annotation.Excel.Type;
import com.superai.common.annotation.Excels;
import com.superai.common.core.domain.BaseEntity;
import com.superai.common.core.domain.entity.SysDept;
import com.superai.common.core.domain.entity.SysRole;
import com.superai.common.xss.Xss;
import lombok.Data;
import lombok.ToString;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 用户对象 微信信息
 * 
 * @author superai
 */
@Data
public class WxUserInfo
{
    private static final long serialVersionUID = 1L;

    /** 用户ID */
    private Long userId;
    /** 用户账号 */
    private String userName;
    /** 用户昵称 */
    private String nickName;
    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    /** 用户邮箱 */
    private String email;
    /** 手机号码 */
    private String phonenumber;
    /** 用户头像 */
    private String avatar;

    private String unionid;
    private String openid;
    private BigDecimal totalMoney;
    private Integer totalPoint;

    private Integer historyTotalPoint;
    private Integer level;

    /**是否签到 */
    private Boolean daySign;
    /**签到得到的积分 */
    private Integer daySignPoint;

    private Boolean isLogin;

}
