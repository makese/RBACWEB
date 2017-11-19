package cn.makese.rbac.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Module {
	private int id;
	private String moduleName;
	private Set<Function> moduleFunction = new HashSet<Function>();
	
	

    @Id
	@GeneratedValue
	public int getId() {
		return id;
	}

    @OneToMany(mappedBy="module",cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	public Set<Function> getModuleFunction() {
        return moduleFunction;
    }

    public void setModuleFunction(Set<Function> moduleFunction) {
        this.moduleFunction = moduleFunction;
    }

    public void setId(int id) {
		this.id = id;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

}
