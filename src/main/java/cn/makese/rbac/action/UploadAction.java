package cn.makese.rbac.action;

import cn.makese.rbac.model.Fileupload;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.File;

@Component
@Scope("prototype")
public class UploadAction extends ActionSupport implements ModelDriven<Fileupload> {
    Fileupload file = new Fileupload();
    
    public String saveUpload() {
        if (file.getImage() != null) {
            String imageurl = ServletActionContext.getServletContext()
                    .getRealPath("/upLoad");
            for (int i = 0; i < file.getImage().size(); i++) {
                File imagedir = new File(imageurl, file.getImageFileName().get(i));
                file.getImage().get(i).renameTo(imagedir);
            }
        } else {
            return ERROR;
        }

        return SUCCESS;
    }
    
    public String save() {
        return SUCCESS;
    }

    public Fileupload getModel() {
        return file;
    }
}
