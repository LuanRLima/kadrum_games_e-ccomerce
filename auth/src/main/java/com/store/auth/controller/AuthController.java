package com.store.auth.controller;

import com.store.auth.domain.User;
import com.store.auth.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("api/auth")
public class AuthController extends GenericController<User>{
    public AuthController(UserService service){ super(service); }

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public ResponseEntity<Boolean> login(@RequestParam String email, @RequestParam String password) {
        if (!userService.validateCredentials(email, password)) {
            return ResponseEntity.ok(false);
        }
        return ResponseEntity.ok(true);
    }
}


