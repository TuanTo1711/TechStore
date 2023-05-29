package org.techstore.fullstack.service;


import org.techstore.fullstack.web.response.GetProductsResponse;

import java.util.List;

public interface ProductService {

    List<GetProductsResponse> getAllProducts();
}
