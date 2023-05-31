package com.superai.web.controller.weixin;

import com.superai.common.constant.Constants;
import com.superai.common.core.controller.BaseController;
import com.superai.common.core.domain.AjaxResult;
import com.superai.common.core.domain.model.*;
import com.superai.common.core.domain.vo.*;
import com.superai.common.core.page.TableDataInfo;
import com.superai.common.enums.tool.MESSAGE_TYPE;
import com.superai.common.enums.tool.PointToEnum;
import com.superai.common.utils.SecurityUtils;
import com.superai.framework.web.service.WxAuthService;
import com.superai.system.service.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Objects;

/**
 * 微信授权Controller
 * 
 * @author superai
 * @date 2023-03-23
 */
@Api(tags = "微信个人中心",value = "微信个人中心")
@RestController
@RequestMapping("/weixin/auth")
public class WxAuthController extends BaseController
{
    @Autowired
    private WxAuthService wxAuthService;

    @Resource
    private IWxUserMoneyLogService wxUserMoneyLogService;

    @Resource
    private IWxUserPointLogService wxUserPointLogService;

    @Resource
    private ISysUserService sysUserService;

    @Resource
    private IWxAiMsgLogService aiMsgLogService;

    @Resource
    private IWxFeedbackLogService wxFeedbackLogService;

    /**
     * 查询微信用户信息列表
     */
    @PostMapping("/loginOrRegister")
    public AjaxResult loginOrRegister(@RequestBody WxLoginBody wxLoginBody)
    {
        AjaxResult ajax = new AjaxResult();
        String token = wxAuthService.loginOrRegister(wxLoginBody.getCode());
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }

    /**
     * 查询微信用户信息
     */
    @PostMapping("/getInfo")
    public AjaxResult getInfo()
    {
        Long userId = SecurityUtils.getUserId();
        WxUserInfo info = sysUserService.selectWxUserInfoById(userId);
        Boolean daySign = !Objects.isNull(info.getDaySignPoint());
        info.setDaySign(daySign);
        info.setIsLogin(Boolean.TRUE);
        Integer historyTotalPoint = wxUserPointLogService.getTotalPoint(userId);
        info.setHistoryTotalPoint(historyTotalPoint);
        return AjaxResult.success(info);
    }

    @ApiOperation("获取历史总积分")
    @PostMapping("/getTotalPoint")
    public AjaxResult getTotalPoint()
    {
        Long userId = SecurityUtils.getUserId();
        Integer totalPoint = wxUserPointLogService.getTotalPoint(userId);
        return AjaxResult.success(totalPoint);
    }

    /**
     * 自主修改用户信息
     */
    @PostMapping("/updateInfo")
    public AjaxResult updateInfo(@RequestBody WxInfoUpdateBody param)
    {
        wxAuthService.updateInfo(param);
        return AjaxResult.success();
    }

    @ApiOperation(value = "日常签到得积分")
    @PostMapping("/increasePointByDaySignPoint")
    public AjaxResult increasePointByDaySignPoint()
    {
        Long userId = SecurityUtils.getUserId();
        Integer point = wxUserPointLogService.increasePointByDaySignPoint(userId);
        return AjaxResult.success(point);
    }

    @ApiOperation(value = "看广告视频得积分")
    @PostMapping("/increasePointByLookAdVideo")
    public AjaxResult increasePointByLookAdVideo()
    {
        Long userId = SecurityUtils.getUserId();
        Integer point = wxUserPointLogService.increasePointByLookAdVideo(userId);
        return AjaxResult.success(point);
    }

    @ApiOperation(value = "消耗积分")
    @PostMapping("/decreasePointByPay")
    public AjaxResult decreasePointByPay(@RequestBody WxPayPointBody param)
    {
        PointToEnum pointToEnum = PointToEnum.getByCode(param.getPayCode());
        Integer point = wxUserPointLogService.decreasePointByPay(pointToEnum);
        return AjaxResult.success(point);
    }


    @ApiOperation(value = "查询充值消费记录")
    @PostMapping("/listMoneyLog")
    public TableDataInfo listMoneyLog(@RequestBody WxByDateGetBody param)
    {
        startPage(param.getPageNum(),param.getPageSize());
        param.setUserId(SecurityUtils.getUserId());
        List<WxUserPointAndMoneyLogVO> list = wxUserMoneyLogService.listMoneyLog(param);
        return getDataTable(list);
    }

    @ApiOperation(value = "查询积分记录")
    @PostMapping("/listPointLog")
    public TableDataInfo listPointLog(@RequestBody WxByDateGetBody param)
    {
        startPage(param.getPageNum(),param.getPageSize());
        param.setUserId(SecurityUtils.getUserId());
        List<WxUserPointAndMoneyLogVO> list = wxUserPointLogService.listPointLog(param);
        return getDataTable(list);
    }

    @ApiOperation(value = "查询Ai文字聊天记录")
    @PostMapping("/getAiChatLog")
    public TableDataInfo getAiChatLog(@RequestBody WxByDateGetBody param)
    {
        startPage(param.getPageNum(),param.getPageSize());
        param.setUserId(SecurityUtils.getUserId());
        List<AiChatMsgVO> list = aiMsgLogService.listMsgLog(param, MESSAGE_TYPE.TEXT);
        return getDataTable(list);
    }

    @ApiOperation(value = "查询Ai绘画记录")
    @PostMapping("/getAiDrawLog")
    public TableDataInfo getAiDrawLog(@RequestBody WxByDateGetBody param)
    {
        startPage(param.getPageNum(),param.getPageSize());
        param.setUserId(SecurityUtils.getUserId());
        List<AiChatMsgVO> list = aiMsgLogService.listMsgLog(param, MESSAGE_TYPE.IMAGE);
        return getDataTable(list);
    }

    @ApiOperation(value = "添加反馈")
    @PostMapping("/addFeedback")
    public AjaxResult addFeedback(@RequestBody WxFeedbackAddBody param)
    {
        param.setUserId(SecurityUtils.getUserId());
        boolean result = wxFeedbackLogService.addFeedback(param);
        return AjaxResult.success();
    }

    @ApiOperation(value = "查询个人反馈列表")
    @PostMapping("/listFeedback")
    public TableDataInfo listFeedback(@RequestBody WxFeedbackGetBody param)
    {
        startPage(param.getPageNum(),param.getPageSize());
        param.setUserId(SecurityUtils.getUserId());
        List<WxFeedbackLogVO> list = wxFeedbackLogService.listFeedback(param);
        return getDataTable(list);
    }

    @ApiOperation(value = "查询个人反馈详情")
    @PostMapping("/getFeedbackDetail")
    public AjaxResult getFeedbackDetail(@RequestBody WxFeedbackDetailGetBody param)
    {
        WxFeedbackLogDetailVO vo = wxFeedbackLogService.getFeedbackDetail(param);
        return AjaxResult.success(vo);
    }

}
