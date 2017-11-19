package cn.makese.rbac.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Role {
	private int id;
	private String roleName;
	private Set<Function> roleFunction =new HashSet<Function>();

	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String rolesName) {
		this.roleName = rolesName;
	}

	@ManyToMany(mappedBy="functionRole",fetch=FetchType.EAGER,cascade=CascadeType.MERGE)
	public Set<Function> getRoleFunction() {
		return roleFunction;
	}

	public void setRoleFunction(Set<Function> roleFunction) {
		this.roleFunction = roleFunction;
	}
	    
	@Override
	public boolean equals(Object obj) {
	    if (roleName == null) {
	        return false;
	    } else {
	        Role role = (Role) obj;
	        return roleName.equals(role.getRoleName());
        }
	}
	
	@Override
	public int hashCode() {
	    return 1;
	}
}
