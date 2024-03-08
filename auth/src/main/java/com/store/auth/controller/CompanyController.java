package com.store.auth.controller;

import com.store.auth.domain.Company;
import com.store.auth.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/company")
public class CompanyController extends GenericController<Company>{
    public CompanyController(CompanyService service){ super(service); }

    @Autowired
    private CompanyService companyService;
    @PostMapping
    public ResponseEntity<Void> create(@RequestBody Company company) {
        companyService.save(company);
        return ResponseEntity.ok().build();
    }


    @GetMapping
    public ResponseEntity<List<Company>> getAll() {
        return ResponseEntity.ok(companyService.getAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Company> get(@PathVariable Long id, String noSuchElementException) {
        return ResponseEntity.ok(companyService.get(id, "Company not found"));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Company> update(@PathVariable Long id, @RequestBody Company company) {
        return ResponseEntity.ok(companyService.update(id, company));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        companyService.delete(id);
        return ResponseEntity.ok().build();
    }
}
