package com.superai.common.core.domain.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

/** 
 * 快递结果
 * @date  2023/3/28 10:50
 * @author AL
 **/
@Data
public class ExpressResultVO {

    @JsonProperty("EBusinessID")
    private String EBusinessID;

    @JsonProperty("OrderCode")
    private String OrderCode;

    @JsonProperty("ShipperCode")
    private String ShipperCode;

    @JsonProperty("LogisticCode")
    private String LogisticCode;

    @JsonProperty("Success")
    private String Success;

    @JsonProperty("State")
    private String State;

    @JsonProperty("Reason")
    private String Reason;

    @JsonProperty("Traces")
    private List<ExpressResultTranceVO> Traces;

}
