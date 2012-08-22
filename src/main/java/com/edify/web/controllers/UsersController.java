package com.edify.web.controllers;

import com.edify.model.User;
import com.edify.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: <a href="https://github.com/jarias">jarias</a>
 */
@Controller
@RequestMapping("/users")
public class UsersController {
    @Autowired
    private UserRepository userRepository;

    @RequestMapping(method = RequestMethod.GET, value = "/index")
    public String index() {
        return "users/index";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/list")
    public @ResponseBody Map list(HttpServletRequest request) {
        List<User> users = userRepository.findAll();
        List<String[]> aaData = new ArrayList<String[]>();
        for (User user : users) {
            String el[] = {String.valueOf(user.getId()), user.getFirstName(), user.getLastName(), user.getUsername()};
            aaData.add(el);
        }
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("sEcho", request.getParameter("sEcho"));
        result.put("iTotalRecords", userRepository.count());
        result.put("iTotalDisplayRecords", userRepository.count());
        result.put("aaData", aaData);

        return result;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/create")
    public String create() {
        return "users/create";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/save")
    public String save() {
        return "redirect:/users/index";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/edit")
    public String edit() {
        return "users/edit";
    }

    @RequestMapping(method = RequestMethod.PUT, value = "/update")
    public String update() {
        return "redirect:/users/index";
    }

    @RequestMapping(method = RequestMethod.DELETE, value = "/delete")
    public String delete() {
        return "redirect:/users/index";
    }
}
