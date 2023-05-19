package org.techstore.fullstack.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//import org.techstore.fullstack.model.Category;
import org.techstore.fullstack.DTO.ProductDto;
import org.techstore.fullstack.model.Product;
import org.techstore.fullstack.repository.ProductRepo;
import org.techstore.fullstack.service.ProductService;

import java.util.Collections;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

    final
    ProductRepo productRepo;

    @Override
    public List<ProductDto> getAllProducts() {
        return productRepo.findAll().stream().map(product -> {
            return new ProductDto(product.getId(), product.getName(), product.getPrice(), product.getSaleOff());
        }).toList();
    }
}
