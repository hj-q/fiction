package org.jgs1905.service;

import org.jgs1905.dao.TypeDao;
import org.jgs1905.entity.Type;
import java.sql.SQLException;
import java.util.List;

public class TypeService {
    TypeDao typeDao = new TypeDao();

    /**
     * 获取所有的类
     * @return List<Type>
     * @throws SQLException
     */
    public List<Type> getTypes() throws SQLException {

        return  typeDao.getTypes();
    }

    /**
     * 通过类别id修改小说类别的点击量
     * @param id
     * @return
     * @throws SQLException
     */
    public int  updateHits(int id) throws SQLException {
        return typeDao.update(id);
    }

    /**
     * 通过小说类别名字获取小说类别的id
     * @param name
     * @return
     */
    public int getType(String name){

        return typeDao.selectOne(name).getId();
    }

    public String getNameById(int id) throws SQLException {
       return typeDao.getNameById(id).getName();
    }
    public  List<Type> getSixType() throws SQLException {

        return  typeDao.getTypeList();
    }
}
