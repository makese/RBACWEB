package cn.makese.rbac.action;

import cn.makese.rbac.model.Function;
import cn.makese.rbac.model.Role;
import cn.makese.rbac.service.RoleService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;




@Component
@Scope("prototype")
public class RoleAction extends ActionSupport implements SessionAware {
    private RoleService roleService;
    private Role role;
    private Function function;
    private Map<String, Object> session;
    private boolean bool;
    private List<Role> roles;
    
    

    public RoleService getRoleService() {
        return roleService;
    }
    @Resource
    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Function getFunction() {
        return function;
    }

    public void setFunction(Function function) {
        this.function = function;
    }


	// ???????????
	public String queryRole() {
	    roles = this.roleService.queryRole();
	    session.put("rolelist", roles);
	    return SUCCESS;
	}
	
	public String save() {
       return SUCCESS;
    }

	// ???????????
	public String saveRole() {
		roleService.saveRole(role);
		return SUCCESS;
	}

	// ??????????
	public String deleteRole() {

		roleService.deleteRole(role.getId());
		return SUCCESS;
	}

	// ??????????????
	public String roleUpdata() throws Exception {
	    session.put("roleup", role);
		return SUCCESS;
	}

	// ??????????
	public String updataRole() {
	    
	    roleService.updataRole(role);
		return SUCCESS;
	}

	// ?????????????
	public String roleFunction() {
		if (role == null) {
			role = (Role) session.get("role");
		}
		Map<String, Object> map = roleService.roleFunction(role);
		role = (Role) map.get("role");
		List<Function> functionList = (List<Function>) map.get("functionList");
		session.put("role", role);
        session.put("functionList", functionList);
		return SUCCESS;
	}

	// ??????????????
	public String roleAddFunction() {
	    roleService.roleAddFunction(role, function);
		return SUCCESS;
	}

	// ?????????????
	public String roleDeleteFunction() {
	    roleService.roleDeleteFunction(role, function);
		return SUCCESS;
	}

    public void setSession(Map<String, Object> arg0) {
        session = arg0;
        
    }

}
