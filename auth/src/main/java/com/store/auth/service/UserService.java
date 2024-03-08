package com.store.auth.service;

import com.store.auth.domain.Company;
import com.store.auth.domain.User;

import java.util.List;

public interface UserService extends GenericService<User>{

    public User update(Long id, User user);

    public boolean validateCredentials(String email, String password);

}
