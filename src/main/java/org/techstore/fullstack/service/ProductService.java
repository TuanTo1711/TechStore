package org.techstore.fullstack.service;

import org.springframework.stereotype.Service;
import org.techstore.fullstack.DTO.ProductDto;

import java.util.List;

@Service
public interface ProductService {
    List<ProductDto> getAllProducts();
}
