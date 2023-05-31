package com.superai.common.enums.tool;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 消息产生源
 * 
 * @author superai
 */
@Getter
@AllArgsConstructor
public enum MESSAGE_ORIGIN
{
    CUSTOMER("customer"),
    SERVER("server"),
    ;
    private final String origin;

}
