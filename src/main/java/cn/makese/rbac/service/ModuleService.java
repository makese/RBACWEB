package cn.makese.rbac.service;

import cn.makese.rbac.DAO.ModuleDAO;
import cn.makese.rbac.model.Function;
import cn.makese.rbac.model.Module;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


@Component
public class ModuleService {

	private ModuleDAO moduleDAO;
	
	public ModuleDAO getModuleDAO() {
		return moduleDAO;
	}
	
	@Resource
	public void setModuleDAO(ModuleDAO moduleDAO) {
		this.moduleDAO = moduleDAO;
	}


	@Transactional
	public List<Module> queryModule(Module module) {

		return this.moduleDAO.queryModule(module);
	}

	@Transactional
	public void saveModule(Module module) {

		this.moduleDAO.saveModule(module);
	}

	@Transactional
	public void deleteModule(int id) {

		this.moduleDAO.deleteModule(id);
	}


	@Transactional
	public void updataModule(Module module) {

		this.moduleDAO.updataModule(module);
	}
	@Transactional
	public void moduleAddFunction(Module module,String option) {
	    Function function = new Function();
	    String moduleName = module.getModuleName();
	    function.setFunctionName(option + moduleName);
	    function.setUrl(option + "_" +moduleName);
	    function.setModule(module);
        this.moduleDAO.moduleAddFunction(module, function);
    }
	@Transactional
	public void moduleDeleteFunction(Module module,Function function) {
	    this.moduleDAO.moduleDeleteFunction(module, function);
    }
	@Transactional
    public Module moduleFunction(Module module) {
        return this.moduleDAO.moduleFunction(module);
    }

}
