<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Booking — Tie The Tech</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        * { font-family: 'Inter', sans-serif; }
        body { background: #f5f4f0; }
        .ttt-navbar { background: linear-gradient(135deg, #1a1a2e, #16213e); padding: 14px 0; box-shadow: 0 2px 20px rgba(0,0,0,0.25); }
        .ttt-navbar .navbar-brand { color: #f0c040 !important; font-weight: 800; }
        .ttt-navbar .nav-link { color: rgba(255,255,255,0.7) !important; font-weight: 500; }
        .ttt-navbar .nav-link:hover { color: #f0c040 !important; }
        .page-header { background: linear-gradient(135deg, #1a1a2e, #16213e); padding: 40px 0 30px; margin-bottom: 32px; }
        .page-header h2 { font-weight: 800; color: #f0c040; }
        .page-header p { color: rgba(255,255,255,0.6); font-size: 0.9rem; margin: 0; }
        .card { border: none; border-radius: 16px; box-shadow: 0 4px 20px rgba(0,0,0,0.07); }
        .form-label { font-weight: 600; color: #444; font-size: 0.9rem; }
        .form-control, .form-select { border-radius: 10px; border: 1.5px solid #e0e0e0; padding: 11px 14px 11px 38px; font-size: 0.95rem; }
        .form-control:focus, .form-select:focus { border-color: #f0c040; box-shadow: 0 0 0 3px rgba(240,192,64,0.15); }
        .icon-wrap { position: relative; }
        .icon-wrap i { position: absolute; left: 12px; top: 50%; transform: translateY(-50%); color: #aaa; z-index: 1; }
        .btn-gold { background: linear-gradient(135deg, #f0c040, #d4a017); color: #1a1a2e; border: none; border-radius: 10px; padding: 13px; font-weight: 700; width: 100%; }
        .btn-gold:hover { opacity: 0.9; color: #1a1a2e; }
        .btn-back { background: transparent; color: #888; border: 1.5px solid #ddd; border-radius: 10px; padding: 13px; font-weight: 600; width: 100%; }
        .btn-back:hover { background: #f0f0f0; color: #555; }
        .hint { color: #aaa; font-size: 0.8rem; margin-top: 4px; }
    </style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg ttt-navbar">
    <div class="container">
        <a class="navbar-brand" href="/">💍 Tie The Tech</a>
        <div class="navbar-nav ms-auto align-items-center gap-2">
            <a class="nav-link" href="/"><i class="bi bi-house me-1"></i>Home</a>
            <a class="nav-link" href="/bookings"><i class="bi bi-calendar-check me-1"></i>Bookings</a>
            <a class="nav-link" href="/payments"><i class="bi bi-credit-card me-1"></i>Payments</a>
            <% if (session.getAttribute("userId") != null) { %>
                <a class="nav-link" href="/profile"><i class="bi bi-person-circle me-1"></i><%= session.getAttribute("userName") %></a>
            <% } else { %>
                <a href="/login" class="nav-link">Login</a>
            <% } %>
        </div>
    </div>
</nav>

<!-- PAGE HEADER -->
<div class="page-header">
    <div class="container">
        <h2><i class="bi bi-calendar-plus me-2"></i>New Booking Request</h2>
        <p>Component 2 — Booking Management | CREATE operation</p>
    </div>
</div>

<div class="container pb-5">
    <div class="row justify-content-center">
        <div class="col-md-7 col-lg-6">
            <div class="card p-4">
                <form action="/bookings/new" method="POST">
                    <div class="mb-3">
                        <label class="form-label"><i class="bi bi-person me-1 text-muted"></i>Client Name</label>
                        <div class="icon-wrap">
                            <i class="bi bi-person"></i>
                            <input type="text" class="form-control" name="clientName" placeholder="Enter client's full name" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label"><i class="bi bi-shop me-1 text-muted"></i>Vendor / Service</label>
                        <div class="icon-wrap">
                            <i class="bi bi-shop"></i>
                            <input type="text" class="form-control" name="vendorName" placeholder="e.g. Royal Catering, Dream Florists" required>
                        </div>
                        <div class="hint">Enter the vendor or service provider name</div>
                    </div>
                    <div class="mb-4">
                        <label class="form-label"><i class="bi bi-calendar3 me-1 text-muted"></i>Event Date</label>
                        <div class="icon-wrap">
                            <i class="bi bi-calendar3"></i>
                            <input type="date" class="form-control" name="eventDate" required>
                        </div>
                    </div>
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn-gold"><i class="bi bi-send me-2"></i>Submit Booking Request</button>
                        <a href="/bookings" class="btn-back text-center text-decoration-none"><i class="bi bi-arrow-left me-2"></i>Back to Bookings</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>