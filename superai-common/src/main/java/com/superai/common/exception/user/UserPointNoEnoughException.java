package com.superai.common.exception.user;

import com.superai.common.constant.HttpStatus;

/**
 * 用户积分不够异常类
 * 
 * @author superai
 */
public class UserPointNoEnoughException extends UserException
{
    private static final long serialVersionUID = 1L;

    public UserPointNoEnoughException()
    {
        super("user.point.no.enough", null);
    }

}
