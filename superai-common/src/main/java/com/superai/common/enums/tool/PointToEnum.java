package com.superai.common.enums.tool;

import com.superai.common.exception.base.BaseException;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 积分消耗枚举
 * 
 * @author superai
 */
@Getter
@AllArgsConstructor
public enum PointToEnum
{
    TO_AI_RANDOM_CHAT("0", 0,"AI随机聊天"),
    TO_AI_ROBOT_CHAT("11", 0,"AI机器人聊天"),
    TO_AI_CHAT("1", 0,"AI聊天【消耗】"),
    TO_AI_DRAW("2", 0,"AI绘画【消耗】"),
    TO_EXPRESS("3", 0,"快递查询【消耗】"),
    TO_BAIDU_LOOK_INGREDIENT("6",0,"果蔬识别【消耗】"),
    TO_BAIDU_LOOK_PLANT("7",0,"植物识别【消耗】"),
    TO_BAIDU_LOOK_FOOD("8",0,"菜品识别【消耗】"),
    TO_BAIDU_LOOK_ANIMAL("9",0,"动物识别【消耗】"),
    TO_BAIDU_LOOK_MONEY("10",0,"货币识别【消耗】"),

    ;

    private final String code;
    private final Integer point;
    private final String desc;


    public static PointToEnum getByCode(String code) {
        PointToEnum[] values = PointToEnum.values();
        for (PointToEnum value : values) {
            if (value.code.equals(code)){
                return value;
            }
        }
        throw new BaseException("消耗code错误");
    }
}
