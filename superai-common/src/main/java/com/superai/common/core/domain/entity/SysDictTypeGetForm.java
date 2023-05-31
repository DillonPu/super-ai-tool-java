package com.superai.common.core.domain.entity;

import com.superai.common.annotation.Excel;
import com.superai.common.annotation.Excel.ColumnType;
import com.superai.common.core.domain.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

/**
 * 字典类型表 sys_dict_type
 * 
 * @author superai
 */
@Data
public class SysDictTypeGetForm
{
    private static final long serialVersionUID = 1L;

    @ApiModelProperty("字典类型")
    private String dictType;

}
