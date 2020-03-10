package com.example.loginApp.controller;

import com.example.loginApp.model.User;
import com.example.loginApp.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
    @Autowired
    CustomerRepository repo;

    @RequestMapping("/")
    public String index(){
        return "index";
    }
    @RequestMapping("/login")
    public ModelAndView loginView(){
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("mode","MODE_LOGIN");
        return mv;
    }
    @RequestMapping("/register")
    public ModelAndView registerView(){
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("mode","MODE_REGISTER");
        return mv;
    }
    @PostMapping("/register")
    public String registerUser(User user){
        repo.save(user);
        return "index";
    }
}
