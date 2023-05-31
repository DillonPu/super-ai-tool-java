package com.superai.common.core.domain.model;

import lombok.Data;

/** 
 * 信息修改接口
 * @date  2023/3/27 18:24
 * @author AL
 **/
@Data
public class WxInfoUpdateBody {
    private String nickName;
    private String avatar;
}
