package org.jgs1905.controller;

import org.apache.poi.ss.formula.functions.T;
import org.jgs1905.entity.Fiction;
import org.jgs1905.entity.Section;
import org.jgs1905.entity.Type;
import org.jgs1905.service.CommentService;
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
import java.util.ArrayList;
import java.util.List;
@WebServlet("/index")
public class IndexController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("typeList",navList());
        request.setAttribute("fourFiction",fourFiction());
        request.setAttribute("qiangtuiFiction",qiangtuiFiction());
        request.setAttribute("types",typeList());
        request.setAttribute("newSections",getNewSections());
        request.setAttribute("newFictions",getNewFiction());

        request.getRequestDispatcher("main.jsp").forward(request,response);




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
     * 主页展示热度在前四的小说
     * @return
     */
    private List<Fiction> fourFiction(){
        FictionService service = new FictionService();
        List<Fiction> fourFiction = new ArrayList<>();
        try {
            fourFiction= service.getFourList();
            for (Fiction fiction:fourFiction
                 ) {
                fiction.setIntro(fiction.getIntro().substring(0,60)+"……") ;

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return fourFiction;
    }

    /**
     * 主页右侧强推书展示栏
     * @return
     */
    private  List<Fiction> qiangtuiFiction(){
       FictionService service = new FictionService();
        List<Fiction> qiangTui = new ArrayList<>();
        try {
            qiangTui = service.getQiangTui();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return qiangTui;
    }

    /**
     * 中部六大类小说的类别名字,并且将每类小说封装到类别下
     * @return
     */
    private List<Type> typeList(){
        TypeService service = new TypeService();
        FictionService fictionService = new FictionService();
        List<Type> typeList = new ArrayList<>();
        try {
            typeList = service.getSixType();

            for (Type type : typeList
                 ) {
                List<Fiction> fictions = fictionService.fictionList(type.getId());
                type.setFictionList(fictions);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return  typeList;
    }

    /**
     * 最新章节
     * @return
     */
    public List<Section> getNewSections(){
        SectionService service = new SectionService();
        List<Section> newSections = null;
        try {
            newSections = service.getNewSection();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return  newSections;
    }
    /**
     * 最新入库小说
     *
     */
    public List<Fiction> getNewFiction(){
        FictionService service = new FictionService();
        List<Fiction> newFictions = new ArrayList<>();
        try {
            newFictions = service.getNewFictions();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return newFictions;
    }

}
