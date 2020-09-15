package com.hlzncz.dao;

import java.util.Set;

/**
 * 权限操作
 * @author Administrator
 *
 */
public interface RoleMapper {
	//通过商户id来获得商户的角色
	Set<String> getRoleList(Integer id);
	//通过商户id来获得商户的权限
	Set<String> getPermissions(String id);
	
}
