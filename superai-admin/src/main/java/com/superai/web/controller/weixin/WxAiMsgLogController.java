package com.superai.web.controller.weixin;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.superai.common.utils.poi.ExcelUtil;
import com.superai.system.domain.WxAiMsgLog;
import com.superai.system.service.IWxAiMsgLogService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.superai.common.annotation.Log;
import com.superai.common.core.controller.BaseController;
import com.superai.common.core.domain.AjaxResult;
import com.superai.common.enums.BusinessType;
import com.superai.common.core.page.TableDataInfo;

/**
 * ai对话记录Controller
 * 
 * @author superai
 * @date 2023-03-31
 */
@RestController
@RequestMapping("/weixin/wxAiMsgLog")
public class WxAiMsgLogController extends BaseController
{
    @Autowired
    private IWxAiMsgLogService wxAiMsgLogService;

    /**
     * 查询ai对话记录列表
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxAiMsgLog:list')")
    @GetMapping("/list")
    public TableDataInfo list(WxAiMsgLog wxAiMsgLog)
    {
        startPage();
        List<WxAiMsgLog> list = wxAiMsgLogService.selectWxAiMsgLogList(wxAiMsgLog);
        return getDataTable(list);
    }

    /**
     * 导出ai对话记录列表
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxAiMsgLog:export')")
    @Log(title = "ai对话记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WxAiMsgLog wxAiMsgLog)
    {
        List<WxAiMsgLog> list = wxAiMsgLogService.selectWxAiMsgLogList(wxAiMsgLog);
        ExcelUtil<WxAiMsgLog> util = new ExcelUtil<WxAiMsgLog>(WxAiMsgLog.class);
        util.exportExcel(response, list, "ai对话记录数据");
    }

    /**
     * 获取ai对话记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxAiMsgLog:query')")
    @GetMapping(value = "/{msgId}")
    public AjaxResult getInfo(@PathVariable("msgId") String msgId)
    {
        return success(wxAiMsgLogService.selectWxAiMsgLogByMsgId(msgId));
    }

    /**
     * 新增ai对话记录
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxAiMsgLog:add')")
    @Log(title = "ai对话记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WxAiMsgLog wxAiMsgLog)
    {
        return toAjax(wxAiMsgLogService.insertWxAiMsgLog(wxAiMsgLog));
    }

    /**
     * 修改ai对话记录
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxAiMsgLog:edit')")
    @Log(title = "ai对话记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WxAiMsgLog wxAiMsgLog)
    {
        return toAjax(wxAiMsgLogService.updateWxAiMsgLog(wxAiMsgLog));
    }

    /**
     * 删除ai对话记录
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxAiMsgLog:remove')")
    @Log(title = "ai对话记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{msgIds}")
    public AjaxResult remove(@PathVariable String[] msgIds)
    {
        return toAjax(wxAiMsgLogService.deleteWxAiMsgLogByMsgIds(msgIds));
    }
}
