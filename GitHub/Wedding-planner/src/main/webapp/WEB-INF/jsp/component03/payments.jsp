<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.ttt.component03.model.Payment" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payments — Tie The Tech</title>
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
        .table thead { background: linear-gradient(135deg, #11998e, #0d8073); color: white; }
        .table thead th { font-weight: 600; font-size: 0.85rem; border: none; padding: 14px 16px; }
        .table tbody td { padding: 14px 16px; vertical-align: middle; border-color: #f5f5f5; font-size: 0.9rem; }
        .table tbody tr:hover { background: #e8f8f5; }
        .badge-completed { background: #d1f5e0; color: #155724; font-weight: 600; border-radius: 20px; padding: 4px 12px; font-size: 0.78rem; }
        .btn-del { background: #f8d7da; color: #721c24; border: none; border-radius: 8px; padding: 5px 10px; font-size: 0.82rem; font-weight: 600; }
        .btn-del:hover { background: #dc3545; color: white; }
        .empty-state { text-align: center; padding: 60px 20px; }
        .empty-state i { font-size: 4rem; color: #ddd; }
        .total-label { color: #888; font-size: 0.85rem; }
        .summary-box { background: linear-gradient(135deg, #1a1a2e, #16213e); border-radius: 14px; padding: 20px 24px; color: white; margin-bottom: 20px; }
        .summary-box h3 { color: #f0c040; font-weight: 800; font-size: 2rem; margin: 0; }
        .summary-box p { color: rgba(255,255,255,0.6); font-size: 0.85rem; margin: 0; }
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
        <h2><i class="bi bi-credit-card me-2"></i>Payment History</h2>
        <p>Component 3 — Payment Management | READ &amp; DELETE operations</p>
    </div>
</div>

<div class="container pb-5">
    <%
    List<Payment> payments = (List<Payment>) request.getAttribute("payments");
    if (payments != null && !payments.isEmpty()) {
        double total = 0;
        for (Payment p : payments) total += p.getAmount();
    %>

    <!-- Summary Box -->
    <div class="row g-3 mb-4">
        <div class="col-md-4">
            <div class="summary-box">
                <p>Total Payments</p>
                <h3><%= payments.size() %></h3>
            </div>
        </div>
        <div class="col-md-4">
            <div class="summary-box">
                <p>Total Revenue (LKR)</p>
                <h3><%
                    double total2 = 0;
                    for (Payment p : payments) total2 += p.getAmount();
                    out.print(String.format("%.2f", total2));
                %></h3>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table mb-0">
                    <thead>
                        <tr>
                            <th>Payment ID</th>
                            <th>Booking ID</th>
                            <th>Amount (LKR)</th>
                            <th>Method</th>
                            <th>Status</th>
                            <th>Date</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% for (Payment p : payments) { %>
                        <tr>
                            <td><span class="fw-600" style="font-size:0.82rem;color:#888"><%= p.getPaymentId() %></span></td>
                            <td><small><%= p.getBookingId() %></small></td>
                            <td><strong>LKR <%= String.format("%.2f", p.getAmount()) %></strong></td>
                            <td><i class="bi bi-credit-card me-1 text-muted"></i><%= p.getPaymentMethod().replace("_", " ") %></td>
                            <td><span class="badge-completed"><%= p.getStatus() %></span></td>
                            <td><small class="text-muted"><%= p.getPaymentDate() %></small></td>
                            <td class="text-center">
                                <a href="/payments/delete/<%= p.getPaymentId() %>"
                                   class="btn btn-del"
                                   onclick="return confirm('Delete this payment record?')">
                                    <i class="bi bi-trash"></i>
                                </a>
                            </td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
            <div class="px-4 py-3 border-top">
                <span class="total-label"><i class="bi bi-list me-1"></i>Total Payments: <strong><%= payments.size() %></strong></span>
            </div>
        </div>
    </div>

    <% } else { %>
    <div class="card">
        <div class="empty-state">
            <i class="bi bi-credit-card"></i>
            <h5 class="text-muted mt-3">No payment records found</h5>
            <p class="text-muted" style="font-size:0.9rem">Process a payment from the Bookings page</p>
            <a href="/bookings" class="btn btn-dark rounded-pill mt-2 px-4"><i class="bi bi-calendar-check me-2"></i>Go to Bookings</a>
        </div>
    </div>
    <% } %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
