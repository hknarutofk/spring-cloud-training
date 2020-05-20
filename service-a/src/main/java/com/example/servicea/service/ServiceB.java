package com.example.servicea.service;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.servicea.service.impl.ServiceBFallback;

/**
 * @author yeqiang
 * @since 5/19/20 3:20 PM
 */
@FeignClient(value = "service-b", fallback = ServiceBFallback.class)
public interface ServiceB {
    @RequestMapping(value = "/service-b/bb/api1")
    String api1();
}
