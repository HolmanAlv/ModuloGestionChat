package com.appchat.controller.message;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/messages")
public class MessageController {

    @GetMapping
    public String getAllMessages() {
        return "List of messages";
    }
}