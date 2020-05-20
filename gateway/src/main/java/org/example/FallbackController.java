package org.example;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author yeqiang
 * @since 5/20/20 3:03 PM
 */
@RestController
public class FallbackController {
    @RequestMapping("/fallback")
    public String fallback() {
        return "fallback";
    }
}
