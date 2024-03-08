package com.store.product.controller;

import com.store.product.domain.Product;
import com.store.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/product")
public class ProductController extends GenericController<Product>{
    public ProductController(ProductService service){ super(service); }

    @Autowired
    private ProductService productService;

    @PostMapping
    public ResponseEntity<Void> create(@RequestBody Product product) {
        productService.save(product);
        return ResponseEntity.ok().build();
    }


    @GetMapping
    public ResponseEntity<List<Product>> getAll() {
        return ResponseEntity.ok(productService.getAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Product> get(@PathVariable Long id, String noSuchElementException) {
        return ResponseEntity.ok(productService.get(id, "Product not found"));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Product> update(@PathVariable Long id, @RequestBody Product product) {
        return ResponseEntity.ok(productService.update(id, product));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        productService.delete(id);
        return ResponseEntity.ok().build();
    }
}


