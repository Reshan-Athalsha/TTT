<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ttt.component02.model.Vendor" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vendor Profile — TTT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        *{font-family:'Inter',sans-serif;} body{background:#f5f4f0;}
        .ttt-navbar{background:linear-gradient(135deg,#1a1a2e,#16213e);padding:14px 0;}
        .ttt-navbar .navbar-brand{color:#f0c040!important;font-weight:800;}
        .ttt-navbar .nav-link{color:rgba(255,255,255,.7)!important;} .ttt-navbar .nav-link:hover{color:#f0c040!important;}
        .vendor-hero { background:linear-gradient(135deg,#4776E6,#8E54E9); padding:50px 0 40px; color:white; margin-bottom:32px; }
        .vendor-hero h2{font-weight:800;font-size:2rem;} .vendor-hero .badge-cat{background:rgba(255,255,255,.2);border-radius:20px;padding:6px 16px;font-size:.85rem;}
        .card{border:none;border-radius:16px;box-shadow:0 4px 20px rgba(0,0,0,.07);}
        .info-row{padding:12px 0;border-bottom:1px solid #f0f0f0;display:flex;} .info-row:last-child{border:none;}
        .info-label{color:#888;font-size:.85rem;width:130px;flex-shrink:0;} .info-value{font-weight:600;color:#1a1a2e;}
        .star-rating{color:#f0c040;font-size:1.2rem;} .oop-tag{background:#e8f4ff;color:#1565c0;border-radius:8px;padding:4px 10px;font-size:.78rem;font-weight:600;margin:2px;}
        .btn-primary-ttt{background:linear-gradient(135deg,#4776E6,#8E54E9);color:white;border:none;border-radius:10px;padding:10px 24px;font-weight:700;}
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg ttt-navbar">
    <div class="container">
        <a class="navbar-brand" href="/">💍 Tie The Tech</a>
        <div class="navbar-nav ms-auto gap-2"><a class="nav-link" href="/vendors">← All Vendors</a></div>
    </div>
</nav>
<%
Vendor v = (Vendor) request.getAttribute("vendor");
if (v != null) { %>
<div class="vendor-hero">
    <div class="container">
        <span class="badge-cat mb-3 d-inline-block"><%= v.getCategory() %></span>
        <h2><%= v.getBusinessName() %></h2>
        <div class="star-rating">
            <% for(int i=1;i<=5;i++){%><%= i<=v.getRating()?"★":"☆" %><% } %>
            <span style="font-size:.9rem;opacity:.7"> <%= v.getRating() %>/5.0</span>
        </div>
        <p class="mt-2 mb-0" style="opacity:.8"><i class="bi bi-geo-alt me-1"></i><%= v.getLocation() %></p>
    </div>
</div>
<div class="container pb-5">
    <div class="row g-4">
        <div class="col-lg-8">
            <div class="card p-4 mb-4">
                <h5 class="fw-800 mb-3" style="border-left:4px solid #4776E6;padding-left:12px">About This Vendor</h5>
                <p style="color:#555;line-height:1.8"><%= v.getDescription() %></p>
            </div>
            <!-- OOP Demo -->
            <div class="card p-4">
                <h5 class="fw-800 mb-3" style="border-left:4px solid #f0c040;padding-left:12px">OOP Demo — calculatePricing()</h5>
                <p class="text-muted" style="font-size:.88rem">Each vendor type overrides <code>calculatePricing()</code> differently (Polymorphism):</p>
                <p><strong>For 8 hours/guests:</strong> LKR <strong><%= String.format("%.2f", v.calculatePricing(8)) %></strong></p>
                <div><span class="oop-tag">Abstraction</span><span class="oop-tag">Polymorphism</span><span class="oop-tag">Inheritance</span></div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card p-4 mb-4">
                <h6 class="fw-800 mb-3">Vendor Details</h6>
                <div class="info-row"><span class="info-label">Vendor ID</span><span class="info-value" style="font-size:.82rem"><%= v.getVendorId() %></span></div>
                <div class="info-row"><span class="info-label">Category</span><span class="info-value"><%= v.getCategory() %></span></div>
                <div class="info-row"><span class="info-label">Location</span><span class="info-value"><%= v.getLocation() %></span></div>
                <div class="info-row"><span class="info-label">Price Range</span><span class="info-value" style="color:#11998e">LKR <%= v.getPriceRange() %></span></div>
                <div class="info-row"><span class="info-label">Rating</span><span class="info-value"><%= v.getRating() %>/5.0</span></div>
            </div>
            <div class="d-grid gap-2">
                <a href="/bookings/new" class="btn-primary-ttt text-center text-decoration-none d-block"><i class="bi bi-calendar-plus me-2"></i>Book This Vendor</a>
                <a href="/vendors/edit/<%= v.getVendorId() %>" class="btn btn-outline-secondary rounded-pill">Edit Profile</a>
            </div>
        </div>
    </div>
</div>
<% } %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
