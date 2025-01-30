package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {
    
    @GetMapping("/hello")
    @ResponseBody
    public String sayHello(@RequestParam(required = false, defaultValue = "World") String name) {
        return "Hello, " + name + "!";
    }
}