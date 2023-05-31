package com.superai.web.controller.weixin;

import javax.servlet.http.HttpServletResponse;

import com.superai.common.utils.poi.ExcelUtil;
import com.superai.system.domain.WxAbnormalWord;
import com.superai.system.service.IWxAbnormalWordService;
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
 * 答非所问单词Controller
 * 
 * @author alai
 * @date 2023-04-17
 */
@RestController
@RequestMapping("/weixin/wxAbnormalWord")
public class WxAbnormalWordController extends BaseController
{
    @Autowired
    private IWxAbnormalWordService wxAbnormalWordService;

    /**
     * 查询答非所问单词列表
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxAbnormalWord:list')")
    @GetMapping("/list")
    public TableDataInfo list(WxAbnormalWord wxAbnormalWord)
    {
        startPage();
        List<WxAbnormalWord> list = wxAbnormalWordService.selectWxAbnormalWordList(wxAbnormalWord);
        return getDataTable(list);
    }

    /**
     * 导出答非所问单词列表
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxAbnormalWord:export')")
    @Log(title = "答非所问单词", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WxAbnormalWord wxAbnormalWord)
    {
        List<WxAbnormalWord> list = wxAbnormalWordService.selectWxAbnormalWordList(wxAbnormalWord);
        ExcelUtil<WxAbnormalWord> util = new ExcelUtil<WxAbnormalWord>(WxAbnormalWord.class);
        util.exportExcel(response, list, "答非所问单词数据");
    }

    /**
     * 获取答非所问单词详细信息
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxAbnormalWord:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(wxAbnormalWordService.selectWxAbnormalWordById(id));
    }

    /**
     * 新增答非所问单词
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxAbnormalWord:add')")
    @Log(title = "答非所问单词", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WxAbnormalWord wxAbnormalWord)
    {
        return toAjax(wxAbnormalWordService.insertWxAbnormalWord(wxAbnormalWord));
    }

    /**
     * 修改答非所问单词
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxAbnormalWord:edit')")
    @Log(title = "答非所问单词", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WxAbnormalWord wxAbnormalWord)
    {
        return toAjax(wxAbnormalWordService.updateWxAbnormalWord(wxAbnormalWord));
    }

    /**
     * 删除答非所问单词
     */
    @PreAuthorize("@ss.hasPermi('weixin:wxAbnormalWord:remove')")
    @Log(title = "答非所问单词", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(wxAbnormalWordService.deleteWxAbnormalWordByIds(ids));
    }
}
