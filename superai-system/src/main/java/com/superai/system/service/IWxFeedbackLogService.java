package com.superai.system.service;

import com.superai.common.core.domain.model.WxFeedbackAddBody;
import com.superai.common.core.domain.model.WxFeedbackDetailGetBody;
import com.superai.common.core.domain.model.WxFeedbackGetBody;
import com.superai.common.core.domain.vo.WxFeedbackLogDetailVO;
import com.superai.common.core.domain.vo.WxFeedbackLogVO;
import com.superai.system.domain.WxFeedbackLog;

import java.util.List;

/**
 * 问题反馈Service接口
 * 
 * @author superai
 * @date 2023-04-03
 */
public interface IWxFeedbackLogService 
{
    /**
     * 查询问题反馈
     * 
     * @param id 问题反馈主键
     * @return 问题反馈
     */
    public WxFeedbackLog selectWxFeedbackLogById(String id);

    /**
     * 查询问题反馈列表
     * 
     * @param wxFeedbackLog 问题反馈
     * @return 问题反馈集合
     */
    public List<WxFeedbackLog> selectWxFeedbackLogList(WxFeedbackLog wxFeedbackLog);

    /**
     * 新增问题反馈
     * 
     * @param wxFeedbackLog 问题反馈
     * @return 结果
     */
    public int insertWxFeedbackLog(WxFeedbackLog wxFeedbackLog);

    /**
     * 修改问题反馈
     * 
     * @param wxFeedbackLog 问题反馈
     * @return 结果
     */
    public int updateWxFeedbackLog(WxFeedbackLog wxFeedbackLog);

    /**
     * 批量删除问题反馈
     * 
     * @param ids 需要删除的问题反馈主键集合
     * @return 结果
     */
    public int deleteWxFeedbackLogByIds(String[] ids);

    /**
     * 删除问题反馈信息
     * 
     * @param id 问题反馈主键
     * @return 结果
     */
    public int deleteWxFeedbackLogById(String id);

    /**
     *
     * @param param
     * @return
     */
    boolean addFeedback(WxFeedbackAddBody param);

    /**
     * 查询反馈列表
     * @param param
     * @return
     */
    List<WxFeedbackLogVO> listFeedback(WxFeedbackGetBody param);

    /**
     * 查询反馈详情
     * @param param
     * @return
     */
    WxFeedbackLogDetailVO getFeedbackDetail(WxFeedbackDetailGetBody param);
}
