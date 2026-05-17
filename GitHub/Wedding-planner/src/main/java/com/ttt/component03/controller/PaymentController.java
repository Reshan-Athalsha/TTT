package com.ttt.component03.controller;

import com.ttt.component03.model.Booking;
import com.ttt.component03.model.Payment;
import com.ttt.component03.repository.BookingRepository;
import com.ttt.component03.repository.PaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

/** COMPONENT 03 — Booking & Payment | PaymentController (all same package now) */
@Controller
@RequestMapping("/payments")
public class PaymentController {

    @Autowired private PaymentRepository paymentRepository;
    @Autowired private BookingRepository bookingRepository;

    @GetMapping("/checkout/{bookingId}")
    public String showCheckout(@PathVariable String bookingId, Model model) {
        model.addAttribute("bookingId", bookingId);
        return "component03/checkout";
    }

    @PostMapping("/process")
    public String processPayment(@RequestParam String bookingId, @RequestParam double amount,
                                 @RequestParam String paymentMethod, Model model) {
        try {
            if (amount <= 0) {
                model.addAttribute("error", "Amount must be greater than zero!");
                model.addAttribute("bookingId", bookingId);
                return "component03/checkout";
            }
            String id  = "PAY-" + UUID.randomUUID().toString().substring(0,5).toUpperCase();
            String now = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            paymentRepository.save(new Payment(id, bookingId, amount, paymentMethod, "COMPLETED", now));
            bookingRepository.findById(bookingId).ifPresent(b -> { b.setStatus("CONFIRMED"); bookingRepository.save(b); });
        } catch (Exception e) {
            model.addAttribute("error", "Error: " + e.getMessage());
            model.addAttribute("bookingId", bookingId);
            return "component03/checkout";
        }
        return "redirect:/payments";
    }

    @GetMapping
    public String viewPayments(Model model) {
        List<Payment> payments = paymentRepository.findAll();
        model.addAttribute("payments", payments);
        return "component03/payments";
    }

    @GetMapping("/delete/{id}")
    public String deletePayment(@PathVariable String id) {
        paymentRepository.deleteById(id); return "redirect:/payments";
    }
}
