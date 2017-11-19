package cn.makese.rbac.DAO.imp;


import cn.makese.rbac.DAO.RoleDAO;
import cn.makese.rbac.model.Function;
import cn.makese.rbac.model.Role;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;
import java.util.Set;


@Component
public class RoleDAOImp implements RoleDAO {
    private SessionFactory sessionFactory;
    private Boolean bool = false;
    
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    @Resource
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<Role> queryRole() {
       Session session = sessionFactory.getCurrentSession();
       Query query = session.createQuery("from Role");
       return query.list();
    }

    public void saveRole(Role role) {
        Session session = sessionFactory.getCurrentSession();
        session.save(role);
        
    }

    public void deleteRole(int id) {
        Session session = sessionFactory.getCurrentSession();
        Role role = (Role) session.get(Role.class, id);
        Set<Function> roleFunction = role.getRoleFunction();
        for (Function function : roleFunction) {
            function.getFunctionRole().remove(role);
            session.update(function);
        }
        session.delete(role);
    }


    public void updataRole(Role role) {
        Session session = sessionFactory.getCurrentSession();
        session.update(role);
    }

    public void roleAddFunction(Role role, Function function) {
        Session session = sessionFactory.getCurrentSession();
        role = (Role) session.get(Role.class, role.getId());
        function = (Function) session.get(Function.class, function.getId());
        function.getFunctionRole().add(role);
        role.getRoleFunction().add(function);
        session.update(role);
        
    }

    public void roleDeleteFunction(Role role, Function function) {
        Session session = sessionFactory.getCurrentSession();
        role = (Role) session.get(Role.class, role.getId());
        function = (Function) session.get(Function.class, function.getId());
        role.getRoleFunction().remove(function);
        function.getFunctionRole().remove(role);
        session.update(function);
        
    }
	public Role roleFunction(Role role) {
		Session session = sessionFactory.getCurrentSession();
		return (Role) session.get(Role.class, role.getId());
	}


}
