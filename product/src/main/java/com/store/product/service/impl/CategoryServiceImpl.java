package com.store.product.service.impl;

import com.store.product.domain.Category;
import com.store.product.repository.CategoryRepository;
import com.store.product.service.CategoryService;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl extends GenericServiceImpl<Category, Long, CategoryRepository> implements CategoryService {
    public CategoryServiceImpl(CategoryRepository repository){ super(repository); }

    @Override
    public Category update(Long id, Category category) {
        get(id, "Category not found");
        return repository.save(category);
    }
}