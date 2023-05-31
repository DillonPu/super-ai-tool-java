package com.superai.common.enums.tool;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 积分获得枚举
 * 
 * @author superai
 */
@Getter
@AllArgsConstructor
public enum PointFromEnum
{
    FROM_SIGN("1", "签到【获得】"),
    FROM_LOOK_VIDEO("2", "看视频广告【获得】"),
    FROM_MONEY("3", "充值金额兑换【获得】");

    private final String code;
    private final String info;

}
