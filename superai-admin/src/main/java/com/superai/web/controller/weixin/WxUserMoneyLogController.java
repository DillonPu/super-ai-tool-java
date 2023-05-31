package com.superai.web.controller.weixin;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.superai.system.domain.WxUserMoneyLog;
import com.superai.system.service.IWxUserMoneyLogService;
import com.superai.common.utils.poi.ExcelUtil;
import com.superai.common.core.page.TableDataInfo;

/**
 * 微信用户充值消费记录Controller
 * 
 * @author superai
 * @date 2023-03-23
 */
@RestController
@RequestMapping("/weixin/wxUserMoneyLog")
public class WxUserMoneyLogController extends BaseController
{
    @Autowired
    private IWxUserMoneyLogService wxUserMoneyLogService;

    /**
     * 查询微信用户充值消费记录列表
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxUserMoneyLog:list')")
    @GetMapping("/list")
    public TableDataInfo list(WxUserMoneyLog wxUserMoneyLog)
    {
        startPage();
        List<WxUserMoneyLog> list = wxUserMoneyLogService.selectWxUserMoneyLogList(wxUserMoneyLog);
        return getDataTable(list);
    }

    /**
     * 导出微信用户充值消费记录列表
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxUserMoneyLog:export')")
    @Log(title = "微信用户充值消费记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WxUserMoneyLog wxUserMoneyLog)
    {
        List<WxUserMoneyLog> list = wxUserMoneyLogService.selectWxUserMoneyLogList(wxUserMoneyLog);
        ExcelUtil<WxUserMoneyLog> util = new ExcelUtil<WxUserMoneyLog>(WxUserMoneyLog.class);
        util.exportExcel(response, list, "微信用户充值消费记录数据");
    }

    /**
     * 获取微信用户充值消费记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxUserMoneyLog:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return success(wxUserMoneyLogService.selectWxUserMoneyLogById(id));
    }

    /**
     * 新增微信用户充值消费记录
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxUserMoneyLog:add')")
    @Log(title = "微信用户充值消费记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WxUserMoneyLog wxUserMoneyLog)
    {
        return toAjax(wxUserMoneyLogService.insertWxUserMoneyLog(wxUserMoneyLog));
    }

    /**
     * 修改微信用户充值消费记录
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxUserMoneyLog:edit')")
    @Log(title = "微信用户充值消费记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WxUserMoneyLog wxUserMoneyLog)
    {
        return toAjax(wxUserMoneyLogService.updateWxUserMoneyLog(wxUserMoneyLog));
    }

    /**
     * 删除微信用户充值消费记录
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxUserMoneyLog:remove')")
    @Log(title = "微信用户充值消费记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(wxUserMoneyLogService.deleteWxUserMoneyLogByIds(ids));
    }
}
