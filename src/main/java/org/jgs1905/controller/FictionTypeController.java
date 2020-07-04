package org.jgs1905.controller;

import lombok.extern.slf4j.Slf4j;
import org.jgs1905.entity.Fiction;
import org.jgs1905.entity.Section;
import org.jgs1905.entity.Type;
import org.jgs1905.service.FictionService;
import org.jgs1905.service.SectionService;
import org.jgs1905.service.TypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@WebServlet("/type")
public class FictionTypeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String typeId = request.getParameter("typeId");
//        System.out.println("typeId = "+typeId);
        int type_id = Integer.valueOf(typeId);
        Type type = getType(type_id);

        request.setAttribute("typeList",navList());
        request.setAttribute( "type",type);
        request.setAttribute("fictions",fictionList(type_id));
        request.setAttribute("fictionList",gitList(type_id));
        request.setAttribute("newFictions", newFictions(type_id));

        request.getRequestDispatcher("fictiontype.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    /**
     *主页导航栏的小说类别方法
     * @return
     */
    private List<Type> navList(){
        TypeService service = new TypeService();
        List<Type> typeList = new ArrayList<>();
        try {
            typeList  = service.getTypes();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return typeList;
    }

    /**
     * 通过id获取小说类别对象
     * @param id
     * @return
     */
    public Type getType(int id){
        TypeService service = new TypeService();
        Type type = new Type();
        try {
            type  = service.getTypeById(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return  type;
    }

    /**
     * 通过小说类别id 获取此类小说的所有集合(按热度从高到底)
     * @param typeId
     * @return
     */
    public List<Fiction> fictionList(int typeId){
        FictionService service = new FictionService();
        List<Fiction> fictionList = null;
        try {
            fictionList = service.fictionList(typeId);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return  fictionList;
    }

    /**
     * 通过小说类别id 获取此类小说的所有集合(按热度从高到底)
     * @param typeId
     * @return
     */
    public List<Fiction> gitList(int typeId) {
        FictionService service = new FictionService();
        List<Fiction> gitList = null;
        try {
            gitList = service.getList(typeId);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return gitList;
    }

    /**
     * 获取最新上线的书
     * @param typeId
     * @return
     */
    public List<Fiction> newFictions(int typeId){
//        System.out.println("---------------newFictions--------------------");
        List<Fiction> fictions = gitList(typeId);
//        System.out.println("========fictions=======>"+fictions);
        SectionService sectionService = new SectionService();
//        System.out.println("========sectionService=======>"+sectionService);
        Date time = new Date();
        for (Fiction fiction:fictions) {
//            log.info("========fiction=======>>",fiction);
            try {
                Section section = sectionService.getPublishTime(fiction.getId());
//                System.out.println("========section=======>"+section);
                if(section == null){
                    continue;
                }
                time = section.getTime();

                fiction.setPublishTime(time);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        return fictions;
    }

    /**
     * 时间格式化方法
     * @param str
     * @return
     */
    private Date formatTime(String str){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date time = new Date();
        try {
            time = simpleDateFormat.parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return  time;
    }
}
