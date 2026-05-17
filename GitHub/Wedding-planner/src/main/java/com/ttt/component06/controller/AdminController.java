package com.ttt.component06.controller;

import com.ttt.component01.repository.CoupleUserRepository;
import com.ttt.component02.repository.VendorRepository;
import com.ttt.component03.repository.BookingRepository;
import com.ttt.component03.repository.PaymentRepository;
import com.ttt.component04.repository.GuestRepository;
import com.ttt.component05.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * COMPONENT 06 — Admin Dashboard & Analytics
 * Reads from ALL component repositories (cross-component).
 * OOP: Demonstrates Information Hiding — controllers expose only what's needed.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired private CoupleUserRepository userRepository;
    @Autowired private VendorRepository     vendorRepository;
    @Autowired private BookingRepository    bookingRepository;
    @Autowired private PaymentRepository    paymentRepository;
    @Autowired private GuestRepository      guestRepository;
    @Autowired private ReviewRepository     reviewRepository;

    // READ: Dashboard with all stats
    @GetMapping
    public String adminDashboard(Model model) {
        // Counts
        model.addAttribute("userCount",    userRepository.count());
        model.addAttribute("vendorCount",  vendorRepository.count());
        model.addAttribute("bookingCount", bookingRepository.count());
        model.addAttribute("paymentCount", paymentRepository.count());
        model.addAttribute("guestCount",   guestRepository.count());
        model.addAttribute("reviewCount",  reviewRepository.count());

        // Lists for management
        model.addAttribute("users",    userRepository.findAll());
        model.addAttribute("vendors",  vendorRepository.findAll());
        model.addAttribute("bookings", bookingRepository.findAll());
        model.addAttribute("reviews",  reviewRepository.findAll());

        // Revenue
        double revenue = paymentRepository.findAll().stream().mapToDouble(p -> p.getAmount()).sum();
        model.addAttribute("totalRevenue", revenue);

        // Confirmed bookings
        long confirmed = bookingRepository.findAll().stream().filter(b -> "CONFIRMED".equals(b.getStatus())).count();
        model.addAttribute("confirmedBookings", confirmed);

        return "component06/adminDashboard";
    }

    // DELETE: Remove user
    @GetMapping("/users/delete/{id}")
    public String deleteUser(@PathVariable String id) {
        userRepository.deleteById(id); return "redirect:/admin";
    }

    // DELETE: Remove vendor
    @GetMapping("/vendors/delete/{id}")
    public String deleteVendor(@PathVariable String id) {
        vendorRepository.deleteById(id); return "redirect:/admin";
    }

    // DELETE: Remove review
    @GetMapping("/reviews/delete/{id}")
    public String deleteReview(@PathVariable String id) {
        reviewRepository.deleteById(id); return "redirect:/admin";
    }

    // UPDATE: Verify vendor (set rating to 5 as verified)
    @GetMapping("/vendors/verify/{id}")
    public String verifyVendor(@PathVariable String id) {
        vendorRepository.findById(id).ifPresent(v -> { v.setRating(5.0); vendorRepository.save(v); });
        return "redirect:/admin";
    }
}
