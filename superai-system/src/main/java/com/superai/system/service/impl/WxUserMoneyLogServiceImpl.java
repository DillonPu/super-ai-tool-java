package com.superai.system.service.impl;

import com.superai.common.core.domain.model.WxByDateGetBody;
import com.superai.common.core.domain.vo.WxUserPointAndMoneyLogVO;
import com.superai.common.utils.DateUtils;
import com.superai.system.domain.WxUserMoneyLog;
import com.superai.system.mapper.WxUserMoneyLogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.superai.system.service.IWxUserMoneyLogService;

import java.util.List;

/**
 * 微信用户充值消费记录Service业务层处理
 * 
 * @author superai
 * @date 2023-03-23
 */
@Service
public class WxUserMoneyLogServiceImpl implements IWxUserMoneyLogService 
{
    @Autowired
    private WxUserMoneyLogMapper wxUserMoneyLogMapper;

    /**
     * 查询微信用户充值消费记录
     * 
     * @param id 微信用户充值消费记录主键
     * @return 微信用户充值消费记录
     */
    @Override
    public WxUserMoneyLog selectWxUserMoneyLogById(String id)
    {
        return wxUserMoneyLogMapper.selectWxUserMoneyLogById(id);
    }

    /**
     * 查询微信用户充值消费记录列表
     * 
     * @param wxUserMoneyLog 微信用户充值消费记录
     * @return 微信用户充值消费记录
     */
    @Override
    public List<WxUserMoneyLog> selectWxUserMoneyLogList(WxUserMoneyLog wxUserMoneyLog)
    {
        return wxUserMoneyLogMapper.selectWxUserMoneyLogList(wxUserMoneyLog);
    }

    /**
     * 新增微信用户充值消费记录
     * 
     * @param wxUserMoneyLog 微信用户充值消费记录
     * @return 结果
     */
    @Override
    public int insertWxUserMoneyLog(WxUserMoneyLog wxUserMoneyLog)
    {
        wxUserMoneyLog.setCreateTime(DateUtils.getNowDate());
        return wxUserMoneyLogMapper.insertWxUserMoneyLog(wxUserMoneyLog);
    }

    /**
     * 修改微信用户充值消费记录
     * 
     * @param wxUserMoneyLog 微信用户充值消费记录
     * @return 结果
     */
    @Override
    public int updateWxUserMoneyLog(WxUserMoneyLog wxUserMoneyLog)
    {
        wxUserMoneyLog.setUpdateTime(DateUtils.getNowDate());
        return wxUserMoneyLogMapper.updateWxUserMoneyLog(wxUserMoneyLog);
    }

    /**
     * 批量删除微信用户充值消费记录
     * 
     * @param ids 需要删除的微信用户充值消费记录主键
     * @return 结果
     */
    @Override
    public int deleteWxUserMoneyLogByIds(String[] ids)
    {
        return wxUserMoneyLogMapper.deleteWxUserMoneyLogByIds(ids);
    }

    /**
     * 删除微信用户充值消费记录信息
     * 
     * @param id 微信用户充值消费记录主键
     * @return 结果
     */
    @Override
    public int deleteWxUserMoneyLogById(String id)
    {
        return wxUserMoneyLogMapper.deleteWxUserMoneyLogById(id);
    }

    /**
     * 小程序端-获取充值消费记录
     *
     * @param param
     * @return
     */
    @Override
    public List<WxUserPointAndMoneyLogVO> listMoneyLog(WxByDateGetBody param) {
        return wxUserMoneyLogMapper.listMoneyLog(param);
    }
}
