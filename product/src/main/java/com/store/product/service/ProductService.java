package com.store.product.service;

import com.store.product.domain.Product;

import java.util.List;

public interface ProductService extends GenericService<Product>{

    public Product update(Long id, Product product);

}
