<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.ttt.component01.model.CoupleUser" %>
<%@ page import="com.ttt.component02.model.Vendor" %>
<%@ page import="com.ttt.component03.model.Booking" %>
<%@ page import="com.ttt.component05.model.Review" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard — TTT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        *{font-family:'Inter',sans-serif;} body{background:#0f0f1a;}
        .ttt-navbar{background:rgba(255,255,255,.04);backdrop-filter:blur(10px);padding:14px 0;border-bottom:1px solid rgba(255,255,255,.08);}
        .ttt-navbar .navbar-brand{color:#f0c040!important;font-weight:800;}
        .ttt-navbar .nav-link{color:rgba(255,255,255,.6)!important;} .ttt-navbar .nav-link:hover,.ttt-navbar .nav-link.active{color:#f0c040!important;}
        .page-header{padding:40px 0 30px;}
        .page-header h2{font-weight:800;color:white;font-size:2rem;}
        .page-header p{color:rgba(255,255,255,.5);font-size:.9rem;margin:0;}
        /* Stat Cards */
        .stat-card{border-radius:18px;padding:24px;position:relative;overflow:hidden;border:1px solid rgba(255,255,255,.08);}
        .stat-card h3{font-size:2.5rem;font-weight:800;margin:0;}
        .stat-card p{color:rgba(255,255,255,.6);font-size:.85rem;margin:4px 0 0;}
        .stat-card .icon{position:absolute;right:20px;top:20px;font-size:2.5rem;opacity:.2;}
        .sc-blue{background:linear-gradient(135deg,#1a237e33,#283593);}
        .sc-purple{background:linear-gradient(135deg,#4a148c33,#6a1b9a);}
        .sc-green{background:linear-gradient(135deg,#1b5e2033,#2e7d32);}
        .sc-gold{background:linear-gradient(135deg,#f0c04022,#1a1a2e);border:1px solid #f0c04033;}
        .sc-pink{background:linear-gradient(135deg,#88003322,#880033);}
        .sc-teal{background:linear-gradient(135deg,#00695c33,#00695c);}
        /* Tables */
        .admin-table{background:rgba(255,255,255,.04);border-radius:16px;border:1px solid rgba(255,255,255,.08);overflow:hidden;}
        .admin-table .table{color:rgba(255,255,255,.85);margin:0;}
        .admin-table .table thead th{background:rgba(240,192,64,.1);color:#f0c040;font-weight:700;font-size:.82rem;border-color:rgba(255,255,255,.08);padding:14px 16px;}
        .admin-table .table tbody td{border-color:rgba(255,255,255,.06);padding:12px 16px;font-size:.88rem;vertical-align:middle;}
        .admin-table .table tbody tr:hover{background:rgba(255,255,255,.04);}
        .section-title{color:white;font-weight:800;font-size:1.1rem;margin-bottom:16px;display:flex;align-items:center;gap:8px;}
        .section-title::after{content:'';flex:1;height:1px;background:rgba(255,255,255,.08);}
        .badge-status{border-radius:20px;padding:3px 10px;font-size:.73rem;font-weight:700;}
        .bs-confirmed{background:#1b5e2044;color:#69f0ae;border:1px solid #2e7d3266;}
        .bs-pending{background:#f0c04022;color:#f0c040;border:1px solid #f0c04044;}
        .bs-cancelled{background:#b71c1c22;color:#ff8a80;border:1px solid #c6282844;}
        .btn-del-dark{background:#b71c1c33;color:#ff8a80;border:1px solid #c6282844;border-radius:8px;padding:4px 9px;font-size:.78rem;}
        .btn-del-dark:hover{background:#c62828;color:white;border-color:#c62828;}
        .btn-verify{background:#1b5e2033;color:#69f0ae;border:1px solid #2e7d3266;border-radius:8px;padding:4px 9px;font-size:.78rem;}
        .btn-verify:hover{background:#2e7d32;color:white;}
        .revenue-hero{background:linear-gradient(135deg,#f0c040,#d4a017);border-radius:16px;padding:28px 32px;color:#1a1a2e;}
        .revenue-hero h2{font-size:2.8rem;font-weight:800;margin:0;}
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg ttt-navbar">
    <div class="container">
        <a class="navbar-brand" href="/">💍 Tie The Tech</a>
        <div class="navbar-nav ms-auto gap-2">
            <a class="nav-link" href="/">Home</a>
            <a class="nav-link active" href="/admin">Admin</a>
            <a class="nav-link" href="/vendors">Vendors</a>
            <a class="nav-link" href="/bookings">Bookings</a>
        </div>
    </div>
</nav>

<%
long userCount    = (Long) request.getAttribute("userCount");
long vendorCount  = (Long) request.getAttribute("vendorCount");
long bookingCount = (Long) request.getAttribute("bookingCount");
long paymentCount = (Long) request.getAttribute("paymentCount");
long guestCount   = (Long) request.getAttribute("guestCount");
long reviewCount  = (Long) request.getAttribute("reviewCount");
double revenue    = (Double) request.getAttribute("totalRevenue");
long confirmed    = (Long) request.getAttribute("confirmedBookings");

List<CoupleUser> users    = (List<CoupleUser>) request.getAttribute("users");
List<Vendor>     vendors  = (List<Vendor>)     request.getAttribute("vendors");
List<Booking>    bookings = (List<Booking>)    request.getAttribute("bookings");
List<Review>     reviews  = (List<Review>)     request.getAttribute("reviews");
%>

<div class="container-fluid px-4">
    <div class="page-header">
        <h2><i class="bi bi-speedometer2 me-2"></i>Admin Dashboard</h2>
        <p>Component 6 — Platform Analytics & Management | Cross-component data aggregation</p>
    </div>

    <!-- Revenue Hero -->
    <div class="revenue-hero mb-4">
        <p style="font-size:.85rem;opacity:.7;margin:0">Total Platform Revenue</p>
        <h2>LKR <%= String.format("%.2f", revenue) %></h2>
        <p style="font-size:.85rem;opacity:.7;margin:4px 0 0"><i class="bi bi-check-circle me-1"></i><%= confirmed %> confirmed bookings</p>
    </div>

    <!-- Stat Cards -->
    <div class="row g-3 mb-4">
        <div class="col-6 col-md-2"><div class="stat-card sc-blue text-white"><div class="icon"><i class="bi bi-people"></i></div><p>Users</p><h3><%= userCount %></h3></div></div>
        <div class="col-6 col-md-2"><div class="stat-card sc-purple text-white"><div class="icon"><i class="bi bi-shop"></i></div><p>Vendors</p><h3><%= vendorCount %></h3></div></div>
        <div class="col-6 col-md-2"><div class="stat-card sc-green text-white"><div class="icon"><i class="bi bi-calendar-check"></i></div><p>Bookings</p><h3><%= bookingCount %></h3></div></div>
        <div class="col-6 col-md-2"><div class="stat-card sc-gold text-white"><div class="icon"><i class="bi bi-credit-card"></i></div><p>Payments</p><h3><%= paymentCount %></h3></div></div>
        <div class="col-6 col-md-2"><div class="stat-card sc-pink text-white"><div class="icon"><i class="bi bi-star"></i></div><p>Reviews</p><h3><%= reviewCount %></h3></div></div>
        <div class="col-6 col-md-2"><div class="stat-card sc-teal text-white"><div class="icon"><i class="bi bi-person-heart"></i></div><p>Guests</p><h3><%= guestCount %></h3></div></div>
    </div>

    <!-- Users Table -->
    <div class="section-title"><i class="bi bi-people"></i> User Management</div>
    <div class="admin-table mb-4">
        <table class="table">
            <thead><tr><th>User ID</th><th>Name</th><th>Email</th><th>Role</th><th>Wedding Date</th><th class="text-center">Delete</th></tr></thead>
            <tbody>
            <% if(users!=null){ for(CoupleUser u:users){ %>
            <tr>
                <td><small style="color:rgba(255,255,255,.4)"><%= u.getUserId() %></small></td>
                <td><strong><%= u.getName() %></strong></td>
                <td><small><%= u.getEmail() %></small></td>
                <td><span class="badge-status bs-confirmed"><%= u.getRole() %></span></td>
                <td><small><%= u.getWeddingDate()!=null?u.getWeddingDate():"—" %></small></td>
                <td class="text-center"><a href="/admin/users/delete/<%= u.getUserId() %>" class="btn-del-dark" onclick="return confirm('Delete user?')"><i class="bi bi-trash"></i></a></td>
            </tr>
            <% } } %>
            </tbody>
        </table>
    </div>

    <!-- Vendors Table -->
    <div class="section-title"><i class="bi bi-shop"></i> Vendor Management</div>
    <div class="admin-table mb-4">
        <table class="table">
            <thead><tr><th>Vendor ID</th><th>Business Name</th><th>Category</th><th>Location</th><th>Rating</th><th class="text-center">Actions</th></tr></thead>
            <tbody>
            <% if(vendors!=null){ for(Vendor v:vendors){ %>
            <tr>
                <td><small style="color:rgba(255,255,255,.4)"><%= v.getVendorId() %></small></td>
                <td><strong><%= v.getBusinessName() %></strong></td>
                <td><%= v.getCategory() %></td>
                <td><small><%= v.getLocation() %></small></td>
                <td style="color:#f0c040"><% for(int i=1;i<=5;i++){%><%= i<=v.getRating()?"★":"☆" %><% } %></td>
                <td class="text-center d-flex gap-1 justify-content-center">
                    <a href="/admin/vendors/verify/<%= v.getVendorId() %>" class="btn-verify"><i class="bi bi-patch-check"></i> Verify</a>
                    <a href="/admin/vendors/delete/<%= v.getVendorId() %>" class="btn-del-dark" onclick="return confirm('Delete vendor?')"><i class="bi bi-trash"></i></a>
                </td>
            </tr>
            <% } } %>
            </tbody>
        </table>
    </div>

    <!-- Bookings Table -->
    <div class="section-title"><i class="bi bi-calendar-check"></i> Recent Bookings</div>
    <div class="admin-table mb-4">
        <table class="table">
            <thead><tr><th>Booking ID</th><th>Client</th><th>Vendor</th><th>Event Date</th><th>Status</th></tr></thead>
            <tbody>
            <% if(bookings!=null){ for(Booking b:bookings){ %>
            <tr>
                <td><small style="color:rgba(255,255,255,.4)"><%= b.getBookingId() %></small></td>
                <td><strong><%= b.getClientName() %></strong></td>
                <td><%= b.getVendorName() %></td>
                <td><small><%= b.getEventDate() %></small></td>
                <td><span class="badge-status <%= "CONFIRMED".equals(b.getStatus())?"bs-confirmed":"CANCELLED".equals(b.getStatus())?"bs-cancelled":"bs-pending" %>"><%= b.getStatus() %></span></td>
            </tr>
            <% } } %>
            </tbody>
        </table>
    </div>

    <!-- Reviews Moderation -->
    <div class="section-title"><i class="bi bi-star"></i> Review Moderation</div>
    <div class="admin-table mb-5">
        <table class="table">
            <thead><tr><th>Review ID</th><th>User</th><th>Rating</th><th>Type</th><th>Comment</th><th class="text-center">Delete</th></tr></thead>
            <tbody>
            <% if(reviews!=null){ for(Review r:reviews){ %>
            <tr>
                <td><small style="color:rgba(255,255,255,.4)"><%= r.getReviewId() %></small></td>
                <td><strong><%= r.getUserName() %></strong></td>
                <td style="color:#f0c040"><% for(int i=1;i<=r.getRating();i++){%>★<% } %></td>
                <td><span class="badge-status <%= "VERIFIED".equals(r.getReviewType())?"bs-confirmed":"bs-pending" %>"><%= r.getReviewType() %></span></td>
                <td><small><%= r.getComment().length()>60?r.getComment().substring(0,60)+"...":r.getComment() %></small></td>
                <td class="text-center"><a href="/admin/reviews/delete/<%= r.getReviewId() %>" class="btn-del-dark" onclick="return confirm('Remove review?')"><i class="bi bi-trash"></i></a></td>
            </tr>
            <% } } %>
            </tbody>
        </table>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
