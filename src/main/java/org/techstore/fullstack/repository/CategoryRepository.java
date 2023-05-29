package org.techstore.fullstack.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.techstore.fullstack.model.Category;

import java.util.List;

public interface CategoryRepository extends JpaRepository<Category, Long> {
    <T> List<T> findBy(Class<T> classType);
    <T> List<T> findById(Integer id, Class<T> classType);
}
