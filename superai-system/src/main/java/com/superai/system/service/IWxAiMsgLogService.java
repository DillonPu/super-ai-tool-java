package com.superai.system.service;

import com.superai.common.core.domain.model.WxByDateGetBody;
import com.superai.common.core.domain.vo.AiChatMsgVO;
import com.superai.common.enums.tool.MESSAGE_TYPE;
import com.superai.system.domain.WxAiMsgLog;

import java.util.List;

/**
 * ai对话记录Service接口
 * 
 * @author superai
 * @date 2023-03-31
 */
public interface IWxAiMsgLogService 
{
    /**
     * 查询ai对话记录
     * 
     * @param msgId ai对话记录主键
     * @return ai对话记录
     */
    public WxAiMsgLog selectWxAiMsgLogByMsgId(String msgId);

    /**
     * 查询ai对话记录列表
     * 
     * @param wxAiMsgLog ai对话记录
     * @return ai对话记录集合
     */
    public List<WxAiMsgLog> selectWxAiMsgLogList(WxAiMsgLog wxAiMsgLog);

    /**
     * 新增ai对话记录
     * 
     * @param wxAiMsgLog ai对话记录
     * @return 结果
     */
    public int insertWxAiMsgLog(WxAiMsgLog wxAiMsgLog);

    /**
     * 修改ai对话记录
     * 
     * @param wxAiMsgLog ai对话记录
     * @return 结果
     */
    public int updateWxAiMsgLog(WxAiMsgLog wxAiMsgLog);

    /**
     * 批量删除ai对话记录
     * 
     * @param msgIds 需要删除的ai对话记录主键集合
     * @return 结果
     */
    public int deleteWxAiMsgLogByMsgIds(String[] msgIds);

    /**
     * 删除ai对话记录信息
     * 
     * @param msgId ai对话记录主键
     * @return 结果
     */
    public int deleteWxAiMsgLogByMsgId(String msgId);

    /**
     * 查询ai聊天消息记录
     * @param param
     * @param messageTypeEnum
     * @return
     */
    List<AiChatMsgVO> listMsgLog(WxByDateGetBody param, MESSAGE_TYPE messageTypeEnum);
}
