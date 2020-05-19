package org.example.hystrixdashborad.serviceb.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author yeqiang
 * @since 5/19/20 3:16 PM
 */
@RestController
@RequestMapping("/bb")
public class BbApiController {
    @Value("${params.p2}")
    String p2;

    @RequestMapping("api1")
    public String api1() throws InterruptedException {
        Thread.sleep(99999);
        return p2;
    }
}
