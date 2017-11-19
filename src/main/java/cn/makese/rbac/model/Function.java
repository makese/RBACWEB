package cn.makese.rbac.model;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Function {
	private int id;
	private String url;
	private String functionName;
	private Module module;
	private Set<Role> functionRole;
	
	@ManyToMany()
    public Set<Role> getFunctionRole() {
        return functionRole;
    }

    public void setFunctionRole(Set<Role> functionRole) {
        this.functionRole = functionRole;
    }

    @Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	

	public String getFunctionName() {
		return functionName;
	}

	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}

	@ManyToOne(fetch=FetchType.EAGER)
	public Module getModule() {
		return module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Function && functionName != null) {
		    Function function2 = (Function) obj;
            return functionName.equals(function2.getFunctionName());
		} else {
           return false; 
        }
	}	
	
	@Override
	public int hashCode() {
		return 1;
	}
}
