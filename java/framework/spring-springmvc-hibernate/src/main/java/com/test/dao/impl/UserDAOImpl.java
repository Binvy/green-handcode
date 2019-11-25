package com.test.dao.impl;

import com.test.dao.UserDAO;
import com.test.entity.User;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDAOImpl extends BaseDAOImpl implements UserDAO {

    @Override
    public void add(User user) {
        getSession().save(user);
    }

    @Override
    public void delete(User user) {
        getSession().delete(user);
    }

    @Override
    public void update(User user) {
        getSession().update(user);
    }

    @Override
    public User select(String id) {
        User user = getSession().get(User.class, id);
        return user;
    }

    /**
     * TODO: 列表查询
     * @return
     */
    @Override
    public List<User> selectAll() {
        String queryString = "from User";
        Query query = getSession().createQuery(queryString);
        return (List<User>)query.list();
    }

}
