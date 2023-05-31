package com.superai.system.service.impl;

import com.superai.common.core.domain.model.WxByDateGetBody;
import com.superai.common.core.domain.vo.AiChatMsgVO;
import com.superai.common.enums.tool.MESSAGE_TYPE;
import com.superai.common.utils.DateUtils;
import com.superai.system.domain.WxAiMsgLog;
import com.superai.system.mapper.WxAiMsgLogMapper;
import com.superai.system.service.IWxAiMsgLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ai对话记录Service业务层处理
 * 
 * @author superai
 * @date 2023-03-31
 */
@Service
public class WxAiMsgLogServiceImpl implements IWxAiMsgLogService
{
    @Autowired
    private WxAiMsgLogMapper wxAiMsgLogMapper;

    /**
     * 查询ai对话记录
     * 
     * @param msgId ai对话记录主键
     * @return ai对话记录
     */
    @Override
    public WxAiMsgLog selectWxAiMsgLogByMsgId(String msgId)
    {
        return wxAiMsgLogMapper.selectWxAiMsgLogByMsgId(msgId);
    }

    /**
     * 查询ai对话记录列表
     * 
     * @param wxAiMsgLog ai对话记录
     * @return ai对话记录
     */
    @Override
    public List<WxAiMsgLog> selectWxAiMsgLogList(WxAiMsgLog wxAiMsgLog)
    {
        return wxAiMsgLogMapper.selectWxAiMsgLogList(wxAiMsgLog);
    }

    /**
     * 新增ai对话记录
     * 
     * @param wxAiMsgLog ai对话记录
     * @return 结果
     */
    @Override
    public int insertWxAiMsgLog(WxAiMsgLog wxAiMsgLog)
    {
        wxAiMsgLog.setCreateTime(DateUtils.getNowDate());
        return wxAiMsgLogMapper.insertWxAiMsgLog(wxAiMsgLog);
    }

    /**
     * 修改ai对话记录
     * 
     * @param wxAiMsgLog ai对话记录
     * @return 结果
     */
    @Override
    public int updateWxAiMsgLog(WxAiMsgLog wxAiMsgLog)
    {
        wxAiMsgLog.setUpdateTime(DateUtils.getNowDate());
        return wxAiMsgLogMapper.updateWxAiMsgLog(wxAiMsgLog);
    }

    /**
     * 批量删除ai对话记录
     * 
     * @param msgIds 需要删除的ai对话记录主键
     * @return 结果
     */
    @Override
    public int deleteWxAiMsgLogByMsgIds(String[] msgIds)
    {
        return wxAiMsgLogMapper.deleteWxAiMsgLogByMsgIds(msgIds);
    }

    /**
     * 删除ai对话记录信息
     * 
     * @param msgId ai对话记录主键
     * @return 结果
     */
    @Override
    public int deleteWxAiMsgLogByMsgId(String msgId)
    {
        return wxAiMsgLogMapper.deleteWxAiMsgLogByMsgId(msgId);
    }

    /**
     * 查询ai聊天消息记录
     *
     * @param param
     * @param messageTypeEnum
     * @return
     */
    @Override
    public List<AiChatMsgVO> listMsgLog(WxByDateGetBody param, MESSAGE_TYPE messageTypeEnum) {
        return wxAiMsgLogMapper.listMsgLog(param,messageTypeEnum.getType());
    }
}
