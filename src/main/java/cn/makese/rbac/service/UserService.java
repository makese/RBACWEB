package cn.makese.rbac.service;

import cn.makese.rbac.DAO.UserDAO;
import cn.makese.rbac.model.Role;
import cn.makese.rbac.model.User;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;




@Component
public class UserService {

	private UserDAO userDAO;
	private Boolean bool;
	
	public UserDAO getUserDAO() {
		return userDAO;
	}

	@Resource
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	// �û���¼�ķ���
	@Transactional
	public User logIn(User user) {
		return this.userDAO.logIn(user);
	}

	// �û���ѯ�ķ���
	@Transactional
	public List<User> queryUser(User user) {

		return this.userDAO.queryUser(user);
	}

	// �û����ӵķ���
	@Transactional
	public void saveUser(User user) {

		this.userDAO.saveUser(user);
	}

	// �û�ɾ��ķ���
	@Transactional
	public void deleteUser(int id) {

		this.userDAO.deleteUser(id);
	}


	// �û��޸ĵķ���
	@Transactional
	public void updataUser(User user) {

		this.userDAO.updataUser(user);
	}


	// �û������ɫ�ķ���
	@Transactional
	public void userAddRole(User user,Role role) {

		this.userDAO.userAddRole(user,role);
	}
	
	// �û�ɾ���ɫ�ķ���
	@Transactional
	public void userDeleteRole(User user,Role role) {
		this.userDAO.userDeleteRole(user,role);
	}
	@Transactional
    public User userRole(User user) {
        return userDAO.userRole(user);
    }


}
