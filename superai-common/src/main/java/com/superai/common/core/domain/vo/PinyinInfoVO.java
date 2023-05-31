package com.superai.common.core.domain.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/** 
 * 中文转拼音
 * @date  2023/3/28 18:37
 * @author AL
 **/
@Data
public class PinyinInfoVO {

    @ApiModelProperty(value = "原文字")
    private String origin;

    @ApiModelProperty(value = "有声调的拼音")
    private String markPinYin;

    @ApiModelProperty(value = "数字声调的拼音")
    private String numberPinYin;

    @ApiModelProperty(value = "无声调的拼音")
    private String tonePinYin;

    @ApiModelProperty(value = "首字母")
    private String shortPinYin;

    @ApiModelProperty(value = "繁体")
    private String traditional;

    @ApiModelProperty(value = "简体")
    private String simplified;

    @ApiModelProperty(value = "中音对照")
    private String originAndPinyin;

}
