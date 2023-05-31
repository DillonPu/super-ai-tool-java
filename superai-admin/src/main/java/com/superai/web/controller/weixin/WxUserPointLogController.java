package com.superai.web.controller.weixin;

import javax.servlet.http.HttpServletResponse;

import com.superai.common.utils.poi.ExcelUtil;
import com.superai.system.domain.WxUserPointLog;
import com.superai.system.service.IWxUserPointLogService;
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

import java.util.List;

/**
 * 微信用户充值记录Controller
 * 
 * @author superai
 * @date 2023-03-23
 */
@RestController
@RequestMapping("/weixin/wxUserPointLog")
public class WxUserPointLogController extends BaseController
{
    @Autowired
    private IWxUserPointLogService wxUserPointLogService;

    /**
     * 查询微信用户充值记录列表
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxUserPointLog:list')")
    @GetMapping("/list")
    public TableDataInfo list(WxUserPointLog wxUserPointLog)
    {
        startPage();
        List<WxUserPointLog> list = wxUserPointLogService.selectWxUserPointLogList(wxUserPointLog);
        return getDataTable(list);
    }

    /**
     * 导出微信用户充值记录列表
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxUserPointLog:export')")
    @Log(title = "微信用户充值记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WxUserPointLog wxUserPointLog)
    {
        List<WxUserPointLog> list = wxUserPointLogService.selectWxUserPointLogList(wxUserPointLog);
        ExcelUtil<WxUserPointLog> util = new ExcelUtil<WxUserPointLog>(WxUserPointLog.class);
        util.exportExcel(response, list, "微信用户充值记录数据");
    }

    /**
     * 获取微信用户充值记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxUserPointLog:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return success(wxUserPointLogService.selectWxUserPointLogById(id));
    }

    /**
     * 新增微信用户充值记录
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxUserPointLog:add')")
    @Log(title = "微信用户充值记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WxUserPointLog wxUserPointLog)
    {
        return toAjax(wxUserPointLogService.insertWxUserPointLog(wxUserPointLog));
    }

    /**
     * 修改微信用户充值记录
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxUserPointLog:edit')")
    @Log(title = "微信用户充值记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WxUserPointLog wxUserPointLog)
    {
        return toAjax(wxUserPointLogService.updateWxUserPointLog(wxUserPointLog));
    }

    /**
     * 删除微信用户充值记录
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxUserPointLog:remove')")
    @Log(title = "微信用户充值记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(wxUserPointLogService.deleteWxUserPointLogByIds(ids));
    }
}
