package com.hlzncz.util.shiro.realm;

import java.util.HashSet;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.hlzncz.dao.YongHuMapper;
import com.hlzncz.entity.YongHu;
import com.hlzncz.service.RoleService;

public class MyRealm extends AuthorizingRealm{
	@Autowired
	private YongHuMapper yongHuMapper;
	@Autowired
	private RoleService roleService;
	/**
	 * 为账号进行授权并进行验证
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		YongHu yh=(YongHu)SecurityUtils.getSubject().getPrincipal();
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(); 
		if(yh.getId()==null) {
			return info;
		}
		try {
			Set<String> roleNames =roleService.getRoleListByUserId(yh.getId());  
			Set<String> permissions =roleService.getPermissionByUserId(yh.getRole());
			//TODO添加对应的方�?
			info.setRoles(roleNames);
			info.setStringPermissions(permissions);  
			return info; 
		}catch (Exception e) {
			e.printStackTrace();
			return info;
		}
	}

	/**
	 * 对账号登录进行验�?
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		YongHu yh=new YongHu(token.getUsername(),String.valueOf(token.getPassword()));
		YongHu resultMsg=yongHuMapper.getYongHu(yh);
		if(token.getUsername().equals(resultMsg.getYhm())
				&&
				String.valueOf(token.getPassword()).equals(resultMsg.getYsmm())){
			return new SimpleAuthenticationInfo(resultMsg,resultMsg.getYsmm(),resultMsg.getYhm());
		}else{
			throw new AuthenticationException();  
		}
	}

}
