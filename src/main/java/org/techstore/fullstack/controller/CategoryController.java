package org.techstore.fullstack.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.techstore.fullstack.DTO.CategoryDto;
import org.techstore.fullstack.service.CategoryService;

import java.util.List;

@RestController
@RequestMapping("/api/v1")
@RequiredArgsConstructor
public class CategoryController {
    final CategoryService categoryService;

    @GetMapping("/Category")
    public List<CategoryDto> getAllCategory() {
        return categoryService.getAllCategory();
    }
}
