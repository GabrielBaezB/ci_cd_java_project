package com.certificacion.ci_cd_java_project;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HelloController {
    
    @GetMapping("/") 
    public String hello(Model model) {
        model.addAttribute("message", "Hello World");
        return "Hello";
    }
}
