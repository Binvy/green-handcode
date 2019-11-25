package com.test.controller;

import com.test.entity.User;
import com.test.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping(path = "/{id}")
    public String get(@PathVariable String id) {
        return userService.getById(id).toString();
    }

    @GetMapping(path = "/all")
    public String getAll() {
        return userService.getAll().toString();
    }

    @PostMapping(path = "/add/{user}")
    public void add(@RequestBody User user) {
        userService.save(user);
    }

    @PostMapping(path = "/delete/{user}")
    public void delete(@RequestBody User user) {
        userService.delete(user);
    }

}
