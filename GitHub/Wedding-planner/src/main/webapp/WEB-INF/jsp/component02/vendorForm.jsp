<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Vendor — TTT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        *{font-family:'Inter',sans-serif;} body{background:#f5f4f0;}
        .ttt-navbar{background:linear-gradient(135deg,#1a1a2e,#16213e);padding:14px 0;}
        .ttt-navbar .navbar-brand{color:#f0c040!important;font-weight:800;}
        .ttt-navbar .nav-link{color:rgba(255,255,255,.7)!important;}
        .ttt-navbar .nav-link:hover{color:#f0c040!important;}
        .page-header{background:linear-gradient(135deg,#4776E6,#8E54E9);padding:40px 0 30px;margin-bottom:32px;}
        .page-header h2{font-weight:800;color:white;} .page-header p{color:rgba(255,255,255,.7);font-size:.9rem;margin:0;}
        .card{border:none;border-radius:16px;box-shadow:0 4px 20px rgba(0,0,0,.07);}
        .form-label{font-weight:600;color:#444;font-size:.9rem;}
        .form-control,.form-select{border-radius:10px;border:1.5px solid #e0e0e0;padding:11px 14px;}
        .form-control:focus,.form-select:focus{border-color:#4776E6;box-shadow:0 0 0 3px rgba(71,118,230,.15);}
        .btn-save{background:linear-gradient(135deg,#4776E6,#8E54E9);color:white;border:none;border-radius:10px;padding:13px;font-weight:700;width:100%;}
        .btn-save:hover{opacity:.9;color:white;}
        .btn-back{background:transparent;color:#888;border:1.5px solid #ddd;border-radius:10px;padding:13px;font-weight:600;width:100%;}
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg ttt-navbar">
    <div class="container">
        <a class="navbar-brand" href="/">💍 Tie The Tech</a>
        <div class="navbar-nav ms-auto gap-2">
            <a class="nav-link" href="/vendors">Vendors</a>
            <a class="nav-link" href="/bookings">Bookings</a>
        </div>
    </div>
</nav>
<div class="page-header">
    <div class="container">
        <h2><i class="bi bi-shop me-2"></i>Register New Vendor</h2>
        <p>Component 2 — Vendor Management | CREATE operation</p>
    </div>
</div>
<div class="container pb-5">
    <div class="row justify-content-center">
        <div class="col-md-7">
            <div class="card p-4">
                <form action="/vendors/new" method="POST">
                    <div class="mb-3">
                        <label class="form-label">Business Name</label>
                        <input type="text" class="form-control" name="businessName" placeholder="e.g. Royal Grand Hotel" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Category</label>
                        <select class="form-select" name="category" required>
                            <option value="" disabled selected>Select vendor type...</option>
                            <option value="VENUE">🏛 Venue</option>
                            <option value="PHOTOGRAPHY">📷 Photography</option>
                            <option value="CATERING">🍽 Catering</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Location</label>
                        <input type="text" class="form-control" name="location" placeholder="e.g. Colombo, Sri Lanka" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Price Range (LKR)</label>
                        <input type="text" class="form-control" name="priceRange" placeholder="e.g. 50000 - 150000" required>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Description</label>
                        <textarea class="form-control" name="description" rows="3" placeholder="Describe your services..." required></textarea>
                    </div>
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn-save"><i class="bi bi-shop me-2"></i>Register Vendor</button>
                        <a href="/vendors" class="btn-back text-center text-decoration-none"><i class="bi bi-arrow-left me-2"></i>Back to Vendors</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
