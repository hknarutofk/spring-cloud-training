package com.example.servicea.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.servicea.service.ServiceB;

/**
 * @author yeqiang@greatwall.com.cn
 */
@RestController
public class IndexController {
    @Value("${params.p1}")
    String p1;

    @Autowired
    ServiceB serviceB;

    @RequestMapping("/getParam")
    public String getParam() {
        return p1 + serviceB.api1();
    }
}
