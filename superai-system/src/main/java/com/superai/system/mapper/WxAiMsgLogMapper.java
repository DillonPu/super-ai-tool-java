package com.superai.system.mapper;


import com.superai.common.core.domain.model.WxByDateGetBody;
import com.superai.common.core.domain.vo.AiChatMsgVO;
import com.superai.system.domain.WxAiMsgLog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * ai对话记录Mapper接口
 * 
 * @author superai
 * @date 2023-03-31
 */
public interface WxAiMsgLogMapper 
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
     * 删除ai对话记录
     * 
     * @param msgId ai对话记录主键
     * @return 结果
     */
    public int deleteWxAiMsgLogByMsgId(String msgId);

    /**
     * 批量删除ai对话记录
     * 
     * @param msgIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWxAiMsgLogByMsgIds(String[] msgIds);

    /**
     * 小程序端分页查询消息记录
     * @param param
     * @param type
     * @return
     */
    List<AiChatMsgVO> listMsgLog(@Param("param") WxByDateGetBody param,
                                 @Param("messageType") String type);
}
