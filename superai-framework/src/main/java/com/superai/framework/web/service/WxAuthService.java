package com.superai.framework.web.service;

import com.alibaba.fastjson2.JSONObject;
import com.superai.common.constant.Constants;
import com.superai.common.core.domain.entity.SysUser;
import com.superai.common.core.domain.model.WxInfoUpdateBody;
import com.superai.common.exception.base.BaseException;
import com.superai.common.utils.SecurityUtils;
import com.superai.common.utils.StringUtils;
import com.superai.common.utils.http.HttpUtils;
import com.superai.common.utils.uuid.UUID;
import com.superai.common.config.WxValueConfig;
import com.superai.system.service.ISysUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Map;
import java.util.Objects;

/** 
 * 微信个人中心服务
 * @date  2023/3/28 11:10
 * @author AL
 **/
@Slf4j
@Component
public class WxAuthService {

    @Resource
    private WxValueConfig wxValueConfig;

    @Resource
    private ISysUserService sysUserService;

    @Resource
    private SysLoginService sysLoginService;

    /**
     * 微信登录处理逻辑 快速登录
     * @param code
     * @return
     */
    public String loginOrRegister(String code) {
        // 调用微信官方获取key
        String requestUrl = wxValueConfig.getWxJscode2sessionApi()
                .replace("APPID", wxValueConfig.getMiniProgramAppId())
                .replace("SECRET", wxValueConfig.getMiniProgramAppSecret())
                .replace("JSCODE",code);
        String result = HttpUtils.sendGet(requestUrl);

        log.info("---------使用APPID和APPSECRET获取openid等信息，返回结果：{}----------", result);
        if (StringUtils.isNotBlank(result)) {
            Map resultMap = JSONObject.parseObject(result);
            String openid = this.getObjStr(resultMap.get("openid"));
            String sessionKey = this.getObjStr(resultMap.get("session_key"));
            String unionid = this.getObjStr(resultMap.get("unionid"));
            String errcode = this.getObjStr(resultMap.get("errcode"));
            String errmsg = this.getObjStr(resultMap.get("errmsg"));

            // 如果正常获取 返回token
            if ("0".equals(errcode) || StringUtils.isBlank(errcode)){
                // 查询是否存在此微信用户
                SysUser wxUserInfo = sysUserService.getUserByOpeinIdAndUnionid(openid, unionid);
                if (Objects.isNull(wxUserInfo)){
                    throw new BaseException("登录出错，请联系管理员微信：xkpdl619");
                }
                String token = sysLoginService.login(openid, openid, Constants.SYS_WEIXIN_USER_DEFAULT_CODE, "");
                return token;
            }
            throw new BaseException(errmsg);
        } else {
            throw new BaseException("登录出错，请联系管理员微信：xkpdl619");
        }
    }

    /**
     * 微信小程序缓存token key
     * @return
     */

    private String getObjStr(Object obj){
        return Objects.isNull(obj) ? "" : obj.toString();
    }

    /**
     * 更新
     * @param param
     */
    public void updateInfo(WxInfoUpdateBody param) {
        Long userId = SecurityUtils.getUserId();
        SysUser sysUser = sysUserService.selectUserById(userId);
        sysUser.setNickName(param.getNickName());
        sysUser.setAvatar(param.getAvatar());
        sysUserService.updateUserProfile(sysUser);
    }
}
