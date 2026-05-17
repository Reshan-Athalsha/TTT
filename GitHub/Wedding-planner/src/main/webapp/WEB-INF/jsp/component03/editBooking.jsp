<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ttt.component03.model.Booking" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Booking — Tie The Tech</title>
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
        .page-header { background: linear-gradient(135deg, #f0c040, #d4a017); padding: 40px 0 30px; margin-bottom: 32px; }
        .page-header h2 { font-weight: 800; color: #1a1a2e; }
        .page-header p { color: rgba(26,26,46,0.65); font-size: 0.9rem; margin: 0; }
        .card { border: none; border-radius: 16px; box-shadow: 0 4px 20px rgba(0,0,0,0.07); }
        .form-label { font-weight: 600; color: #444; font-size: 0.9rem; }
        .form-control, .form-select { border-radius: 10px; border: 1.5px solid #e0e0e0; padding: 11px 14px 11px 38px; }
        .form-control:focus, .form-select:focus { border-color: #f0c040; box-shadow: 0 0 0 3px rgba(240,192,64,0.15); }
        .form-select { padding-left: 38px; }
        .icon-wrap { position: relative; }
        .icon-wrap i { position: absolute; left: 12px; top: 50%; transform: translateY(-50%); color: #aaa; z-index: 1; }
        .booking-id-badge { background: #fff3cd; color: #856404; border-radius: 8px; padding: 8px 14px; font-size: 0.85rem; font-weight: 600; display: inline-block; margin-bottom: 24px; }
        .btn-update { background: linear-gradient(135deg, #f0c040, #d4a017); color: #1a1a2e; border: none; border-radius: 10px; padding: 13px; font-weight: 700; width: 100%; }
        .btn-update:hover { opacity: 0.9; color: #1a1a2e; }
        .btn-back { background: transparent; color: #888; border: 1.5px solid #ddd; border-radius: 10px; padding: 13px; font-weight: 600; width: 100%; }
        .btn-back:hover { background: #f0f0f0; color: #555; }
    </style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg ttt-navbar">
    <div class="container">
        <a class="navbar-brand" href="/">💍 Tie The Tech</a>
        <div class="navbar-nav ms-auto align-items-center gap-2">
            <a class="nav-link" href="/"><i class="bi bi-house me-1"></i>Home</a>
            <a class="nav-link active" href="/bookings"><i class="bi bi-calendar-check me-1"></i>Bookings</a>
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
        <h2><i class="bi bi-pencil-square me-2"></i>Edit Booking</h2>
        <p>Component 2 — Booking Management | UPDATE operation</p>
    </div>
</div>

<div class="container pb-5">
    <div class="row justify-content-center">
        <div class="col-md-7 col-lg-6">
            <%
            Booking booking = (Booking) request.getAttribute("booking");
            if (booking != null) {
            %>
            <div class="card p-4">
                <div class="booking-id-badge"><i class="bi bi-hash me-1"></i>Booking: <%= booking.getBookingId() %></div>
                <form action="/bookings/edit" method="POST">
                    <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">
                    <input type="hidden" name="createdDate" value="<%= booking.getCreatedDate() %>">

                    <div class="mb-3">
                        <label class="form-label">Client Name</label>
                        <div class="icon-wrap">
                            <i class="bi bi-person"></i>
                            <input type="text" class="form-control" name="clientName" value="<%= booking.getClientName() %>" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Vendor / Service</label>
                        <div class="icon-wrap">
                            <i class="bi bi-shop"></i>
                            <input type="text" class="form-control" name="vendorName" value="<%= booking.getVendorName() %>" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Event Date</label>
                        <div class="icon-wrap">
                            <i class="bi bi-calendar3"></i>
                            <input type="date" class="form-control" name="eventDate" value="<%= booking.getEventDate() %>" required>
                        </div>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Booking Status</label>
                        <div class="icon-wrap">
                            <i class="bi bi-info-circle"></i>
                            <select class="form-select" name="status">
                                <option value="PENDING"   <%= "PENDING".equals(booking.getStatus())   ? "selected" : "" %>>⏳ Pending</option>
                                <option value="CONFIRMED" <%= "CONFIRMED".equals(booking.getStatus()) ? "selected" : "" %>>✅ Confirmed</option>
                                <option value="CANCELLED" <%= "CANCELLED".equals(booking.getStatus()) ? "selected" : "" %>>❌ Cancelled</option>
                                <option value="COMPLETED" <%= "COMPLETED".equals(booking.getStatus()) ? "selected" : "" %>>🏁 Completed</option>
                            </select>
                        </div>
                    </div>
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn-update"><i class="bi bi-floppy me-2"></i>Update Booking</button>
                        <a href="/bookings" class="btn-back text-center text-decoration-none"><i class="bi bi-arrow-left me-2"></i>Back to Bookings</a>
                    </div>
                </form>
            </div>
            <% } else { %>
            <div class="card p-5 text-center">
                <i class="bi bi-exclamation-triangle text-warning" style="font-size:3rem"></i>
                <h5 class="mt-3">Booking Not Found</h5>
                <a href="/bookings" class="btn btn-outline-dark rounded-pill mt-3">Back to Bookings</a>
            </div>
            <% } %>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>