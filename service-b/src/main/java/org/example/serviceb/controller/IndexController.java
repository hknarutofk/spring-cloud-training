package org.example.serviceb.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author yeqiang@greatwall.com.cn
 */
@RestController
public class IndexController {
    @Value("${params.p2}")
    String p2 = "22_default";

    @RequestMapping("/getParam")
    public String getParam() {
        return p2;
    }
}
