package org.techstore.fullstack.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.techstore.fullstack.DTO.CategoryDto;
import org.techstore.fullstack.repository.CategoryRepo;
import org.techstore.fullstack.service.CategoryService;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {

    final CategoryRepo categoryRepo;
    @Override
    public List<CategoryDto> getAllCategory() {
        return categoryRepo.findAll().stream().map(category -> {
            return new CategoryDto(category.getId(), category.getDescription());
        }).toList();
    }
}
