package org.techstore.fullstack.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.techstore.fullstack.model.Product;
import org.techstore.fullstack.repository.ProductRepository;
import org.techstore.fullstack.web.request.ProductRequest;
import org.techstore.fullstack.web.response.ProductResponse;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProductService {
    private final ProductRepository productRepository;

    public void createProduct(ProductRequest productRequest){
        Product product = Product.builder()
                .name(productRequest.getName())
                .description(productRequest.getDescription())
                .price(productRequest.getPrice()).build();

        productRepository.save(product);
        log.info("Product {} is save " , product.getName() );
    }


    public List<ProductResponse> getAllProduct() {
        List<Product> products = productRepository.findAll();
        return products.stream().map(this::mapToProductResponse).toList();
    }

    private ProductResponse mapToProductResponse(Product product){
        return ProductResponse.builder()
                .id(product.getId())
                .name(product.getName())
                .description(product.getDescription())
                .price(product.getPrice())
                .build();
    }

    public List<ProductResponse> searchProductByName(String name) {
        List<Product> foundProducts = productRepository.searchProductByName("%" + name + "%");
        if (foundProducts.size() > 0) {
            return foundProducts.stream()
                    .map(this::mapToProductResponse)
                    .collect(Collectors.toList());
        }else{
            return null;
        }
    }

    public ProductResponse updateProduct(ProductRequest request){
        Optional<Product> foundProducts = productRepository.findById(Long.valueOf(request.getId()));
        if (foundProducts.isPresent()) {
            Product product = foundProducts.get();
            product.setName(request.getName());
            product.setDescription(request.getDescription());
            product.setPrice(request.getPrice());
            productRepository.save(product);
            log.info("Product {} is updated", product.getName());
            return mapToProductResponse(product);
        }else {
            log.error("Product not Found");
            throw new IllegalArgumentException("Product not found");
        }
    }

    public void deleteProduct(Long id) {
        Optional<Product> foundProduct = productRepository.findById(id);
        if (foundProduct.isPresent()) {
            productRepository.delete(foundProduct.get());
            log.info("Product {} is deleted", foundProduct.get().getName());
        } else {
            log.error("Product not found");
            throw new IllegalArgumentException("Product not found");
        }
    }


}
