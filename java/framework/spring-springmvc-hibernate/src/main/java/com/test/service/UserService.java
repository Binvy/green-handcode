package com.test.service;

import com.test.dao.UserDAO;
import com.test.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

public interface UserService {

    void save(User user) throws Exception;

    void delete(User user) throws Exception;

    void update(User user) throws Exception;

    User getById(String id) throws Exception;

    List<User> getAll() throws Exception;

}
