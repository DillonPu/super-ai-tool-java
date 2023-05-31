package com.superai.common.enums.tool;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 消息类型
 * 
 * @author superai
 */
@Getter
@AllArgsConstructor
public enum MESSAGE_TYPE
{
    TEXT("1","文本"),
    IMAGE("2","图片"),
    RANDOM("3","随机文本"),
    ROBOT("4","机器人文本"),
    ;
    private final String type;
    private final String desc;

    public static MESSAGE_TYPE getType(String type) {
        MESSAGE_TYPE[] values = MESSAGE_TYPE.values();
        for (MESSAGE_TYPE value : values) {
            if (value.getType().equals(type)){
                return value;
            }
        }
        return null;
    }
}
