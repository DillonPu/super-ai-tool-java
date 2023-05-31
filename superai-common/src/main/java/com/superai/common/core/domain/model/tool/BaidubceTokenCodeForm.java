package com.superai.common.core.domain.model.tool;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @author AL
 * @date 2023/3/28 10:23
 */
@Data
public class BaidubceTokenCodeForm {

    @ApiModelProperty(value = "秘钥对枚举code 见枚举 BaidubceKeyEnum",required = true)
    @NotBlank(message = "秘钥对枚举code 不能为空")
    private String code;
}
