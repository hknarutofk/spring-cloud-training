package com.example.servicea.service.impl;

import org.springframework.stereotype.Component;

import com.example.servicea.service.ServiceB;

/**
 * @author yeqiang
 *         https://cloud.spring.io/spring-cloud-static/spring-cloud-openfeign/2.2.2.RELEASE/reference/html/#spring-cloud-feign-hystrix
 * @since 5/19/20 3:39 PM
 */
@Component
public class ServiceBFallback implements ServiceB {
    @Override
    public String api1() {
        return "fallback";
    }
}
