package cn.makese.rbac.DAO.imp;

import cn.makese.rbac.DAO.ModuleDAO;
import cn.makese.rbac.model.Function;
import cn.makese.rbac.model.Module;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;


@Component
public class ModuleDAOImp implements ModuleDAO {
	private SessionFactory sessionFactory;
	private Boolean bool = false;
	
	
	
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public List<Module> queryModule(Module module) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Module");
		return query.list();
	}

	public void saveModule(Module module) {
		Session session = sessionFactory.getCurrentSession();
		session.save(module);
	}
	public void deleteModule(int id) {
	    Session session = sessionFactory.getCurrentSession();
		Module module = (Module) session.get(Module.class, id);
		session.delete(module); 
	}
	public void updataModule(Module module) {
		Session session = sessionFactory.getCurrentSession();
		session.update(module);
	}

    public void moduleAddFunction(Module module, Function function) {
        Session session = sessionFactory.getCurrentSession();
        module = (Module) session.get(Module.class, module.getId());
        module.getModuleFunction().add(function);
        session.update(module);
    }

    public void moduleDeleteFunction(Module module, Function function) {
        Session session = sessionFactory.getCurrentSession();
        function.setModule(module);
        session.delete(function);
        
    }

    public Module moduleFunction(Module module) {
        Session session = sessionFactory.getCurrentSession();
        return (Module) session.get(Module.class, module.getId()); 
    }


    
}
