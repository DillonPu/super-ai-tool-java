package com.superai.web.controller.weixin;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.superai.common.utils.poi.ExcelUtil;
import com.superai.system.domain.WxFeedbackLog;
import com.superai.system.service.IWxFeedbackLogService;
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
 * 问题反馈Controller
 * 
 * @author superai
 * @date 2023-04-03
 */
@RestController
@RequestMapping("/weixin/wxFeedbackLog")
public class WxFeedbackLogController extends BaseController
{
    @Autowired
    private IWxFeedbackLogService wxFeedbackLogService;

    /**
     * 查询问题反馈列表
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxFeedbackLog:list')")
    @GetMapping("/list")
    public TableDataInfo list(WxFeedbackLog wxFeedbackLog)
    {
        startPage();
        List<WxFeedbackLog> list = wxFeedbackLogService.selectWxFeedbackLogList(wxFeedbackLog);
        return getDataTable(list);
    }

    /**
     * 导出问题反馈列表
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxFeedbackLog:export')")
    @Log(title = "问题反馈", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WxFeedbackLog wxFeedbackLog)
    {
        List<WxFeedbackLog> list = wxFeedbackLogService.selectWxFeedbackLogList(wxFeedbackLog);
        ExcelUtil<WxFeedbackLog> util = new ExcelUtil<WxFeedbackLog>(WxFeedbackLog.class);
        util.exportExcel(response, list, "问题反馈数据");
    }

    /**
     * 获取问题反馈详细信息
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxFeedbackLog:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return success(wxFeedbackLogService.selectWxFeedbackLogById(id));
    }

    /**
     * 新增问题反馈
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxFeedbackLog:add')")
    @Log(title = "问题反馈", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WxFeedbackLog wxFeedbackLog)
    {
        return toAjax(wxFeedbackLogService.insertWxFeedbackLog(wxFeedbackLog));
    }

    /**
     * 修改问题反馈
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxFeedbackLog:edit')")
    @Log(title = "问题反馈", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WxFeedbackLog wxFeedbackLog)
    {
        return toAjax(wxFeedbackLogService.updateWxFeedbackLog(wxFeedbackLog));
    }

    /**
     * 删除问题反馈
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxFeedbackLog:remove')")
    @Log(title = "问题反馈", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(wxFeedbackLogService.deleteWxFeedbackLogByIds(ids));
    }
}
