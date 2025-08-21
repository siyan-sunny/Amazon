package com.Amazon.AmazonApp;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Hello {

    @RequestMapping("/")
    public String helloWorld(){
        return "Hello World, Welcome to Amazon App";
    }
}
