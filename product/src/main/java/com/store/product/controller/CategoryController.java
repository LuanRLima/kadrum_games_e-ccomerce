package com.store.product.controller;

import com.store.product.domain.Category;
import com.store.product.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/category")
public class CategoryController extends GenericController<Category>{
    public CategoryController(CategoryService service){ super(service); }

    @Autowired
    private CategoryService categoryService;

    @PostMapping
    public ResponseEntity<Void> create(@RequestBody Category category) {
        categoryService.save(category);
        return ResponseEntity.ok().build();
    }


    @GetMapping
    public ResponseEntity<List<Category>> getAll() {
        return ResponseEntity.ok(categoryService.getAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Category> get(@PathVariable Long id, String noSuchElementException) {
        return ResponseEntity.ok(categoryService.get(id, "Category not found"));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Category> update(@PathVariable Long id, @RequestBody Category category) {
        return ResponseEntity.ok(categoryService.update(id, category));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        categoryService.delete(id);
        return ResponseEntity.ok().build();
    }
}


