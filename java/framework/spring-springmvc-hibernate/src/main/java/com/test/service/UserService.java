package com.test.service;

import com.test.dao.UserDAO;
import com.test.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

public interface UserService {

    void save(User user);

    void delete(User user);

    void update(User user);

    User getById(String id);

    List<User> getAll();

}
