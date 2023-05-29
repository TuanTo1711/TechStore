package org.techstore.fullstack.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.techstore.fullstack.repository.ProductRepository;
import org.techstore.fullstack.repository.info.ProductInfo;
import org.techstore.fullstack.service.ProductService;
import org.techstore.fullstack.web.response.GetProductsResponse;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;

    @Override
    public List<GetProductsResponse> getAllProducts() {
        List<ProductInfo> products = productRepository.findAllBy(ProductInfo.class);
        return products.stream().map(this::toResponse).toList();
    }

    private GetProductsResponse toResponse(ProductInfo productInfo) {
        return GetProductsResponse.builder()
                .id(productInfo.getId())
                .productName(productInfo.getName())
                .categoryName(productInfo.getCategory().getCategoryName())
                .brand(productInfo.getCategory().getCategoryBrand())
                .price(productInfo.getPrice())
                .description(productInfo.getDescription())
                .build();
    }
}
