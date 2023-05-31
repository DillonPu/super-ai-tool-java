package com.superai.common.core.domain.model.tool;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/** 
 * 中文转拼音
 * @date  2023/3/28 18:37
 * @author AL
 **/
@Data
public class PinyinGetForm {

    @ApiModelProperty(value = "中文",required = true)
    @NotBlank(message = "中文 不能为空")
    private String origin;
}
