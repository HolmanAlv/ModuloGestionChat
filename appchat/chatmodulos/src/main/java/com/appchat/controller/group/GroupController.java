package com.appchat.controller.group;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/groups")
public class GroupController {

    @GetMapping
    public String getAllGroups() {
        return "List of groups";
    }
}