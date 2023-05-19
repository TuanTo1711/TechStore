package org.techstore.fullstack.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.techstore.fullstack.DTO.ProductDto;
import org.techstore.fullstack.model.Product;
import org.techstore.fullstack.service.ProductService;

import java.util.List;

@RestController
@RequestMapping("/api/v1")
@RequiredArgsConstructor
public class ProductController {

    final ProductService productService;

    @GetMapping("/Product")
    public List<ProductDto> getAllProducts(){
        List<ProductDto> categories = productService.getAllProducts();
        for (var category: categories) {
            System.out.println(category.toString());
        }
        return categories;
    }
}
