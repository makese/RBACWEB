package cn.makese.rbac.DAO.imp;

import cn.makese.rbac.DAO.UserDAO;
import cn.makese.rbac.model.Role;
import cn.makese.rbac.model.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;



@Component
public class UserDAOImp implements UserDAO {

    private SessionFactory sessionFactory;
     
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    @Resource
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    public User logIn(User user) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User u where u.userName='" + user.getUserName() + "'");
        List<User> users = query.list();
        if(users.size() != 0) {
            User user1 = (User) query.uniqueResult();
            if (user.getPassword().equals(user1.getPassword())) {
            	user = (User) session.get(User.class, user1.getId());
                return user;
            }
        }
        return null;
    }


    public List<User> queryUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User");
        return query.list();
        
    }


    public void saveUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.save(user);
        
    }


    public void deleteUser(int id) {
        Session session = sessionFactory.getCurrentSession();
        User user = new User();
        user.setId(id);
        session.delete(user);
    }


    public void updataUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.update(user);
    }


    public void userAddRole(User user, Role role) {
        Session session = sessionFactory.getCurrentSession();
        user = (User) session.get(User.class, user.getId());
        user.getUserRole().add(role);
        session.update(user);
    }


    public void userDeleteRole(User user, Role role) {
        Session session = sessionFactory.getCurrentSession();
        user = (User) session.get(User.class, user.getId());
        user.getUserRole().remove(role);
        session.update(user);
    }

    public User userRole(User user) {
        Session session = sessionFactory.getCurrentSession();
        user = (User) session.get(User.class, user.getId());
        return user;
    }
    
}
