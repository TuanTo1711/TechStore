package org.techstore.fullstack.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.techstore.fullstack.model.Product;
import org.techstore.fullstack.model.Report;
import org.techstore.fullstack.repository.ProductRepository;
import org.techstore.fullstack.repository.RepostRepositioy;
import org.techstore.fullstack.service.AdminService;
import org.techstore.fullstack.web.request.AdminRequest;
import org.techstore.fullstack.web.response.GetProductsResponse;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {


    private final ProductRepository productRepository;
    private final RepostRepositioy repostRepositioy;

    @Override
    public Page<GetProductsResponse> getAllProducts(Integer pageNumber, Integer pageSize,String[] sort) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize, Sort.by(Sort.Direction.DESC,sort));
        Page<Product> products = productRepository.findAll(pageable);
        return products.map(this::toResponse);
    }
    @Override
    public Product create(AdminRequest request) {
        Product product = Product.builder()
                .id(request.getId())
                .name(request.getProductName())
                .description(request.getDescription())
                .price(request.getPrice())
                .build();
        return productRepository.save(product);
    }

    @Override
    public Optional<Product> Update(AdminRequest request) {
        Optional<Product> product = productRepository.findById(request.getId());
        if (product.isPresent()) {
            create(request);
        }
        return product;
    }

    @Override
    public void Delete(Integer id) {
        productRepository.deleteById(id);
    }

    @Override
    public void DeleteRepost(Integer id) {
        repostRepositioy.deleteById(id);
    }

    @Override
    public List<GetProductsResponse> FindNameBy(String name) {
        List<Product> product = productRepository.findProductByName("%" + name + "%");
        return product.stream().map(this::toResponse).toList();
    }
    @Override
    public List<GetProductsResponse> FindPrice(Double piece) {
        List<Product> product = productRepository.findProductByPrice(piece);
        return product.stream().map(this::toResponse).toList();
    }

    @Override
    public List<Report> findbyName(String name) {
        return repostRepositioy.findByCategoryName(name);
    }

    @Override
    public List<Report> SaveReport() {
        List<Report>  reports=  productRepository.getReports();
        return repostRepositioy.saveAll(reports);
    }

    @Override
    public List<Report> FindAll() {
        return repostRepositioy.findAll();
    }


    private GetProductsResponse toResponse(Product productInfo) {
        return GetProductsResponse.builder()
                .id(productInfo.getId())
                .name(productInfo.getName())
                .productName(productInfo.getName())
                .price(productInfo.getPrice())
                .description(productInfo.getDescription())
                .brand(productInfo.getCategory().getCategoryBrand())
                .categoryName(productInfo.getCategory().getCategoryName())
                .build();
    }


}
