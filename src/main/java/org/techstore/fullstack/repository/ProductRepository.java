package org.techstore.fullstack.repository;

import jakarta.persistence.criteria.Predicate;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.techstore.fullstack.model.Product;
import org.techstore.fullstack.model.Report;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer>, JpaSpecificationExecutor<Product> {
     List<Product> findProductsByIdOrName(Integer id, String name);
     List<Product> findProductByName(String name);

     List<Product> findProductByPrice(Double price);

     @Query("""
        SELECT new Report(o.category.id, o.category.categoryName, SUM(o.price), COUNT(o))
        FROM Product o 
        GROUP BY o.category,o.category.categoryName,o.category.id
        ORDER BY SUM(o.price) 
""")
     List<Report> getReports();
}