<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.ttt.component03.model.Booking" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bookings — Tie The Tech</title>
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
        .ttt-navbar .btn-new { background: #f0c040; color: #1a1a2e; border: none; border-radius: 20px; padding: 6px 18px; font-weight: 700; font-size: 0.88rem; }
        .ttt-navbar .btn-new:hover { background: #d4a017; color: #1a1a2e; }
        .page-header { background: linear-gradient(135deg, #1a1a2e, #16213e); padding: 40px 0 30px; margin-bottom: 32px; }
        .page-header h2 { font-weight: 800; color: #f0c040; }
        .page-header p { color: rgba(255,255,255,0.6); font-size: 0.9rem; margin: 0; }
        .card { border: none; border-radius: 16px; box-shadow: 0 4px 20px rgba(0,0,0,0.07); }
        .table thead { background: linear-gradient(135deg, #1a1a2e, #16213e); color: #f0c040; }
        .table thead th { font-weight: 600; font-size: 0.85rem; border: none; padding: 14px 16px; }
        .table tbody td { padding: 14px 16px; vertical-align: middle; border-color: #f5f5f5; font-size: 0.9rem; }
        .table tbody tr:hover { background: #fffbf0; }
        .badge-pending { background: #fff3cd; color: #856404; font-weight: 600; border-radius: 20px; padding: 4px 12px; font-size: 0.78rem; }
        .badge-confirmed { background: #d1f5e0; color: #155724; font-weight: 600; border-radius: 20px; padding: 4px 12px; font-size: 0.78rem; }
        .badge-cancelled { background: #f8d7da; color: #721c24; font-weight: 600; border-radius: 20px; padding: 4px 12px; font-size: 0.78rem; }
        .badge-completed { background: #cce5ff; color: #004085; font-weight: 600; border-radius: 20px; padding: 4px 12px; font-size: 0.78rem; }
        .btn-action { border-radius: 8px; padding: 5px 10px; font-size: 0.82rem; font-weight: 600; border: none; }
        .btn-pay { background: #d1f5e0; color: #155724; }
        .btn-pay:hover { background: #28a745; color: white; }
        .btn-edit { background: #fff3cd; color: #856404; }
        .btn-edit:hover { background: #ffc107; color: #1a1a2e; }
        .btn-cancel { background: #f0f0f0; color: #555; }
        .btn-cancel:hover { background: #6c757d; color: white; }
        .btn-del { background: #f8d7da; color: #721c24; }
        .btn-del:hover { background: #dc3545; color: white; }
        .empty-state { text-align: center; padding: 60px 20px; }
        .empty-state i { font-size: 4rem; color: #ddd; }
        .btn-gold { background: linear-gradient(135deg, #f0c040, #d4a017); color: #1a1a2e; border: none; border-radius: 10px; padding: 10px 24px; font-weight: 700; }
        .btn-gold:hover { opacity: 0.9; color: #1a1a2e; }
        .total-label { color: #888; font-size: 0.85rem; }
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
                <a href="/logout" class="nav-link" style="color:#f0c040!important">Logout</a>
            <% } else { %>
                <a href="/login" class="nav-link">Login</a>
            <% } %>
            <a href="/bookings/new" class="btn-new ms-2"><i class="bi bi-plus me-1"></i>New Booking</a>
        </div>
    </div>
</nav>

<!-- PAGE HEADER -->
<div class="page-header">
    <div class="container">
        <h2><i class="bi bi-calendar-check me-2"></i>Booking Management</h2>
        <p>Component 2 — Full CRUD: Create · Read · Update · Cancel · Delete</p>
    </div>
</div>

<div class="container pb-5">
    <div class="card">
        <div class="card-body p-0">
            <%
            List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
            if (bookings == null || bookings.isEmpty()) {
            %>
            <div class="empty-state">
                <i class="bi bi-calendar-x"></i>
                <h5 class="text-muted mt-3">No bookings found</h5>
                <p class="text-muted" style="font-size:0.9rem">Create your first booking to get started</p>
                <a href="/bookings/new" class="btn-gold mt-2 d-inline-block"><i class="bi bi-plus-circle me-2"></i>Create First Booking</a>
            </div>
            <% } else { %>
            <div class="table-responsive">
                <table class="table mb-0">
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Client Name</th>
                            <th>Vendor Name</th>
                            <th>Event Date</th>
                            <th>Status</th>
                            <th>Created Date</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% for (Booking b : bookings) { %>
                        <tr>
                            <td><span class="fw-600" style="font-size:0.82rem;color:#888"><%= b.getBookingId() %></span></td>
                            <td><strong><%= b.getClientName() %></strong></td>
                            <td><%= b.getVendorName() %></td>
                            <td><i class="bi bi-calendar3 me-1 text-muted"></i><%= b.getEventDate() %></td>
                            <td>
                                <% String st = b.getStatus(); %>
                                <span class="<%= "PENDING".equals(st)?"badge-pending":"CONFIRMED".equals(st)?"badge-confirmed":"CANCELLED".equals(st)?"badge-cancelled":"badge-completed" %>">
                                    <%= st %>
                                </span>
                            </td>
                            <td><small class="text-muted"><%= b.getCreatedDate() %></small></td>
                            <td class="text-center">
                                <div class="d-flex gap-1 justify-content-center">
                                    <% if ("PENDING".equals(b.getStatus())) { %>
                                    <a href="/payments/checkout/<%= b.getBookingId() %>" class="btn btn-action btn-pay" title="Pay"><i class="bi bi-credit-card"></i></a>
                                    <% } %>
                                    <a href="/bookings/edit/<%= b.getBookingId() %>" class="btn btn-action btn-edit" title="Edit"><i class="bi bi-pencil"></i></a>
                                    <% if ("PENDING".equals(b.getStatus())) { %>
                                    <a href="/bookings/cancel/<%= b.getBookingId() %>" class="btn btn-action btn-cancel" title="Cancel" onclick="return confirm('Cancel this booking?')"><i class="bi bi-x-circle"></i></a>
                                    <% } %>
                                    <a href="/bookings/delete/<%= b.getBookingId() %>" class="btn btn-action btn-del" title="Delete" onclick="return confirm('Permanently delete this booking?')"><i class="bi bi-trash"></i></a>
                                </div>
                            </td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
            <div class="px-4 py-3 border-top">
                <span class="total-label"><i class="bi bi-list me-1"></i>Total Bookings: <strong><%= bookings.size() %></strong></span>
            </div>
            <% } %>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>