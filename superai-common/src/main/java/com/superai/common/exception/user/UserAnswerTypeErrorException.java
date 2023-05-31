package com.superai.common.exception.user;

/**
 * 用户提问类型不支持
 * 
 * @author superai
 */
public class UserAnswerTypeErrorException extends UserException
{
    private static final long serialVersionUID = 1L;

    public UserAnswerTypeErrorException()
    {
        super("user.answer.no.exist", null);
    }

}
