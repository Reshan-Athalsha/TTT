package com.ttt.component03.controller;

import com.ttt.component03.model.Booking;
import com.ttt.component03.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

/** COMPONENT 03 — Booking & Payment | BookingController */
@Controller
@RequestMapping("/bookings")
public class BookingController {

    @Autowired private BookingRepository bookingRepository;

    @GetMapping
    public String viewBookings(Model model) {
        List<Booking> bookings = bookingRepository.findAll();
        model.addAttribute("bookings", bookings);
        return "component03/bookings";
    }

    @GetMapping("/new")
    public String showCreateForm() { return "component03/bookingForm"; }

    @PostMapping("/new")
    public String createBooking(@RequestParam String clientName, @RequestParam String vendorName,
                                @RequestParam String eventDate) {
        String id  = "BKG-" + UUID.randomUUID().toString().substring(0,5).toUpperCase();
        String now = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        bookingRepository.save(new Booking(id, clientName, vendorName, eventDate, "PENDING", now));
        return "redirect:/bookings";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable String id, Model model) {
        bookingRepository.findById(id).ifPresent(b -> model.addAttribute("booking", b));
        return "component03/editBooking";
    }

    @PostMapping("/edit")
    public String updateBooking(@RequestParam String bookingId, @RequestParam String clientName,
                                @RequestParam String vendorName, @RequestParam String eventDate,
                                @RequestParam String status,    @RequestParam String createdDate) {
        bookingRepository.save(new Booking(bookingId, clientName, vendorName, eventDate, status, createdDate));
        return "redirect:/bookings";
    }

    @GetMapping("/cancel/{id}")
    public String cancelBooking(@PathVariable String id) {
        bookingRepository.findById(id).ifPresent(b -> { b.setStatus("CANCELLED"); bookingRepository.save(b); });
        return "redirect:/bookings";
    }

    @GetMapping("/delete/{id}")
    public String deleteBooking(@PathVariable String id) {
        bookingRepository.deleteById(id); return "redirect:/bookings";
    }
}
