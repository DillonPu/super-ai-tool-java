package com.superai.framework.web.service;


import com.alibaba.fastjson2.JSON;
import com.superai.common.core.domain.model.tool.PinyinGetForm;
import com.superai.common.core.domain.vo.PinyinInfoVO;
import com.superai.common.utils.text.MyPinYinUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;


/**
 * 工具通用
 * @date  2023/3/28 18:37
 * @author AL
 **/
@Slf4j
@Component
public class WxToolService {


    public PinyinInfoVO getPinyin(PinyinGetForm form) {
        PinyinInfoVO vo = new PinyinInfoVO();
        String origin = form.getOrigin();
        if (StringUtils.isBlank(origin)){
            return vo;
        }
        origin = origin.trim();

        // 原文
        vo.setOrigin(origin);
        // 有声调的拼音
        String markPinYin = MyPinYinUtil.changeToMarkPinYin(origin);
        vo.setMarkPinYin(markPinYin);

        // 中音对照
        if (StringUtils.isNotBlank(markPinYin)){
            StringBuilder sb = new StringBuilder();
            String[] markPinyinArr = markPinYin.split(" ");
            for (int i = 0; i < origin.length(); i++) {
                char c = origin.charAt(i);
                sb = sb.append(c);
                if (Character.toString(c).matches(MyPinYinUtil.REGEX_CHINESE_CHARACTER)){
                    sb.append("（"+markPinyinArr[i]+"）");
                }
            }
            vo.setOriginAndPinyin(sb.toString());
        }

        // 简体
        vo.setSimplified(MyPinYinUtil.changeToSimplified(origin));
        // 繁体
        vo.setTraditional(MyPinYinUtil.changeToTraditional(origin));
        // 无声调的拼音
        vo.setTonePinYin(MyPinYinUtil.changeToTonePinYin(origin));
        // 每个字首字母
        vo.setShortPinYin(MyPinYinUtil.changeToGetShortPinYin(origin));

        return vo;
    }
}
