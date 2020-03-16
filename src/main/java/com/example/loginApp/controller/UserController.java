package com.example.loginApp.controller;

import com.example.loginApp.model.User;
import com.example.loginApp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.Enumeration;

@Controller
public class UserController {
    @Autowired
    private UserRepository repo;

    @GetMapping({"/","/index","/homepage"})
    public ModelAndView index(HttpSession session){
        Enumeration<String> attributes = session.getAttributeNames();
        while (attributes.hasMoreElements()) {
            String attribute = (String) attributes.nextElement();
            System.out.println(attribute+" : "+session.getAttribute(attribute));
        }
        return new ModelAndView("index");
    }
    @GetMapping("/login")
    public ModelAndView loginView(Principal principal){
        ModelAndView mv = new ModelAndView("redirect:/");
        if(principal==null){
            mv.addObject("mode","MODE_LOGIN");
            mv.setViewName("index");
        }
        return mv;
    }
    @RequestMapping("/about")
    public ModelAndView aboutUser(Principal principal){
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("mode","MODE_ABOUT");
        mv.addObject("user",repo.findByUsername(principal.getName()));
        return mv;
    }
    @GetMapping("/register")
    public ModelAndView registerView(Principal principal){
        ModelAndView mv = new ModelAndView("redirect:/");
        if(principal==null) {
            mv.addObject("mode", "MODE_REGISTER");
            mv.setViewName("index");
        }
        return mv;
    }
    @PostMapping("/register")
    public String registerUser(User user){
        user.setPassword((new BCryptPasswordEncoder()).encode(user.getPassword()));
        repo.save(user);
        return "redirect:/login";
    }
}
