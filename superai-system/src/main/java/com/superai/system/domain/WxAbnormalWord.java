package com.superai.system.domain;

import com.superai.common.annotation.Excel;
import com.superai.common.core.domain.BaseEntity;
import lombok.*;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 答非所问单词对象 wx_abnormal_word
 * 
 * @author alai
 * @date 2023-04-17
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class WxAbnormalWord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 主语 */
    @Excel(name = "主语")
    private String subject;

    /** 谓语 */
    @Excel(name = "谓语")
    private String predicate;

    /** 宾语 */
    @Excel(name = "宾语")
    private String object;

    /** 定语 */
    @Excel(name = "定语")
    private String attribute;

    /** 状语 */
    @Excel(name = "状语")
    private String adverbial;

    /** 补语 */
    @Excel(name = "补语")
    private String complement;

}
