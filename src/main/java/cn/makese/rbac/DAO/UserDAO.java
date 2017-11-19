package cn.makese.rbac.DAO;

import cn.makese.rbac.model.Role;
import cn.makese.rbac.model.User;

import java.util.List;


public interface UserDAO {

	User logIn(User user);

	List<User> queryUser(User user);

	void saveUser(User user);

	void deleteUser(int id);

	void updataUser(User user);

	void userAddRole(User user, Role role);

	void userDeleteRole(User user, Role role);

    User userRole(User user);
	

}
