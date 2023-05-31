package com.superai.system.service;

import com.superai.common.core.domain.model.WxByDateGetBody;
import com.superai.common.core.domain.vo.WxUserPointAndMoneyLogVO;
import com.superai.common.enums.tool.PointToEnum;
import com.superai.system.domain.WxUserPointLog;

import java.util.List;

/**
 * 微信用户充值记录Service接口
 * 
 * @author superai
 * @date 2023-03-23
 */
public interface IWxUserPointLogService 
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
     * 批量删除微信用户充值记录
     * 
     * @param ids 需要删除的微信用户充值记录主键集合
     * @return 结果
     */
    int deleteWxUserPointLogByIds(String[] ids);

    /**
     * 删除微信用户充值记录信息
     * 
     * @param id 微信用户充值记录主键
     * @return 结果
     */
    int deleteWxUserPointLogById(String id);

    /**
     * 若已签到 返回0 ，若未签到签到得1-3之间的随机积分
     * @param userId
     * @return
     */
    Integer increasePointByDaySignPoint(Long userId);

    /**
     * 看视频广告获取积分 默认获取积分 WX_LOOK_AD_VIDEO_POINT
     * @param userId
     * @return
     */
    Integer increasePointByLookAdVideo(Long userId);

    /**
     * 消耗积分
     * @param pointToEnum
     * @return
     */
    Integer decreasePointByPay(PointToEnum pointToEnum);

    /**
     * 检查积分是否足够使用
     * @param pointToEnum
     * @return
     */
    boolean checkTotalPointIsEnough(PointToEnum pointToEnum);

    /**
     * 获取积分记录
     * @param param
     * @return
     */
    List<WxUserPointAndMoneyLogVO> listPointLog(WxByDateGetBody param);

    /**
     * 获取总积分
     * @param userId
     * @return
     */
    Integer getTotalPoint(Long userId);
}
