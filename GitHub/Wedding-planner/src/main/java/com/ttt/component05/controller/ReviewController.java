package com.ttt.component05.controller;

import com.ttt.component05.model.*;
import com.ttt.component05.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

/** COMPONENT 05 — Reviews & Ratings Controller (Full CRUD) */
@Controller
@RequestMapping("/reviews")
public class ReviewController {

    @Autowired private ReviewRepository reviewRepository;

    // READ: all reviews
    @GetMapping
    public String listReviews(@RequestParam(required=false) String sort, Model model) {
        List<Review> reviews = "rating".equals(sort)
                ? reviewRepository.findByOrderByRatingDesc()
                : reviewRepository.findAll();
        double avgRating = reviews.stream().mapToInt(Review::getRating).average().orElse(0);
        model.addAttribute("reviews", reviews);
        model.addAttribute("avgRating", Math.round(avgRating * 10.0) / 10.0);
        model.addAttribute("sort", sort);
        return "component05/reviews";
    }

    // CREATE: show form
    @GetMapping("/new")
    public String showReviewForm() { return "component05/reviewForm"; }

    // CREATE: submit
    @PostMapping("/new")
    public String submitReview(@RequestParam String vendorId, @RequestParam String userName,
                               @RequestParam int rating, @RequestParam String comment,
                               @RequestParam(defaultValue="PUBLIC") String reviewType,
                               HttpSession session) {
        String id  = "REV-" + UUID.randomUUID().toString().substring(0,5).toUpperCase();
        String date = LocalDate.now().toString();
        String name = session.getAttribute("userName") != null ? (String)session.getAttribute("userName") : userName;
        Review review = "VERIFIED".equals(reviewType)
                ? new VerifiedReview(id, vendorId, name, rating, comment, date)
                : new PublicReview(id, vendorId, name, rating, comment, date);
        reviewRepository.save(review);
        return "redirect:/reviews";
    }

    // UPDATE: show edit form
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable String id, Model model) {
        reviewRepository.findById(id).ifPresent(r -> model.addAttribute("review", r));
        return "component05/editReview";
    }

    // UPDATE: process
    @PostMapping("/edit")
    public String updateReview(@RequestParam String reviewId, @RequestParam int rating,
                               @RequestParam String comment) {
        reviewRepository.findById(reviewId).ifPresent(r -> {
            r.setRating(rating); r.setComment(comment); reviewRepository.save(r);
        });
        return "redirect:/reviews";
    }

    // DELETE
    @GetMapping("/delete/{id}")
    public String deleteReview(@PathVariable String id) {
        reviewRepository.deleteById(id); return "redirect:/reviews";
    }
}
