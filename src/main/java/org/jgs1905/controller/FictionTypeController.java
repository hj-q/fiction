package org.jgs1905.controller;

import org.jgs1905.entity.Fiction;
import org.jgs1905.entity.Type;
import org.jgs1905.service.FictionService;
import org.jgs1905.service.TypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/type")
public class FictionTypeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String typeId = request.getParameter("typeId");
//        System.out.println("typeId = "+typeId);
        int type_id = Integer.valueOf(typeId);
        Type type = getType(type_id);

        request.setAttribute( "type",type);
        request.setAttribute("fictions",fictionList(type_id));
        request.setAttribute("fictionList",gitList(type_id));


        request.getRequestDispatcher("fictiontype.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
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
}
