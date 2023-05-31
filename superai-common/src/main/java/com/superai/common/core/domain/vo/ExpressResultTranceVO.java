package com.superai.common.core.domain.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

/** 
 * 快递轨迹
 * @date  2023/3/28 16:32
 * @author AL
 **/
@Data
public class ExpressResultTranceVO {

    @JsonProperty("AcceptTime")
    private String AcceptTime;

    @JsonProperty("AcceptStation")
    private String AcceptStation;

}
