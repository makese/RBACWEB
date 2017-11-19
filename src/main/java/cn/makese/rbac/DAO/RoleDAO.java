package cn.makese.rbac.DAO;


import cn.makese.rbac.model.Function;
import cn.makese.rbac.model.Role;

import java.util.List;

public interface RoleDAO {

	List<Role> queryRole();

	void saveRole(Role role);

	void deleteRole(int id);


	void updataRole(Role role);

	void roleAddFunction(Role role, Function function);

	void roleDeleteFunction(Role role, Function function);

	Role roleFunction(Role role);
}
