package com.test.service.impl;

import com.test.dao.UserDAO;
import com.test.entity.User;
import com.test.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDAO userDAO;

    @Override
    public void save(User user) throws Exception {
        userDAO.add(user);
    }

    @Override
    public User getById(String id) throws Exception{
        return userDAO.select(id);
    }

    @Override
    public List<User> getAll() throws Exception {
        return userDAO.selectAll();
    }

    @Override
    public void delete(User user) throws Exception {
        userDAO.delete(user);
    }

    @Override
    public void update(User user) throws Exception {
        userDAO.update(user);
    }

}
