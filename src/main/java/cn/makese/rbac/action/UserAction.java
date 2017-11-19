package cn.makese.rbac.action;

import cn.makese.rbac.model.Role;
import cn.makese.rbac.model.User;
import cn.makese.rbac.service.RoleService;
import cn.makese.rbac.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Component
@Scope("prototype")
public class UserAction extends ActionSupport implements SessionAware {

	  private UserService userService;
	  private RoleService roleService;
	  private User user;
	  private Role role;
	  private Map<String, Object> session;
	  private boolean bool;
	  private List<User> users;
	  private String idAll;
	  
	public RoleService getRoleService() {
        return roleService;
    }
	@Resource
    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }

    public String getIdAll() {
		return idAll;
	}

	public void setIdAll(String idAll) {
		this.idAll = idAll;
	}

	public UserService getUserService() {
		return userService;
	}

	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}


	@Override
	public String execute() throws Exception {
		return super.execute();
	}


	public String logIn() {
		if(session.get("user") != null) {
		    return SUCCESS;
		}
		user = userService.logIn(user);
		if (user != null) {   
			session.put("username", user.getUserName());
			session.put("password", user.getPassword());
			session.put("user", user);
			return SUCCESS;
		} else {
			this.addFieldError("usererror", "账号密码错误");
			return ERROR;
		}
	
	}


	public String queryUser() {
		this.users = userService.queryUser(user);
		session.put("userlist", users);
		return SUCCESS;
	}
	
	
	public String save() {
		return SUCCESS;
	}
	public String saveUser() {
		this.userService.saveUser(user);
		return SUCCESS;
	}
	public String deleteAllUser() {
				if(idAll.startsWith("checkbox")){
					idAll = idAll.substring(9);
				}
				System.out.println(idAll);
				if(idAll.length()>0){
					String[] d = idAll.split(",");
					int id;
					for(int i=0;i<d.length;i++){
						id = Integer.parseInt(d[i]);
						userService.deleteUser(id);
					}
					return SUCCESS;
				}
				return ERROR;
	
	}
	

		public String deleteUser() {
			this.userService.deleteUser(user.getId());
			return SUCCESS;
		}


	public String userUpdata() {
		session.put("userup", user);
		return SUCCESS;
	}


	public String updataUser() {
		this.userService.updataUser(user);
		return SUCCESS;
	}


	public String userRole() {
		if(user == null) {
			user = (User) session.get("userup");
		}
		user = userService.userRole(user);
		List<Role> roleList = roleService.queryRole();
		session.put("userup", user);
		session.put("roleList", roleList);
		return SUCCESS;
	}

	
	public String userAddRole() {
		userService.userAddRole(user, role);
		return SUCCESS;
	}
	
	
	public String userDeleteRole() {
	    userService.userDeleteRole(user, role);
		return SUCCESS;
	}
	
	public String logOut() {
	    session.clear();
		return SUCCESS;
	}

	public void setSession(Map<String, Object> session) {
		
		this.session=session;
	}



}
