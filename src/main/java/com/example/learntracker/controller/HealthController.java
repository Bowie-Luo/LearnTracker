package com.example.learntracker.controller;

import com.example.learntracker.common.Result;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class HealthController {
    
    @GetMapping("/health")
    public Result<String> health() {
        return Result.success("LearnTracker is running!");
    }
}