package com.superai.common.exception.user;

/**
 * 用户积分不够异常类
 * 
 * @author superai
 */
public class UserAiChatMsgEmptyException extends UserException
{
    private static final long serialVersionUID = 1L;

    public UserAiChatMsgEmptyException()
    {
        super("user.aichat.msg.empty", null);
    }

}
