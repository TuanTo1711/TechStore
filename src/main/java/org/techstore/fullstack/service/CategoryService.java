package org.techstore.fullstack.service;

import org.springframework.stereotype.Repository;
import org.techstore.fullstack.DTO.CategoryDto;
import org.techstore.fullstack.model.Category;

import java.util.List;

@Repository
public interface CategoryService {
    List<CategoryDto> getAllCategory();
}
