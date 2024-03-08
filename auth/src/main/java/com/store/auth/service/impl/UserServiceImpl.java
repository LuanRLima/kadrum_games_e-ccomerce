package com.store.auth.service.impl;

import com.store.auth.domain.Company;
import com.store.auth.domain.User;
import com.store.auth.repository.UserRepository;
import com.store.auth.service.UserService;
import org.springframework.stereotype.Service;

import java.util.Optional;


@Service
public class UserServiceImpl extends GenericServiceImpl<User, Long, UserRepository> implements UserService {
    public UserServiceImpl(UserRepository repository){ super(repository); }

    @Override
    public User update(Long id, User user) {
        get(id, "Company not found");
        return repository.save(user);
    }

    @Override
    public boolean validateCredentials(String email, String password) {
        Optional<User> userOptional = repository.findByEmail(email);
        if(userOptional.isPresent()){
            User user = userOptional.get();
            return user.getPassword().equals(password);
        }
        return false;
    }

}
