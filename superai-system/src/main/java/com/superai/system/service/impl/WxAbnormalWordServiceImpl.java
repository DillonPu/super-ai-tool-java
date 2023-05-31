package com.superai.system.service.impl;

import java.util.List;

import com.superai.system.domain.WxAbnormalWord;
import com.superai.system.mapper.WxAbnormalWordMapper;
import com.superai.system.service.IWxAbnormalWordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 答非所问单词Service业务层处理
 * 
 * @author alai
 * @date 2023-04-17
 */
@Service
public class WxAbnormalWordServiceImpl implements IWxAbnormalWordService
{
    @Autowired
    private WxAbnormalWordMapper wxAbnormalWordMapper;

    /**
     * 查询答非所问单词
     * 
     * @param id 答非所问单词主键
     * @return 答非所问单词
     */
    @Override
    public WxAbnormalWord selectWxAbnormalWordById(Long id)
    {
        return wxAbnormalWordMapper.selectWxAbnormalWordById(id);
    }

    /**
     * 查询答非所问单词列表
     * 
     * @param wxAbnormalWord 答非所问单词
     * @return 答非所问单词
     */
    @Override
    public List<WxAbnormalWord> selectWxAbnormalWordList(WxAbnormalWord wxAbnormalWord)
    {
        return wxAbnormalWordMapper.selectWxAbnormalWordList(wxAbnormalWord);
    }

    /**
     * 新增答非所问单词
     * 
     * @param wxAbnormalWord 答非所问单词
     * @return 结果
     */
    @Override
    public int insertWxAbnormalWord(WxAbnormalWord wxAbnormalWord)
    {
        return wxAbnormalWordMapper.insertWxAbnormalWord(wxAbnormalWord);
    }

    /**
     * 修改答非所问单词
     * 
     * @param wxAbnormalWord 答非所问单词
     * @return 结果
     */
    @Override
    public int updateWxAbnormalWord(WxAbnormalWord wxAbnormalWord)
    {
        return wxAbnormalWordMapper.updateWxAbnormalWord(wxAbnormalWord);
    }

    /**
     * 批量删除答非所问单词
     * 
     * @param ids 需要删除的答非所问单词主键
     * @return 结果
     */
    @Override
    public int deleteWxAbnormalWordByIds(Long[] ids)
    {
        return wxAbnormalWordMapper.deleteWxAbnormalWordByIds(ids);
    }

    /**
     * 删除答非所问单词信息
     * 
     * @param id 答非所问单词主键
     * @return 结果
     */
    @Override
    public int deleteWxAbnormalWordById(Long id)
    {
        return wxAbnormalWordMapper.deleteWxAbnormalWordById(id);
    }

    /**
     * 计算收录条数
     *
     * @return
     */
    @Override
    public Integer count() {
        return wxAbnormalWordMapper.count();
    }

    /**
     * 获取指定id的列表
     *
     * @param idList
     * @return
     */
    @Override
    public List<WxAbnormalWord> selectListByIdList(List<Integer> idList) {
        return wxAbnormalWordMapper.selectListByIdList(idList);
    }
}
