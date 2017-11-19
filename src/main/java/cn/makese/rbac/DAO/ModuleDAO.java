package cn.makese.rbac.DAO;


import cn.makese.rbac.model.Function;
import cn.makese.rbac.model.Module;

import java.util.List;

public interface ModuleDAO {

	List<Module> queryModule(Module module);

	void saveModule(Module module);

	void deleteModule(int id);

	void updataModule(Module module);

    void moduleAddFunction(Module module, Function function);

    void moduleDeleteFunction(Module module, Function function);

    Module moduleFunction(Module module);

}
