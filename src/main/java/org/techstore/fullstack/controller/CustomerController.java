package org.techstore.fullstack.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.techstore.fullstack.service.CustomerService;
import org.techstore.fullstack.web.response.CustomerInfo;

@RestController
@RequestMapping("/api/v1/customer")
@RequiredArgsConstructor
public class CustomerController {

    private final CustomerService customerService;

    @GetMapping
    public CustomerInfo getCustomer(@RequestParam("email") String email) {
        return customerService.getCustomerInfo(email);
    }
}
