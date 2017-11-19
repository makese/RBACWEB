package cn.makese.rbac.action;

import cn.makese.rbac.model.Function;
import cn.makese.rbac.model.Module;
import cn.makese.rbac.service.ModuleService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Component
@Scope("prototype")
public class ModuleAction extends ActionSupport implements SessionAware {
    private ModuleService ModuleService;
    private Module module;
    private Function function;
    public Function getFunction() {
		return function;
	}
	public void setFunction(Function function) {
		this.function = function;
	}


	private Map<String, Object> session;
    private List<Module> modules;
    private boolean bool;
    private String option;
    public String getOption() {
        return option;
    }
    public void setOption(String option) {
        this.option = option;
    }


    private String idAll;
    
    
	public ModuleService getModuleService() {
		return ModuleService;
	}
	@Resource
	public void setModuleService(ModuleService moduleService) {
		ModuleService = moduleService;
	}

	public Module getModule() {
		return module;
	}
	public void setModule(Module module) {
		this.module = module;
	}

	public String queryModule() {
		this.modules = this.ModuleService.queryModule(module);
		session.put("modulelist", modules);
		return SUCCESS;
	}
	public String save() {
        return SUCCESS;
    }

	public String saveModule() {
		this.ModuleService.saveModule(module);
		return SUCCESS;
	}

	public String deleteModule() {
		this.ModuleService.deleteModule(module.getId());
		return SUCCESS;
	}

	public String moduleUpdata() {
	    this.ModuleService.moduleFunction(module);
		session.put("moduleup", module);
		return SUCCESS;
	}

	public String updataModule() {
		this.ModuleService.updataModule(module);
		return SUCCESS;
	}
	
	public String moduleFunction() {
		if(module == null) {
			module = (Module) session.get("module");
		}
	    module = ModuleService.moduleFunction(module);
	    session.put("module", module);
	    return SUCCESS;
    }
	
	public String moduleAddFunction() {
        ModuleService.moduleAddFunction(module, option); 
        return SUCCESS;
    }
	public String moduleDeleteFunction() {
        ModuleService.moduleDeleteFunction(module, function);
        return SUCCESS;
    }
	

    public void setSession(Map<String, Object> arg0) {
        session = arg0;
        
    }

}
