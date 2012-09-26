package com.edify.web.controllers;

import com.edify.model.User;
import com.edify.repositories.UserRepository;
import org.hibernate.validator.HibernateValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Validation;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.validation.Valid;

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
    public
    @ResponseBody
    Map list(HttpServletRequest request) {
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
    public String create(Model model) {
        model.addAttribute("user", new User());
        return "users/create";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/save")
    public String save(@Valid @ModelAttribute User user, BindingResult result, final RedirectAttributes redirectAttrs, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("error", "Validation errors pelase check the form and re-submit");
            return "users/create";
        } else {
            userRepository.save(user);
            redirectAttrs.addFlashAttribute("message", "All OK!");
            return "redirect:/users/index";
        }
    }

    @RequestMapping(method = RequestMethod.GET, value = "/edit/{id}")
    public String edit(@PathVariable("id") Long id) {
        return "users/edit";
    }

    @RequestMapping(method = RequestMethod.PUT, value = "/update")
    public String update() {
        return "redirect:/users/index";
    }

    @RequestMapping(method = RequestMethod.DELETE, value = "/delete")
    public String delete(@RequestParam(value = "id") Long id, RedirectAttributes redirectAttrs) {
        userRepository.delete(id);
        redirectAttrs.addFlashAttribute("message", "users.form.message.delete.successful");
        return "redirect:/users/index";
    }
}
