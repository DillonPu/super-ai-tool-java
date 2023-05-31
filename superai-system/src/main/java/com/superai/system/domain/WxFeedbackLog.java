package com.superai.system.domain;

import com.superai.common.annotation.Excel;
import com.superai.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 问题反馈对象 wx_feedback_log
 * 
 * @author superai
 * @date 2023-04-03
 */
public class WxFeedbackLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 消息id */
    private String id;

    /** 反馈用户id */
    @Excel(name = "反馈用户id")
    private Long userId;

    /** 问题标题 */
    @Excel(name = "问题标题")
    private String questionTitle;

    /** 问题描述 */
    @Excel(name = "问题描述")
    private String questionDesc;

    /** 问题分类 */
    @Excel(name = "问题分类")
    private String questionType;

    /** 答复 */
    @Excel(name = "答复")
    private String answer;

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    @Excel(name = "联系方式")
    private String contact;

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setQuestionTitle(String questionTitle) 
    {
        this.questionTitle = questionTitle;
    }

    public String getQuestionTitle() 
    {
        return questionTitle;
    }
    public void setQuestionDesc(String questionDesc) 
    {
        this.questionDesc = questionDesc;
    }

    public String getQuestionDesc() 
    {
        return questionDesc;
    }
    public void setQuestionType(String questionType) 
    {
        this.questionType = questionType;
    }

    public String getQuestionType() 
    {
        return questionType;
    }
    public void setAnswer(String answer) 
    {
        this.answer = answer;
    }

    public String getAnswer() 
    {
        return answer;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("questionTitle", getQuestionTitle())
            .append("questionDesc", getQuestionDesc())
            .append("questionType", getQuestionType())
            .append("answer", getAnswer())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
