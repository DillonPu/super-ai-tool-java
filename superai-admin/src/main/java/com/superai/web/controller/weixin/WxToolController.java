package com.superai.web.controller.weixin;

import com.superai.common.core.controller.BaseController;
import com.superai.common.core.domain.AjaxResult;
import com.superai.common.core.domain.model.tool.AiChatForm;
import com.superai.common.core.domain.model.tool.BaidubceTokenCodeForm;
import com.superai.common.core.domain.model.tool.ExpressLookForm;
import com.superai.common.core.domain.model.tool.PinyinGetForm;
import com.superai.common.core.domain.vo.AiChatMsgVO;
import com.superai.common.core.domain.vo.ExpressResultVO;
import com.superai.common.core.domain.vo.PinyinInfoVO;
import com.superai.common.enums.tool.MESSAGE_TYPE;
import com.superai.common.exception.user.UserAnswerTypeErrorException;
import com.superai.common.utils.StringUtils;
import com.superai.framework.web.service.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Objects;

/**
 * 微信授权Controller
 * 
 * @author superai
 * @date 2023-03-23
 */
@Api(tags = "微信工具箱",value = "微信工具箱")
@RestController
@RequestMapping("/weixin/tool")
public class WxToolController extends BaseController
{
    @Resource
    private WxToolService wxToolService;

    @Resource
    private WxExpressService expressService;

    @Resource
    private WxBaidubceService wxBaidubceService;

    @Resource
    private WxAiChatService aiChatService;


    @ApiOperation("快递查询")
    @PostMapping("/lookExpress")
    public AjaxResult lookExpress(@RequestBody ExpressLookForm form)
    {
        ExpressResultVO result = expressService.lookExpress(form);
        return AjaxResult.successData(result);
    }

    @ApiOperation("百度智能云Token")
    @PostMapping("/getBaidubceToken")
    public AjaxResult getBaidubceToken(@RequestBody BaidubceTokenCodeForm form)
    {
        String token = wxBaidubceService.getBaidubceToken(form);
        if (StringUtils.isBlank(token)){
            return AjaxResult.error("无法请求baidubce");
        }
        return AjaxResult.successData(token);
    }

    @ApiOperation("汉字转拼音")
    @PostMapping("/getPinyin")
    public AjaxResult getPinyin(@RequestBody PinyinGetForm form)
    {
        PinyinInfoVO pinyin = wxToolService.getPinyin(form);
        return AjaxResult.successData(pinyin);
    }

    @ApiOperation("获取答非所问")
    @PostMapping("/getAiRandomAnswer")
    public AjaxResult getAiRandomAnswer(@RequestBody AiChatForm form)
    {
        AiChatMsgVO vo = aiChatService.getAiChatAnswer(form, MESSAGE_TYPE.RANDOM);
        return AjaxResult.successData(vo);
    }

    @ApiOperation("获取AI机器人对话答案")
    @PostMapping("/getAiRobotChatAnswer")
    public AjaxResult getAiRobotChatAnswer(@RequestBody AiChatForm form)
    {
        AiChatMsgVO vo = aiChatService.getAiChatAnswer(form, MESSAGE_TYPE.ROBOT);
        return AjaxResult.successData(vo);
    }

    @ApiOperation("获取AI对话答案")
    @PostMapping("/getAiChatAnswer")
    public AjaxResult getAiChatAnswer(@RequestBody AiChatForm form)
    {
        MESSAGE_TYPE msgAnswerType = MESSAGE_TYPE.getType(form.getMsgAnswerType());
        if (Objects.isNull(msgAnswerType)){
            throw new UserAnswerTypeErrorException();
        }
        AiChatMsgVO vo = aiChatService.getAiChatAnswer(form, msgAnswerType);
        return AjaxResult.successData(vo);
    }

    @ApiOperation("获取AI绘画答案")
    @PostMapping("/getAiDrawAnswer")
    public AjaxResult getAiDrawAnswer(@RequestBody AiChatForm form)
    {
        AiChatMsgVO vo = aiChatService.getAiChatAnswer(form,MESSAGE_TYPE.IMAGE);
        return AjaxResult.successData(vo);
    }

}
