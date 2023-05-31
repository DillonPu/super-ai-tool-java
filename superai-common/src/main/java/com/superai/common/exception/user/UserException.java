package com.superai.common.exception.user;

import com.superai.common.exception.base.BaseException;

/**
 * 用户信息异常类
 * 
 * @author superai
 */
public class UserException extends BaseException
{
    private static final long serialVersionUID = 1L;

    public UserException(String code, Object[] args)
    {
        super("user", code, args, null);
    }

    public UserException(String module,Integer code, Object[] args)
    {
        super(module, code.toString(), args, null);
    }
}
