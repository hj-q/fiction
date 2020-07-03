package org.jgs1905.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.jgs1905.entity.Type;
import org.jgs1905.utils.DataSourceUtil;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.List;

public class TypeDao {
    /**
     * 获取所有的小说类别
     * @return typeList
     * @throws SQLException
     */
    public List<Type> getTypes() throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());

        String sql = " SELECT * FROM type ORDER BY type.hits DESC LIMIT 1,11";

        List<Type> typeList = qr.query(sql, new BeanListHandler<>(Type.class));

        return typeList;
    }

    /**
     * 小说的点击量+1
     * @param id
     * @return
     */
    public int update(int id) throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
        String sql = "UPDATE type set hits = hits+1 where type.id = ?";
        int result = qr.update(sql,id);
        return result;
    }

    public Type selectOne(String name) {

        return null;
    }

    public Type getNameById(int id) throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
        String sql ="SELECT type.`name` FROM type WHERE id = ?";
        Type type = qr.query(sql,new BeanHandler<>(Type.class),id);
        return type;
    }

    public List<Type> getTypeList() throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
        String sql = "SELECT type.`name`,type.id FROM type ORDER BY type.hits DESC LIMIT 0,6";
        List<Type> typeList = qr.query(sql, new BeanListHandler<>(Type.class));

        return typeList;
    }

    public Type getTypeId(int id) throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
        String sql ="SELECT type.* FROM type WHERE id = ?";
        Type type = qr.query(sql,new BeanHandler<>(Type.class),id);
        return type;
    }
}
