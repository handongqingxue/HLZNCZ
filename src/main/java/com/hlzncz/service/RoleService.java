package com.hlzncz.service;
/**
 * ��ȡ�û���ϵͳ�еĽ�ɫ
 * @author Administrator
 *
 */

import java.util.Set;

import org.springframework.stereotype.Service;

/**�����������ȡ�û���ϵͳ�а��ݵĽ�ɫ
 * @author Administrator
 *
 */
@Service
public interface RoleService {
	//ͨ���̻�id��ѯ�û���ɫ
	public Set<String> getRoleListByUserId(Integer userId);
	//ͨ���̻�id��ѯ��ɫȨ��
	public Set<String> getPermissionByUserId(String id);
}