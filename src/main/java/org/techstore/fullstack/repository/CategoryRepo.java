package org.techstore.fullstack.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.techstore.fullstack.model.Category;

public interface CategoryRepo extends JpaRepository<Category, Long> {
}
