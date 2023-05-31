package com.superai.common.core.domain.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/** 
 * 聊天返回结果
 * @date  2023/3/31 17:34
 * @author AL
 **/
@Data
public class AiChatMsgVO {

    /**  */
    @ApiModelProperty("消息id")
    private String msgId;

    @ApiModelProperty("接收方")
    private String tojid;

    @ApiModelProperty("发送方")
    private String jid;

    @ApiModelProperty("聊天消息")
    private String msg;

    @ApiModelProperty("消息来源")
    private String msgOrigin;

    @ApiModelProperty("消息类型")
    private String type;

    @ApiModelProperty("是否已读")
    private String isread;

    @ApiModelProperty("时间戳")
    private String timestampValue;

}
