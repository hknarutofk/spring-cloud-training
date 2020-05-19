package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author yeqiang@greatwall.com.cn
 */
@RestController
public class IndexController {
    @Value("${params.p1}")
    String p1;

    @RequestMapping("/getParam")
    public String getParam() {
        return p1;
    }
}
