package com.example.loginApp.controller;

import com.example.loginApp.model.User;
import com.example.loginApp.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    CustomerRepository repo;

    @GetMapping({"/","/index"})
    public String index(){
        return "index";
    }
    @GetMapping("/login")
    public ModelAndView loginView(HttpSession session){
        ModelAndView mv = new ModelAndView("redirect:/");
        if(session.getAttribute("loggedin")==null){
            mv.addObject("mode","MODE_LOGIN");
            mv.setViewName("index");
        }
        return mv;
    }
    @PostMapping("/login")
    public ModelAndView loginUser(User user, HttpSession session){
        ModelAndView mv = new ModelAndView("redirect:/");
        User dbusr=repo.findByUsernameAndPassword(user.getUsername(),user.getPassword());
        if(dbusr!=null){
            session.setAttribute("loggedin",true);
            session.setAttribute("username",dbusr.getUsername());
        }
        else{
            mv.setViewName("redirect:/login");
        }
        return mv;
    }
    @RequestMapping("/logout")
    public String logoutUser(HttpSession session){
        if(session!=null){
            session.invalidate();
        }
        return "redirect:/login";
    }
    @GetMapping("/register")
    public ModelAndView registerView(HttpSession session){
        ModelAndView mv = new ModelAndView("redirect:/");
        if(session.getAttribute("loggedin")==null) {
            mv.addObject("mode", "MODE_REGISTER");
            mv.setViewName("index");
        }
        return mv;
    }
    @PostMapping("/register")
    public String registerUser(User user){
        repo.save(user);
        return "redirect:/login";
    }
}
