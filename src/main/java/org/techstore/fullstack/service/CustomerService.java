package org.techstore.fullstack.service;

import org.techstore.fullstack.web.response.CustomerInfo;

public interface CustomerService {
    CustomerInfo getCustomerInfo(String email);

    CustomerInfo getCustomerInfo();
}
