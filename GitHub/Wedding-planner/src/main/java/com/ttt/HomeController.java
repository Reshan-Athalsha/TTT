package com.ttt;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * HomeController — Shared landing page and OOP concepts page for TTT.
 */
@Controller
public class HomeController {

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/oop")
    public String oopConcepts() {
        return "oop";
    }
}
