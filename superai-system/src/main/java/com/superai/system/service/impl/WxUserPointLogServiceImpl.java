package com.superai.system.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Objects;

import com.superai.common.constant.Constants;
import com.superai.common.core.domain.entity.SysUser;
import com.superai.common.core.domain.model.WxByDateGetBody;
import com.superai.common.core.domain.vo.WxUserPointAndMoneyLogVO;
import com.superai.common.enums.tool.PointFromEnum;
import com.superai.common.enums.tool.PointToEnum;
import com.superai.common.exception.user.UserPointNoEnoughException;
import com.superai.common.utils.DateUtils;
import com.superai.common.utils.SecurityUtils;
import com.superai.common.utils.uuid.UUID;
import com.superai.system.domain.WxUserPointLog;
import com.superai.system.mapper.WxUserPointLogMapper;
import com.superai.system.service.ISysUserService;
import org.apache.commons.lang3.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.superai.system.service.IWxUserPointLogService;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * 微信用户充值记录Service业务层处理
 * 
 * @author superai
 * @date 2023-03-23
 */
@Service
public class WxUserPointLogServiceImpl implements IWxUserPointLogService
{
    @Autowired
    private WxUserPointLogMapper wxUserPointLogMapper;

    @Resource
    private ISysUserService sysUserService;

    /**
     * 查询微信用户充值记录
     * 
     * @param id 微信用户充值记录主键
     * @return 微信用户充值记录
     */
    @Override
    public WxUserPointLog selectWxUserPointLogById(String id)
    {
        return wxUserPointLogMapper.selectWxUserPointLogById(id);
    }

    /**
     * 查询微信用户充值记录列表
     * 
     * @param wxUserPointLog 微信用户充值记录
     * @return 微信用户充值记录
     */
    @Override
    public List<WxUserPointLog> selectWxUserPointLogList(WxUserPointLog wxUserPointLog)
    {
        return wxUserPointLogMapper.selectWxUserPointLogList(wxUserPointLog);
    }

    /**
     * 新增微信用户充值记录
     * 
     * @param wxUserPointLog 微信用户充值记录
     * @return 结果
     */
    @Override
    public int insertWxUserPointLog(WxUserPointLog wxUserPointLog)
    {
        wxUserPointLog.setCreateTime(DateUtils.getNowDate());
        return wxUserPointLogMapper.insertWxUserPointLog(wxUserPointLog);
    }

    /**
     * 修改微信用户充值记录
     * 
     * @param wxUserPointLog 微信用户充值记录
     * @return 结果
     */
    @Override
    public int updateWxUserPointLog(WxUserPointLog wxUserPointLog)
    {
        wxUserPointLog.setUpdateTime(DateUtils.getNowDate());
        return wxUserPointLogMapper.updateWxUserPointLog(wxUserPointLog);
    }

    /**
     * 批量删除微信用户充值记录
     * 
     * @param ids 需要删除的微信用户充值记录主键
     * @return 结果
     */
    @Override
    public int deleteWxUserPointLogByIds(String[] ids)
    {
        return wxUserPointLogMapper.deleteWxUserPointLogByIds(ids);
    }

    /**
     * 删除微信用户充值记录信息
     * 
     * @param id 微信用户充值记录主键
     * @return 结果
     */
    @Override
    public int deleteWxUserPointLogById(String id)
    {
        return wxUserPointLogMapper.deleteWxUserPointLogById(id);
    }

    /**
     * 若已签到 返回0 ，若未签到签到得1-3之间的随机积分
     *
     * @param userId
     * @return
     */
    @Override
    public Integer increasePointByDaySignPoint(Long userId) {
        Integer point = wxUserPointLogMapper.getDaySignPoint(userId, PointFromEnum.FROM_SIGN.getCode());
        if (Objects.isNull(point)){
            // 签到随机得分，可能获取1，2，3分
            int signPoint = RandomUtils.nextInt(1, 4);
            this.addPoint(userId,signPoint,PointFromEnum.FROM_SIGN);
            return signPoint;
        }
        return 0;
    }

    /**
     * 看视频广告获取积分 默认获取积分 WX_LOOK_AD_VIDEO_POINT
     * @param userId
     * @return
     */
    @Override
    public Integer increasePointByLookAdVideo(Long userId) {
        this.addPoint(userId, Constants.WX_LOOK_AD_VIDEO_POINT,PointFromEnum.FROM_LOOK_VIDEO);
        return Constants.WX_LOOK_AD_VIDEO_POINT;
    }

    /**
     * 消耗积分
     *
     * @param pointToEnum
     * @return
     */
    @Transactional(rollbackFor = {Exception.class})
    @Override
    public Integer decreasePointByPay(PointToEnum pointToEnum) {
        Long userId = SecurityUtils.getUserId();
        checkTotalPointIsEnough(pointToEnum);
        this.subtractPoint(userId,pointToEnum);
        return pointToEnum.getPoint();
    }

    /**
     * 判断查询余额积分是否不够够消耗
     * @param pointToEnum
     * @return true 足够，false：不够
     */
    @Override
    public boolean checkTotalPointIsEnough(PointToEnum pointToEnum){
        Long userId = SecurityUtils.getUserId();
        // 查询余额积分是否够消耗
        SysUser sysUser = sysUserService.selectUserById(userId);
        boolean isEnough = sysUser.getTotalPoint()-pointToEnum.getPoint()>=0;
        if (!isEnough){
            throw new UserPointNoEnoughException();
        }
        return isEnough;
    }

    /**
     * 获取积分记录
     *
     * @param param
     * @return
     */
    @Override
    public List<WxUserPointAndMoneyLogVO> listPointLog(WxByDateGetBody param) {
        return wxUserPointLogMapper.listPointLog(param);
    }

    /**
     * 获取总积分
     *
     * @param userId
     * @return
     */
    @Override
    public Integer getTotalPoint(Long userId) {
        Integer totalPoint = wxUserPointLogMapper.getTotalPoint(userId);
        if (Objects.isNull(totalPoint)){
            return 0;
        }
        return totalPoint;
    }

    /**
     * 获得积分记录
     * @param userId
     * @param point
     * @param fromEnum
     */
    private void addPoint(Long userId,Integer point,PointFromEnum fromEnum){
        WxUserPointLog pointLog = new WxUserPointLog();
        pointLog.setId(UUID.fastUUID().toString());
        pointLog.setUserId(userId);
        pointLog.setPoint(point);
        pointLog.setPointFrom(fromEnum.getCode());
        pointLog.setDescription(fromEnum.getInfo());
        pointLog.setCreateTime(new Date());
        pointLog.setCreateBy(SecurityUtils.getUsername());
        int i = wxUserPointLogMapper.insertWxUserPointLog(pointLog);
        if (i>0){
            sysUserService.addTotalPoint(userId, point);
        }
    }

    /**
     * 消耗积分记录
     * @param userId
     * @param pointToEnum
     */
    private void subtractPoint(Long userId,PointToEnum pointToEnum){
        WxUserPointLog pointLog = new WxUserPointLog();
        pointLog.setId(UUID.fastUUID().toString());
        pointLog.setUserId(userId);
        // 消耗积分的类型 存入负数
        pointLog.setPoint(0-pointToEnum.getPoint());
        pointLog.setPointTo(pointToEnum.getCode());
        pointLog.setDescription(pointToEnum.getDesc());
        pointLog.setCreateTime(new Date());
        pointLog.setCreateBy(SecurityUtils.getUsername());
        int i = wxUserPointLogMapper.insertWxUserPointLog(pointLog);
        if (i>0){
            sysUserService.subtractTotalPoint(userId, pointToEnum.getPoint());
        }
    }


    public static void main(String[] args) {
        for (int i = 0; i < 10 ; i++) {
            int x = RandomUtils.nextInt(1, 4);
            System.err.println(x);
        }

    }
}
