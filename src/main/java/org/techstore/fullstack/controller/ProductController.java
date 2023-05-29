package org.techstore.fullstack.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.techstore.fullstack.Projection.CategorySlim;
import org.techstore.fullstack.Projection.ProductWithData;
import org.techstore.fullstack.repository.CategoryRepository;
import org.techstore.fullstack.repository.ProductRepository;
import org.techstore.fullstack.service.ProductService;
import org.techstore.fullstack.web.request.ProductRequest;
import org.techstore.fullstack.web.response.ProductResponse;

import java.util.List;

@RestController
@RequestMapping("/product")
@RequiredArgsConstructor
public class ProductController {
    private final ProductService productService;
    private final CategoryRepository categoryRepository;
    private final ProductRepository productRepository;

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public void createProduct(@RequestBody ProductRequest productDTO){
        productService.createProduct(productDTO);
    }

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public List<ProductResponse> getAllProduct() {
       return productService.getAllProduct();
    }

    @GetMapping("/search/{name}")
    @ResponseStatus(HttpStatus.FOUND)
    public List<ProductResponse> searchProductByName(@PathVariable String name){
        return productService.searchProductByName(name);
    }

    @PutMapping("/update/{id}")
    @ResponseStatus(HttpStatus.ACCEPTED)
    public ProductResponse updateProduct(@PathVariable Integer id, @RequestBody ProductRequest request){
        request.setId(id);
        return productService.updateProduct(request);
    }

    @DeleteMapping("delete/{id}")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<String> deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
        return ResponseEntity.ok("Product deleted successfully");
    }

    @GetMapping("/ProductWithCategory")
    public List<CategorySlim> getCategoryProduct(){
        return categoryRepository.findBy(CategorySlim.class);
    }

    @GetMapping("ProductWith/{id}")
    public ProductWithData getIdProduct(@PathVariable Integer id){
        return productRepository.findById(id, ProductWithData.class);
    }

    @GetMapping("Category/{id}")
    public List<CategorySlim> getIdCategory(@PathVariable Integer id) {
        return categoryRepository.findById(id, CategorySlim.class);
    }

}
