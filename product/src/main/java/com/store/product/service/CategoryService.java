package com.store.product.service;

import com.store.product.domain.Category;

public interface CategoryService extends GenericService<Category>{

    public Category update(Long id, Category category);
}
