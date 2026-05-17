package com.ttt.component02.controller;

import com.ttt.component02.model.*;
import com.ttt.component02.repository.VendorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.UUID;

/** COMPONENT 02 — Vendor Management Controller (Full CRUD) */
@Controller
@RequestMapping("/vendors")
public class VendorController {

    @Autowired private VendorRepository vendorRepository;

    // READ: List vendors (with optional category filter)
    @GetMapping
    public String listVendors(@RequestParam(required = false) String category, Model model) {
        List<Vendor> vendors;
        if (category != null && !category.isEmpty()) {
            Class<?> type = switch (category.toUpperCase()) {
                case "VENUE"       -> VenueVendor.class;
                case "PHOTOGRAPHY" -> PhotographyVendor.class;
                default            -> CateringVendor.class;
            };
            vendors = vendorRepository.findByVendorType(type);
        } else {
            vendors = vendorRepository.findAll();
        }
        model.addAttribute("vendors", vendors);
        model.addAttribute("selectedCategory", category);
        return "component02/vendors";
    }

    // CREATE: Show form
    @GetMapping("/new")
    public String showCreateForm() { return "component02/vendorForm"; }

    // CREATE: Process — POLYMORPHISM: creates correct subtype
    @PostMapping("/new")
    public String createVendor(@RequestParam String businessName, @RequestParam String location,
                               @RequestParam String description, @RequestParam String priceRange,
                               @RequestParam String category) {
        String id = "VND-" + UUID.randomUUID().toString().substring(0, 5).toUpperCase();
        Vendor vendor = switch (category.toUpperCase()) {
            case "VENUE"       -> new VenueVendor(id, businessName, location, description, priceRange);
            case "PHOTOGRAPHY" -> new PhotographyVendor(id, businessName, location, description, priceRange);
            default            -> new CateringVendor(id, businessName, location, description, priceRange);
        };
        vendorRepository.save(vendor);
        return "redirect:/vendors";
    }

    // READ: Detail view
    @GetMapping("/{id}")
    public String vendorDetail(@PathVariable String id, Model model) {
        vendorRepository.findById(id).ifPresent(v -> model.addAttribute("vendor", v));
        return "component02/vendorDetail";
    }

    // UPDATE: Show edit form
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable String id, Model model) {
        vendorRepository.findById(id).ifPresent(v -> model.addAttribute("vendor", v));
        return "component02/editVendor";
    }

    // UPDATE: Process — update mutable fields only (category/type is immutable after creation)
    @PostMapping("/edit")
    public String updateVendor(@RequestParam String vendorId,   @RequestParam String businessName,
                               @RequestParam String location,   @RequestParam String description,
                               @RequestParam String priceRange, @RequestParam double rating) {
        vendorRepository.findById(vendorId).ifPresent(v -> {
            v.setBusinessName(businessName);
            v.setLocation(location);
            v.setDescription(description);
            v.setPriceRange(priceRange);
            v.setRating(rating);
            vendorRepository.save(v);
        });
        return "redirect:/vendors";
    }

    // DELETE
    @GetMapping("/delete/{id}")
    public String deleteVendor(@PathVariable String id) {
        vendorRepository.deleteById(id);
        return "redirect:/vendors";
    }
}
