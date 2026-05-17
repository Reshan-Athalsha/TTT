<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout — Tie The Tech</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        * { font-family: 'Inter', sans-serif; }
        body { background: #f5f4f0; }
        .ttt-navbar { background: linear-gradient(135deg, #1a1a2e, #16213e); padding: 14px 0; box-shadow: 0 2px 20px rgba(0,0,0,0.25); }
        .ttt-navbar .navbar-brand { color: #f0c040 !important; font-weight: 800; }
        .ttt-navbar .nav-link { color: rgba(255,255,255,0.7) !important; font-weight: 500; }
        .ttt-navbar .nav-link:hover, .ttt-navbar .nav-link.active { color: #f0c040 !important; }
        .page-header { background: linear-gradient(135deg, #11998e, #38ef7d); padding: 40px 0 30px; margin-bottom: 32px; }
        .page-header h2 { font-weight: 800; color: #1a1a2e; }
        .page-header p { color: rgba(26,26,46,0.65); font-size: 0.9rem; margin: 0; }
        .card { border: none; border-radius: 16px; box-shadow: 0 4px 20px rgba(0,0,0,0.07); }
        .booking-ref { background: #e8f8f5; border-radius: 10px; padding: 12px 16px; border-left: 4px solid #11998e; }
        .booking-ref label { font-size: 0.78rem; color: #888; font-weight: 700; text-transform: uppercase; letter-spacing: 0.5px; }
        .booking-ref strong { font-size: 1rem; color: #1a1a2e; }
        .form-label { font-weight: 600; color: #444; font-size: 0.9rem; }
        .form-control, .form-select { border-radius: 10px; border: 1.5px solid #e0e0e0; padding: 11px 14px 11px 38px; }
        .form-control:focus, .form-select:focus { border-color: #11998e; box-shadow: 0 0 0 3px rgba(17,153,142,0.15); }
        .form-select { padding-left: 38px; }
        .icon-wrap { position: relative; }
        .icon-wrap i { position: absolute; left: 12px; top: 50%; transform: translateY(-50%); color: #aaa; z-index: 1; }
        .btn-pay { background: linear-gradient(135deg, #11998e, #38ef7d); color: #1a1a2e; border: none; border-radius: 10px; padding: 13px; font-weight: 700; width: 100%; }
        .btn-pay:hover { opacity: 0.9; color: #1a1a2e; }
        .btn-back { background: transparent; color: #888; border: 1.5px solid #ddd; border-radius: 10px; padding: 13px; font-weight: 600; width: 100%; }
        .btn-back:hover { background: #f0f0f0; }
        .alert { border-radius: 10px; border: none; }
        .method-option { border: 1.5px solid #e0e0e0; border-radius: 10px; padding: 12px 16px; margin-bottom: 8px; cursor: pointer; transition: all 0.2s; }
        .method-option:hover { border-color: #11998e; background: #e8f8f5; }
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
            <a class="nav-link active" href="/payments"><i class="bi bi-credit-card me-1"></i>Payments</a>
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
        <h2><i class="bi bi-shield-lock me-2"></i>Secure Payment Checkout</h2>
        <p>Component 3 — Payment Management | CREATE operation</p>
    </div>
</div>

<div class="container pb-5">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">

            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger mb-3"><i class="bi bi-exclamation-circle me-2"></i><%= request.getAttribute("error") %></div>
            <% } %>

            <div class="card p-4">
                <!-- Booking Reference -->
                <div class="booking-ref mb-4">
                    <label>Booking Reference</label>
                    <div><strong><i class="bi bi-hash me-1"></i><%= request.getAttribute("bookingId") %></strong></div>
                </div>

                <form action="/payments/process" method="POST">
                    <input type="hidden" name="bookingId" value="<%= request.getAttribute("bookingId") %>">

                    <div class="mb-3">
                        <label class="form-label">Amount (LKR)</label>
                        <div class="icon-wrap">
                            <i class="bi bi-currency-exchange"></i>
                            <input type="number" step="0.01" min="1" class="form-control" name="amount" placeholder="e.g. 50000.00" required>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label">Payment Method</label>
                        <div class="icon-wrap">
                            <i class="bi bi-credit-card"></i>
                            <select class="form-select" name="paymentMethod" required>
                                <option value="" disabled selected>Select payment method...</option>
                                <option value="CREDIT_CARD">💳 Credit Card</option>
                                <option value="DEBIT_CARD">🏧 Debit Card</option>
                                <option value="BANK_TRANSFER">🏦 Bank Transfer</option>
                                <option value="CASH">💵 Cash</option>
                            </select>
                        </div>
                    </div>

                    <div class="d-grid gap-2">
                        <button type="submit" class="btn-pay"><i class="bi bi-check-circle me-2"></i>Confirm & Pay</button>
                        <a href="/bookings" class="btn-back text-center text-decoration-none"><i class="bi bi-arrow-left me-2"></i>Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
