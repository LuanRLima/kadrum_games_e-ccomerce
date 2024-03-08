package com.store.auth.service.impl;

import com.store.auth.domain.Company;
import com.store.auth.repository.CompanyRepository;
import com.store.auth.service.CompanyService;
import org.springframework.stereotype.Service;


@Service
public class CompanyServiceImpl extends GenericServiceImpl<Company, Long, CompanyRepository> implements CompanyService {
    public CompanyServiceImpl(CompanyRepository repository){ super(repository); }

    @Override
    public Company update(Long id, Company company) {
        get(id, "Company not found");
        return repository.save(company);
    }

}
