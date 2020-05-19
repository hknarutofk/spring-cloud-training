package com.example.servicea.service;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author yeqiang
 * @since 5/19/20 3:20 PM
 */
@FeignClient("service-b")
public interface ServiceB {
    @RequestMapping(value = "/bb/api1")
    String api1();
}
