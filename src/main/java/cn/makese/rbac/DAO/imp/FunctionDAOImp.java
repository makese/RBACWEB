package cn.makese.rbac.DAO.imp;

import cn.makese.rbac.DAO.FunctionDAO;
import cn.makese.rbac.model.Function;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;


@Component
public class FunctionDAOImp implements FunctionDAO {
    private SessionFactory sessionFactory;
    
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    @Resource
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<Function> queryFunction() {
       Session session = sessionFactory.getCurrentSession();
       Query query = session.createQuery("from Function");
       return query.list();
    }

}
