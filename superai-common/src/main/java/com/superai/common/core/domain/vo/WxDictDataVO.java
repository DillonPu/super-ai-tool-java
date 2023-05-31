package com.superai.common.core.domain.vo;

import com.superai.common.annotation.Excel;
import com.superai.common.annotation.Excel.ColumnType;
import com.superai.common.constant.UserConstants;
import com.superai.common.core.domain.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * 字典数据表 sys_dict_data
 * 
 * @author superai
 */
@Data
public class WxDictDataVO
{
    private static final long serialVersionUID = 1L;

    @ApiModelProperty("字典标签")
    private String dictLabel;

    @ApiModelProperty("字典键值")
    private String dictValue;

    @ApiModelProperty("字典键值")
    private Boolean active = false;

}
