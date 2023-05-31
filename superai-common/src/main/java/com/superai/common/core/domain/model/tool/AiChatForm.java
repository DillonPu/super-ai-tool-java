package com.superai.common.core.domain.model.tool;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author AL
 * @date 2023/3/31 17:18
 */
@Data
public class AiChatForm {
    @ApiModelProperty("发来的消息")
    private String msg;

    /**
     * MESSAGE_TYPE
     * TEXT("1","文本"),
     *     IMAGE("2","图片"),
     *     RANDOM("3","随机文本"),
     *     ROBOT("4","机器人文本"),
     */
    @ApiModelProperty("返回类型")
    private String msgAnswerType;
}
