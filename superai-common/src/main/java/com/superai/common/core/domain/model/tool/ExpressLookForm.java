package com.superai.common.core.domain.model.tool;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @author AL
 * @date 2023/3/28 10:23
 */
@Data
public class ExpressLookForm {

    @ApiModelProperty(value = "快递公司编码",required = true)
    @NotBlank(message = "快递公司编码 不能为空")
    private String shipperCode;

    @ApiModelProperty(value = "快递单号",required = true)
    @NotBlank(message = "快递单号 不能为空")
    private String logisticCode;

}
