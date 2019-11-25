package com.test.dao;

import com.test.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

public interface UserDAO {

    void add(User user);

    void delete(User user);

    void update(User user);

    User select(String id);

    /**
     * TODO: 列表查询
     * @return
     */
    List<User> selectAll();

}
