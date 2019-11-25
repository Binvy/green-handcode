package com.binvi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/5/14 0:14
 */
@Controller
public class TestController {

    @RequestMapping(value = "test", method = RequestMethod.GET)
    public String test() {
        return "test";
    }

}
