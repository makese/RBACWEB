package cn.makese.rbac.service;

import cn.makese.rbac.model.Function;
import cn.makese.rbac.model.Role;
import cn.makese.rbac.model.User;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Set;


public class CheckPrivilegeInterceptor extends AbstractInterceptor {

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        String namespace = invocation.getProxy().getNamespace();
        String actionName = invocation.getProxy().getActionName();
        boolean check = false;
        if (user != null) {
            Set<Role> roles = user.getUserRole();
            a:for (Role role : roles) {
                for (Function function : role.getRoleFunction()) {
                    String[] urls = function.getUrl().split("_");
                    if(namespace.contains(urls[1]) && actionName.contains(urls[0])) {
                        check = true;
                        break a;
                    } else if (urls[1].equals("function") && actionName.contains("Function") && !actionName.contains("Delete") && !actionName.contains("Add")) {
                       check = true;
                       break a;
                    }
                }
            }
            if (check || user.getId() == 1) {
                invocation.invoke();
            } else {
                request.setAttribute("url", namespace + actionName);
                return "noPrivilegeError";
            }
                     
         } 
        return "loginUI" ;   
     }

}
