package org.techstore.fullstack.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.techstore.fullstack.model.Product;
import org.techstore.fullstack.service.AdminService;
import org.techstore.fullstack.web.request.AdminRequest;
import org.techstore.fullstack.web.response.GetProductsResponse;

import java.util.List;
import java.util.Optional;

@RestController
        @RequestMapping("/api/v1/admin")
@RequiredArgsConstructor

public class AdminController {
    private final AdminService productService;
    @GetMapping("/Product")
    public ResponseEntity<Page<GetProductsResponse>> getAllProduct(
            @RequestParam(defaultValue = "5") int pageSize,
            @RequestParam(defaultValue = "5") int pageNumber,
            @RequestParam(defaultValue = "price") String[] sort
    ) {
        Page<GetProductsResponse> allProducts = productService.getAllProducts(pageNumber,pageSize,sort);
        return new ResponseEntity<>(allProducts, HttpStatus.    OK);
    }

    @PostMapping("/Save")
    public ResponseEntity<Product> CreatedProduct(@RequestBody AdminRequest request) {
        productService.create(request);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }
    @PutMapping("/Update")
    public ResponseEntity<Optional<Product>> updateProduct(@RequestBody AdminRequest request) {
        productService.Update(request);
        return new ResponseEntity<>(HttpStatus.OK);
    }
    @DeleteMapping("/Delete/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void CreatedProduct(@PathVariable("id") Integer id) {
        productService.Delete(id);
    }
    @PostMapping("/FindNameBY")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @ResponseStatus(HttpStatus.OK)
    public List<GetProductsResponse> FindNameBY(
            @RequestParam(defaultValue = "") String name
    ) {
        return productService.FindNameBy(name);
    }
    @PostMapping("/FindPriceBY")
    @ResponseStatus(HttpStatus.OK)
    public List<GetProductsResponse> FindPriceBY(
            @RequestParam(defaultValue = "") double price
    ) {
        return productService.FindPrice(price);
    }

}
