package com.superai.common.core.domain.model;

import com.superai.common.core.page.PageDomain;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/** 
 * 根据日期间隔查询请求参数
 * @date  2023/3/27 15:18
 * @author AL
 **/
@Data
public class WxByDateGetBody extends PageDomain {

    @ApiModelProperty("开始时间 年月日")
    private Date beginDate;

    @ApiModelProperty("结束时间 年月日")
    private Date endDate;

    @ApiModelProperty(hidden = true)
    private Long userId;
}
