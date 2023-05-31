package com.superai.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.superai.common.annotation.Excel;
import com.superai.common.core.domain.BaseEntity;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * ai对话记录对象 wx_ai_msg_log
 * 
 * @author superai
 * @date 2023-03-31
 */
@Data
public class WxAiMsgLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 消息id */
    private String msgId;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 接收方 */
    @Excel(name = "接收方")
    private String tojid;

    /** 发送方 */
    @Excel(name = "发送方")
    private String jid;

    /** 聊天消息 */
    @Excel(name = "聊天消息")
    private String msg;

    /** 消息来源 */
    @Excel(name = "消息来源")
    private String msgOrigin;

    /** 类型 */
    @Excel(name = "类型")
    private String type;

    /** 是否已读 */
    @Excel(name = "是否已读")
    private String isread;

    /** 时间戳 */
    private String timestampValue;

}
