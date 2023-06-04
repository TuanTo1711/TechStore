package org.techstore.fullstack.service;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.techstore.fullstack.model.Product;
import org.techstore.fullstack.model.Report;
import org.techstore.fullstack.web.request.AdminRequest;
import org.techstore.fullstack.web.response.GetProductsResponse;

import java.util.List;
import java.util.Optional;

public interface AdminService {

    Page<GetProductsResponse> getAllProducts(Integer pageNumber, Integer pageSize,String[] sort);

    public Product create(AdminRequest request);

    Optional<Product> Update(AdminRequest request);

    void Delete(Integer id);

    void DeleteRepost(Integer id);

    List<GetProductsResponse> FindNameBy(String name);

    List<GetProductsResponse> FindPrice(Double piece);
    List<Report> findbyName(String name);
    List<Report> SaveReport();
    List<Report> FindAll();


}
