package com.store.product.repository;

import com.store.product.domain.Category;
import com.store.product.domain.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category, Long> {
}
