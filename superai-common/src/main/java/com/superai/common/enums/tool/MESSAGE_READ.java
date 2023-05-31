package com.superai.common.enums.tool;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 消息已读状态
 * 
 * @author superai
 */
@Getter
@AllArgsConstructor
public enum MESSAGE_READ
{
    UN_READ("0","未读"),
    READ("1","已读"),
    ;
    private final String status;
    private final String desc;

}
