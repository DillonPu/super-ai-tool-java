package com.superai.common.enums.tool;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author AL
 * @date 2023/4/6 18:22
 */
@Getter
@AllArgsConstructor
public enum AiImgTypeEnum {

    TSWX("探索无限","探索无限"),
    GF("古风","古风"),
    GDF("古风","古代风"),
    ECY("二次元","二次元"),
    XSFG("写实风格","写实风格"),
    FSH("浮世绘","浮世绘"),
    LOW_PLOY("low poly","low poly"),
    LOW("low poly","low"),
    PLOY("low poly","poly"),
    XiangSFG("像素风格","像素风格"),
    GNYS("概念艺术","概念艺术"),
    SBPK("赛博朋克","赛博朋克"),
    LLTFG("洛丽塔风格","洛丽塔风格"),
    BLKFG("巴洛克风格","巴洛克风格"),
    CXSZY("超现实主义","超现实主义"),
    SCH("水彩画","水彩画"),
    ZQBYS("蒸汽波艺术","蒸汽波艺术"),
    YH("油画","油画"),
    KTH("卡通画","卡通画"),
    KT("卡通画","卡通"),
    ;
    private String name;
    private String alias;
}
