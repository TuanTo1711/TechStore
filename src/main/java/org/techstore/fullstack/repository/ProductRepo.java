package org.techstore.fullstack.repository;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
//import org.techstore.fullstack.model.Category;
import org.techstore.fullstack.model.Product;

public interface ProductRepo extends JpaRepository<Product, Long> {
}
