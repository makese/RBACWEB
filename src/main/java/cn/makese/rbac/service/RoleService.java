package cn.makese.rbac.service;

import cn.makese.rbac.DAO.FunctionDAO;
import cn.makese.rbac.DAO.RoleDAO;
import cn.makese.rbac.model.Function;
import cn.makese.rbac.model.Role;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



@Component
public class RoleService {

	private RoleDAO roleDAO;
	private FunctionDAO functionDAO;
	
	public FunctionDAO getFunctionDAO() {
        return functionDAO;
    }
	@Resource
    public void setFunctionDAO(FunctionDAO functionDAO) {
        this.functionDAO = functionDAO;
    }

    public RoleDAO getRoleDAO() {
		return roleDAO;
	}
	
	@Resource
	public void setRoleDAO(RoleDAO roleDAO) {
		this.roleDAO = roleDAO;
	}

	// ��ɫ��ѯ�ķ���
	@Transactional
	public List<Role> queryRole() {

		return this.roleDAO.queryRole();
	}

	@Transactional
	public void saveRole(Role role) {

		this.roleDAO.saveRole(role);
	}

	@Transactional
	public void deleteRole(int id) {

		this.roleDAO.deleteRole(id);
	}

	// ��ɫ�޸���ת�ķ���
	@Transactional
	public void updataRole(Role role) {

		this.roleDAO.updataRole(role);
	}

	@Transactional
	public void roleAddFunction(Role role, Function function) {
		
		this.roleDAO.roleAddFunction(role, function);
	}

	@Transactional
	public void roleDeleteFunction(Role role, Function function) {

		this.roleDAO.roleDeleteFunction(role, function);
	}
	@Transactional
	public Map<String, Object> roleFunction(Role role) {
	    Map<String, Object> returnmap = new HashMap<String, Object>();
	    returnmap.put("role", roleDAO.roleFunction(role));
		returnmap.put("functionList", functionDAO.queryFunction());
		return returnmap;
	}
}
