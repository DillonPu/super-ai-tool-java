package com.superai.common.utils.text;

import com.github.stuxuhai.jpinyin.ChineseHelper;
import com.github.stuxuhai.jpinyin.PinyinFormat;
import com.github.stuxuhai.jpinyin.PinyinHelper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

/**
 * @author AL
 * @date 2023/4/7 15:34
 */
@Slf4j
@Component
public class MyPinYinUtil {

    public static String REGEX_CHINESE_CHARACTER = "[\\u4E00-\\u9FA5]+";

    public static void main(String[] args) {
        String str = "重庆，你好 welldone";
        String cq = changeHanZi2TonePinYin(str);
        String cq2 = changeToMarkPinYin(str);
        String cq3 = changeToNumberPinYin(str);
        String cq4 = changeToGetShortPinYin(str);
        String cq5 = changeToTraditional(str);
        String cq6 = changeToSimplified(str);
        String cq7 = changeToTonePinYin(str);
        System.err.println(cq);
        System.err.println(cq2);
        System.err.println(cq3);
        System.err.println(cq4);
        System.err.println(cq5);
        System.err.println(cq6);
        System.err.println(cq7);
    }

    public static void printStr(String ret) {
        String result = changeToTonePinYin(ret);
        System.out.println("Oops! --》 " + result);
    }

    /**
     * 转换为有声调的拼音字符串
     *
     * @param givenHanZi 指定汉字
     * @return 有声调的拼音字符串
     */
    public static String changeToMarkPinYin(String givenHanZi) {
        String tempStr = null;
        try {
            tempStr = PinyinHelper.convertToPinyinString(givenHanZi, " ", PinyinFormat.WITH_TONE_MARK);
        } catch (Exception e) {
            log.error("转换异常信息：", e);
        }
        return tempStr;
    }

    /**
     * 转换为数字声调字符串
     *
     * @param givenHanZi 需转换的汉字
     * @return 转换完成的拼音字符串
     */
    public static String changeToNumberPinYin(String givenHanZi) {
        String tempStr = null;
        try {
            tempStr = PinyinHelper.convertToPinyinString(givenHanZi, " ", PinyinFormat.WITH_TONE_NUMBER);
        } catch (Exception e) {
            log.error("转换异常信息：", e);
        }
        return tempStr;
    }

    /**
     * 转换为不带音调的拼音字符串，只转换汉字部分，不转换数字、标点符号和英文字母
     * 自动识别常用多音字
     *
     * @param givenHanZi 汉字字符串
     * @return 拼音字符串
     */
    public static String changeHanZi2TonePinYin(String givenHanZi) {
        if (StringUtils.isBlank(givenHanZi)) {
            return "";
        }
        String tempOutput = "";
        StringBuilder output = new StringBuilder();
        char[] input = givenHanZi.trim().toCharArray();

        try {
            for (int i = 0; i < input.length; i++) {
                if (Character.toString(input[i]).matches(REGEX_CHINESE_CHARACTER)) {
                    tempOutput += Character.toString(input[i]);
                } else {
                    tempOutput = changeToTonePinYin(tempOutput);
                    output = output.append(tempOutput).append(Character.toString(input[i]));
                    tempOutput = "";
                }
            }
            if (StringUtils.isNotBlank(tempOutput)) {
                output = output.append(changeToTonePinYin(tempOutput));
            }
        } catch (Exception e) {
            log.error("转换异常信息：", e);
        }
        return output.toString();
    }

    /**
     * 转换为不带音调的拼音字符串
     *
     * @param givenHanZi 需转换的汉字
     * @return 拼音字符串
     */
    public static String changeToTonePinYin(String givenHanZi) {
        String tempStr = null;
        try {
            tempStr = PinyinHelper.convertToPinyinString(givenHanZi, " ", PinyinFormat.WITHOUT_TONE);
        } catch (Exception e) {
            log.error("转换异常信息：", e);
        }
        return tempStr;
    }

    /**
     * 转换为每个汉字对应拼音首字母字符串
     *
     * @param givenHanZi 需转换的汉字
     * @return 拼音字符串
     */
    public static String changeToGetShortPinYin(String givenHanZi) {
        String tempStr = null;
        try {
            tempStr = PinyinHelper.getShortPinyin(givenHanZi);
        } catch (Exception e) {
            log.error("转换异常信息：", e);
        }
        return tempStr;
    }

    /**
     * 检查汉字是否为多音字
     *
     * @param givenHanZi 需检查的汉字
     * @return true 多音字，false 不是多音字
     */
    public static boolean checkPinYin(char givenHanZi) {
        boolean check = false;
        try {
            check = PinyinHelper.hasMultiPinyin(givenHanZi);
        } catch (Exception e) {
            log.error("转换异常信息：", e);
        }
        return check;
    }

    /**
     * 简体转换为繁体
     *
     * @param givenHanZi
     * @return
     */
    public static String changeToTraditional(String givenHanZi) {
        String tempStr = null;
        try {
            tempStr = ChineseHelper.convertToTraditionalChinese(givenHanZi);
        } catch (Exception e) {
            log.error("转换异常信息：", e);
        }
        return tempStr;
    }

    /**
     * 繁体转换为简体
     *
     * @param givenHanZi
     * @return
     */
    public static String changeToSimplified(String givenHanZi) {
        String tempStr = null;
        try {
            tempStr = ChineseHelper.convertToSimplifiedChinese(givenHanZi);
        } catch (Exception e) {
            log.error("转换异常信息：", e);
        }
        return tempStr;
    }
}

