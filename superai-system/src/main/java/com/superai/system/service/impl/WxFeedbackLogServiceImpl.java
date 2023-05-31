package com.superai.system.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import com.superai.common.core.domain.model.WxFeedbackAddBody;
import com.superai.common.core.domain.model.WxFeedbackDetailGetBody;
import com.superai.common.core.domain.model.WxFeedbackGetBody;
import com.superai.common.core.domain.vo.WxFeedbackLogDetailVO;
import com.superai.common.core.domain.vo.WxFeedbackLogVO;
import com.superai.common.utils.DateUtils;
import com.superai.common.utils.SecurityUtils;
import com.superai.system.domain.WxFeedbackLog;
import com.superai.system.mapper.WxFeedbackLogMapper;
import com.superai.system.service.IWxFeedbackLogService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 问题反馈Service业务层处理
 * 
 * @author superai
 * @date 2023-04-03
 */
@Service
public class WxFeedbackLogServiceImpl implements IWxFeedbackLogService
{
    @Autowired
    private WxFeedbackLogMapper wxFeedbackLogMapper;

    /**
     * 查询问题反馈
     * 
     * @param id 问题反馈主键
     * @return 问题反馈
     */
    @Override
    public WxFeedbackLog selectWxFeedbackLogById(String id)
    {
        return wxFeedbackLogMapper.selectWxFeedbackLogById(id);
    }

    /**
     * 查询问题反馈列表
     * 
     * @param wxFeedbackLog 问题反馈
     * @return 问题反馈
     */
    @Override
    public List<WxFeedbackLog> selectWxFeedbackLogList(WxFeedbackLog wxFeedbackLog)
    {
        return wxFeedbackLogMapper.selectWxFeedbackLogList(wxFeedbackLog);
    }

    /**
     * 新增问题反馈
     * 
     * @param wxFeedbackLog 问题反馈
     * @return 结果
     */
    @Override
    public int insertWxFeedbackLog(WxFeedbackLog wxFeedbackLog)
    {
        wxFeedbackLog.setCreateTime(DateUtils.getNowDate());
        return wxFeedbackLogMapper.insertWxFeedbackLog(wxFeedbackLog);
    }

    /**
     * 修改问题反馈
     * 
     * @param wxFeedbackLog 问题反馈
     * @return 结果
     */
    @Override
    public int updateWxFeedbackLog(WxFeedbackLog wxFeedbackLog)
    {
        wxFeedbackLog.setUpdateTime(DateUtils.getNowDate());
        return wxFeedbackLogMapper.updateWxFeedbackLog(wxFeedbackLog);
    }

    /**
     * 批量删除问题反馈
     * 
     * @param ids 需要删除的问题反馈主键
     * @return 结果
     */
    @Override
    public int deleteWxFeedbackLogByIds(String[] ids)
    {
        return wxFeedbackLogMapper.deleteWxFeedbackLogByIds(ids);
    }

    /**
     * 删除问题反馈信息
     * 
     * @param id 问题反馈主键
     * @return 结果
     */
    @Override
    public int deleteWxFeedbackLogById(String id)
    {
        return wxFeedbackLogMapper.deleteWxFeedbackLogById(id);
    }

    /**
     * @param param
     * @return
     */
    @Override
    public boolean addFeedback(WxFeedbackAddBody param) {
        WxFeedbackLog log = new WxFeedbackLog();
        BeanUtils.copyProperties(param,log);
        log.setCreateTime(new Date());
        log.setCreateBy(SecurityUtils.getUsername());
        log.setId(UUID.randomUUID().toString());
        return this.insertWxFeedbackLog(log)>0;
    }

    /**
     * 查询反馈列表
     *
     * @param param
     * @return
     */
    @Override
    public List<WxFeedbackLogVO> listFeedback(WxFeedbackGetBody param) {
        return wxFeedbackLogMapper.listFeedback(param);
    }

    /**
     * 查询反馈详情
     *
     * @param param
     * @return
     */
    @Override
    public WxFeedbackLogDetailVO getFeedbackDetail(WxFeedbackDetailGetBody param) {
        return wxFeedbackLogMapper.getFeedbackDetail(param.getId());
    }
}
