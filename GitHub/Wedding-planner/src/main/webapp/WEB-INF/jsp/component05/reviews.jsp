<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.ttt.component05.model.Review" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reviews — Tie The Tech</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        *{font-family:'Inter',sans-serif;} body{background:#f5f4f0;}
        .ttt-navbar{background:linear-gradient(135deg,#1a1a2e,#16213e);padding:14px 0;}
        .ttt-navbar .navbar-brand{color:#f0c040!important;font-weight:800;}
        .ttt-navbar .nav-link{color:rgba(255,255,255,.7)!important;} .ttt-navbar .nav-link:hover{color:#f0c040!important;}
        .page-header{background:linear-gradient(135deg,#f7971e,#ffd200);padding:40px 0 30px;margin-bottom:32px;}
        .page-header h2{font-weight:800;color:#1a1a2e;} .page-header p{color:rgba(26,26,46,.6);font-size:.9rem;margin:0;}
        .review-card{background:white;border-radius:16px;box-shadow:0 4px 20px rgba(0,0,0,.07);padding:24px;transition:transform .2s;}
        .review-card:hover{transform:translateY(-3px);}
        .stars{color:#f0c040;font-size:1.1rem;letter-spacing:2px;}
        .badge-verified{background:#d1f5e0;color:#155724;border-radius:20px;padding:3px 10px;font-size:.75rem;font-weight:700;}
        .badge-public{background:#e8f4ff;color:#1565c0;border-radius:20px;padding:3px 10px;font-size:.75rem;font-weight:700;}
        .avatar{width:42px;height:42px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-weight:800;font-size:1rem;flex-shrink:0;}
        .btn-gold{background:linear-gradient(135deg,#f7971e,#ffd200);color:#1a1a2e;border:none;border-radius:20px;padding:8px 20px;font-weight:700;}
        .btn-del{background:#f8d7da;color:#721c24;border:none;border-radius:8px;padding:4px 9px;font-size:.8rem;}
        .btn-del:hover{background:#dc3545;color:white;}
        .btn-edit{background:#fff3cd;color:#856404;border:none;border-radius:8px;padding:4px 9px;font-size:.8rem;}
        .btn-edit:hover{background:#ffc107;color:#1a1a2e;}
        .stat-box{background:linear-gradient(135deg,#1a1a2e,#16213e);border-radius:14px;padding:18px 22px;color:white;}
        .stat-box h3{color:#f0c040;font-weight:800;font-size:2rem;margin:0;} .stat-box p{color:rgba(255,255,255,.6);font-size:.82rem;margin:0;}
        .sort-btn{border-radius:20px;padding:6px 16px;font-size:.85rem;font-weight:600;}
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg ttt-navbar">
    <div class="container">
        <a class="navbar-brand" href="/">💍 Tie The Tech</a>
        <div class="navbar-nav ms-auto align-items-center gap-2">
            <a class="nav-link" href="/">Home</a>
            <a class="nav-link" href="/vendors">Vendors</a>
            <a class="nav-link active" href="/reviews">Reviews</a>
            <% if(session.getAttribute("userId")!=null){%><a class="nav-link" href="/profile"><%= session.getAttribute("userName") %></a><%}%>
            <a href="/reviews/new" class="btn-gold ms-2"><i class="bi bi-star me-1"></i> Write Review</a>
        </div>
    </div>
</nav>
<div class="page-header">
    <div class="container">
        <h2><i class="bi bi-star-fill me-2"></i>Reviews & Ratings</h2>
        <p>Component 5 — Inheritance: VerifiedReview · PublicReview | Abstraction: canEdit()</p>
    </div>
</div>
<div class="container pb-5">
    <%
    List<Review> reviews = (List<Review>) request.getAttribute("reviews");
    double avg = request.getAttribute("avgRating") != null ? (Double) request.getAttribute("avgRating") : 0;
    int total = reviews != null ? reviews.size() : 0;
    %>
    <!-- Stats -->
    <div class="row g-3 mb-4">
        <div class="col-md-4"><div class="stat-box"><p>Total Reviews</p><h3><%= total %></h3></div></div>
        <div class="col-md-4"><div class="stat-box"><p>Average Rating</p><h3><%= avg %> ★</h3></div></div>
        <div class="col-md-4">
            <div class="d-flex gap-2 h-100 align-items-center">
                <a href="/reviews" class="btn sort-btn <%= request.getParameter("sort")==null?"btn-dark":"btn-outline-secondary" %>">Recent</a>
                <a href="/reviews?sort=rating" class="btn sort-btn <%= "rating".equals(request.getParameter("sort"))?"btn-warning":"btn-outline-warning" %>">★ Top Rated</a>
            </div>
        </div>
    </div>
    <!-- Review Cards -->
    <% if(reviews==null||reviews.isEmpty()){ %>
    <div class="review-card text-center py-5">
        <i class="bi bi-star" style="font-size:3.5rem;color:#ddd"></i>
        <h5 class="text-muted mt-3">No reviews yet</h5>
        <a href="/reviews/new" class="btn btn-warning rounded-pill mt-2 px-4">Be the first to review</a>
    </div>
    <% } else { %>
    <div class="row g-4">
    <% for(Review r : reviews) {
        String[] colors = {"#4776E6","#f953c6","#11998e","#f7971e","#8E54E9"};
        String color = colors[Math.abs(r.getUserName().hashCode()) % colors.length];
        char initial = r.getUserName().isEmpty() ? '?' : r.getUserName().charAt(0);
    %>
        <div class="col-md-6 col-lg-4">
            <div class="review-card h-100">
                <div class="d-flex align-items-center gap-3 mb-3">
                    <div class="avatar" style="background:<%= color %>;color:white"><%= initial %></div>
                    <div>
                        <div class="fw-700"><%= r.getUserName() %></div>
                        <div class="stars">
                            <% for(int i=1;i<=5;i++){%><%= i<=r.getRating()?"★":"☆" %><% } %>
                        </div>
                    </div>
                    <div class="ms-auto">
                        <span class="<%= "VERIFIED".equals(r.getReviewType())?"badge-verified":"badge-public" %>">
                            <%= "VERIFIED".equals(r.getReviewType())?"✓ Verified":"Public" %>
                        </span>
                    </div>
                </div>
                <p style="color:#555;font-size:.9rem;line-height:1.7"><%= r.getComment() %></p>
                <div class="d-flex justify-content-between align-items-center mt-3">
                    <small class="text-muted"><i class="bi bi-calendar3 me-1"></i><%= r.getReviewDate() %></small>
                    <div class="d-flex gap-2">
                        <% if(r.canEdit()){ %><a href="/reviews/edit/<%= r.getReviewId() %>" class="btn-edit"><i class="bi bi-pencil"></i></a><% } %>
                        <a href="/reviews/delete/<%= r.getReviewId() %>" class="btn-del" onclick="return confirm('Delete this review?')"><i class="bi bi-trash"></i></a>
                    </div>
                </div>
            </div>
        </div>
    <% } %>
    </div>
    <% } %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
