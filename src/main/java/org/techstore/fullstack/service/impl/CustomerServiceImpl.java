package org.techstore.fullstack.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.techstore.fullstack.repository.CustomerRepository;
import org.techstore.fullstack.service.CustomerService;
import org.techstore.fullstack.web.response.CustomerInfo;

@Service
@RequiredArgsConstructor
public class CustomerServiceImpl implements CustomerService {

    private final CustomerRepository customerRepository;

    @Override
    public CustomerInfo getCustomerInfo(String email) {
        return customerRepository.findByEmail(email, CustomerInfo.class);
    }

    @Override
    public CustomerInfo getCustomerInfo() {
        return null;
    }
}
