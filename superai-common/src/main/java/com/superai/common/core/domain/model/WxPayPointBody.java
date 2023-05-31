package com.superai.common.core.domain.model;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/** 
 * 消耗积分code
 * @date  2023/3/27 15:18
 * @author AL
 **/
@Data
public class WxPayPointBody {

    @ApiModelProperty("查看PointToEnum枚举属性")
    private String payCode;
}
