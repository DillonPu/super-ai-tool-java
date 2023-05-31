package com.superai.system.mapper;

import com.superai.common.core.domain.model.WxByDateGetBody;
import com.superai.common.core.domain.vo.WxUserPointAndMoneyLogVO;
import com.superai.system.domain.WxUserPointLog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 微信用户充值记录Mapper接口
 * 
 * @author superai
 * @date 2023-03-23
 */
public interface WxUserPointLogMapper 
{
    /**
     * 查询微信用户充值记录
     * 
     * @param id 微信用户充值记录主键
     * @return 微信用户充值记录
     */
    WxUserPointLog selectWxUserPointLogById(String id);

    /**
     * 查询微信用户充值记录列表
     * 
     * @param wxUserPointLog 微信用户充值记录
     * @return 微信用户充值记录集合
     */
    List<WxUserPointLog> selectWxUserPointLogList(WxUserPointLog wxUserPointLog);

    /**
     * 新增微信用户充值记录
     * 
     * @param wxUserPointLog 微信用户充值记录
     * @return 结果
     */
    int insertWxUserPointLog(WxUserPointLog wxUserPointLog);

    /**
     * 修改微信用户充值记录
     * 
     * @param wxUserPointLog 微信用户充值记录
     * @return 结果
     */
    int updateWxUserPointLog(WxUserPointLog wxUserPointLog);

    /**
     * 删除微信用户充值记录
     * 
     * @param id 微信用户充值记录主键
     * @return 结果
     */
    int deleteWxUserPointLogById(String id);

    /**
     * 批量删除微信用户充值记录
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteWxUserPointLogByIds(String[] ids);

    /**
     * 获取当天签到积分
     * @param userId
     * @param code
     * @return
     */
    Integer getDaySignPoint(@Param("userId") Long userId, @Param("code") String code);

    /**
     * 查询积分记录
     * @param param
     * @return
     */
    List<WxUserPointAndMoneyLogVO> listPointLog(@Param("param") WxByDateGetBody param);

    /**
     * 获取总积分
     * @param userId
     * @return
     */
    Integer getTotalPoint(@Param("userId") Long userId);
}
