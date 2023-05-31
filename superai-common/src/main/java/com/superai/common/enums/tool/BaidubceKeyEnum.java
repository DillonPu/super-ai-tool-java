package com.superai.common.enums.tool;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * baidubce 秘钥对
 * 
 * @author superai
 */
@Getter
@AllArgsConstructor
public enum BaidubceKeyEnum
{

    BAIDU_LOOK_INGREDIENT("1","xxxxxxxxxxxxxxxxxxxxxxx","xxxxxxxxxxxxxxxxxxxxxxx","果蔬识别秘钥"),
    BAIDU_LOOK_PLANT("2","xxxxxxxxxxxxxxxxxxxxxxx","xxxxxxxxxxxxxxxxxxxxxxx","植物识别秘钥"),
    BAIDU_LOOK_FOOD("3","xxxxxxxxxxxxxxxxxxxxxxx","xxxxxxxxxxxxxxxxxxxxxxx","菜品识别秘钥"),
    BAIDU_LOOK_ANIMAL("4","xxxxxxxxxxxxxxxxxxxxxxx","xxxxxxxxxxxxxxxxxxxxxxx","动物识别秘钥"),
    BAIDU_LOOK_MONEY("5","xxxxxxxxxxxxxxxxxxxxxxx","xxxxxxxxxxxxxxxxxxxxxxx","货币识别秘钥"),
    WENXIN_AI_DRAW("3","xxxxxxxxxxxxxxxxxxxxxxx","xxxxxxxxxxxxxxxxxxxxxxx","文心一言作画"),
    ;
    private final String code;
    private final String key;
    private final String secret;
    private final String desc;

    public static BaidubceKeyEnum getByCode(String code) {
        BaidubceKeyEnum[] values = BaidubceKeyEnum.values();
        for (BaidubceKeyEnum value : values) {
            if (value.getCode().equals(code)){
                return value;
            }
        }
        return null;
    }


}
