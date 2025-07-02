package com.appchat.controller.user;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
public class UserController {

    @GetMapping
    public String getAllUsers() {
        return "List of users";
    }
}