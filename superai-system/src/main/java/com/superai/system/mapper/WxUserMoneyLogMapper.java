package com.superai.system.mapper;


import com.superai.common.core.domain.model.WxByDateGetBody;
import com.superai.common.core.domain.vo.WxUserPointAndMoneyLogVO;
import com.superai.system.domain.WxUserMoneyLog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 微信用户充值消费记录Mapper接口
 * 
 * @author superai
 * @date 2023-03-23
 */
public interface WxUserMoneyLogMapper 
{
    /**
     * 查询微信用户充值消费记录
     * 
     * @param id 微信用户充值消费记录主键
     * @return 微信用户充值消费记录
     */
    public WxUserMoneyLog selectWxUserMoneyLogById(String id);

    /**
     * 查询微信用户充值消费记录列表
     * 
     * @param wxUserMoneyLog 微信用户充值消费记录
     * @return 微信用户充值消费记录集合
     */
    public List<WxUserMoneyLog> selectWxUserMoneyLogList(WxUserMoneyLog wxUserMoneyLog);

    /**
     * 新增微信用户充值消费记录
     * 
     * @param wxUserMoneyLog 微信用户充值消费记录
     * @return 结果
     */
    public int insertWxUserMoneyLog(WxUserMoneyLog wxUserMoneyLog);

    /**
     * 修改微信用户充值消费记录
     * 
     * @param wxUserMoneyLog 微信用户充值消费记录
     * @return 结果
     */
    public int updateWxUserMoneyLog(WxUserMoneyLog wxUserMoneyLog);

    /**
     * 删除微信用户充值消费记录
     * 
     * @param id 微信用户充值消费记录主键
     * @return 结果
     */
    public int deleteWxUserMoneyLogById(String id);

    /**
     * 批量删除微信用户充值消费记录
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWxUserMoneyLogByIds(String[] ids);

    /**
     * 小程序端-获取充值消费记录
     * @param param
     * @return
     */
    List<WxUserPointAndMoneyLogVO> listMoneyLog(@Param("param") WxByDateGetBody param);
}
