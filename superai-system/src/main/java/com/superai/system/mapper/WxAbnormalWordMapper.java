package com.superai.system.mapper;

import com.superai.system.domain.WxAbnormalWord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 答非所问单词Mapper接口
 * 
 * @author alai
 * @date 2023-04-17
 */
public interface WxAbnormalWordMapper 
{
    /**
     * 查询答非所问单词
     * 
     * @param id 答非所问单词主键
     * @return 答非所问单词
     */
    public WxAbnormalWord selectWxAbnormalWordById(Long id);

    /**
     * 查询答非所问单词列表
     * 
     * @param wxAbnormalWord 答非所问单词
     * @return 答非所问单词集合
     */
    public List<WxAbnormalWord> selectWxAbnormalWordList(WxAbnormalWord wxAbnormalWord);

    /**
     * 新增答非所问单词
     * 
     * @param wxAbnormalWord 答非所问单词
     * @return 结果
     */
    public int insertWxAbnormalWord(WxAbnormalWord wxAbnormalWord);

    /**
     * 修改答非所问单词
     * 
     * @param wxAbnormalWord 答非所问单词
     * @return 结果
     */
    public int updateWxAbnormalWord(WxAbnormalWord wxAbnormalWord);

    /**
     * 删除答非所问单词
     * 
     * @param id 答非所问单词主键
     * @return 结果
     */
    public int deleteWxAbnormalWordById(Long id);

    /**
     * 批量删除答非所问单词
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWxAbnormalWordByIds(Long[] ids);

    /**
     * 计算总数
     * @return
     */
    Integer count();

    /**
     * 获取指定id的列表
     * @param idList
     * @return
     */
    List<WxAbnormalWord> selectListByIdList(@Param("idList") List<Integer> idList);
}
