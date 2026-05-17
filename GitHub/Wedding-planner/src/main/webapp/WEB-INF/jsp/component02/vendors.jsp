<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.ttt.component02.model.Vendor" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vendors — Tie The Tech</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        * { font-family:'Inter',sans-serif; } body { background:#f5f4f0; }
        .ttt-navbar { background:linear-gradient(135deg,#1a1a2e,#16213e); padding:14px 0; box-shadow:0 2px 20px rgba(0,0,0,.25); }
        .ttt-navbar .navbar-brand { color:#f0c040!important; font-weight:800; }
        .ttt-navbar .nav-link { color:rgba(255,255,255,.7)!important; font-weight:500; }
        .ttt-navbar .nav-link:hover,.ttt-navbar .nav-link.active { color:#f0c040!important; }
        .page-header { background:linear-gradient(135deg,#4776E6,#8E54E9); padding:40px 0 30px; margin-bottom:32px; }
        .page-header h2 { font-weight:800; color:white; }
        .page-header p { color:rgba(255,255,255,.7); font-size:.9rem; margin:0; }
        .vendor-card { background:white; border-radius:16px; border:none; box-shadow:0 4px 20px rgba(0,0,0,.07); transition:transform .2s,box-shadow .2s; overflow:hidden; height:100%; }
        .vendor-card:hover { transform:translateY(-4px); box-shadow:0 12px 32px rgba(0,0,0,.13); }
        .vendor-accent { height:4px; }
        .category-badge { border-radius:20px; padding:4px 12px; font-size:.75rem; font-weight:700; }
        .cat-venue { background:#e8f4ff; color:#1565c0; }
        .cat-photography { background:#f3e5f5; color:#7b1fa2; }
        .cat-catering { background:#e8f5e9; color:#2e7d32; }
        .star-rating { color:#f0c040; font-size:.85rem; }
        .btn-gold { background:linear-gradient(135deg,#f0c040,#d4a017); color:#1a1a2e; border:none; border-radius:20px; padding:6px 16px; font-size:.85rem; font-weight:700; }
        .filter-bar { background:white; border-radius:12px; padding:16px 20px; box-shadow:0 2px 10px rgba(0,0,0,.06); margin-bottom:24px; }
        .btn-action { border-radius:8px; padding:4px 10px; font-size:.8rem; font-weight:600; border:none; }
        .btn-edit { background:#fff3cd; color:#856404; } .btn-edit:hover { background:#ffc107; color:#1a1a2e; }
        .btn-del  { background:#f8d7da; color:#721c24; } .btn-del:hover { background:#dc3545; color:white; }
        .empty-state { text-align:center; padding:60px 20px; }
        .price-tag { color:#11998e; font-weight:700; font-size:.9rem; }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg ttt-navbar">
    <div class="container">
        <a class="navbar-brand" href="/">💍 Tie The Tech</a>
        <div class="navbar-nav ms-auto align-items-center gap-2">
            <a class="nav-link" href="/">Home</a>
            <a class="nav-link active" href="/vendors">Vendors</a>
            <a class="nav-link" href="/bookings">Bookings</a>
            <a class="nav-link" href="/payments">Payments</a>
            <a class="nav-link" href="/planning/checklist">Planning</a>
            <a class="nav-link" href="/reviews">Reviews</a>
            <% if(session.getAttribute("userId")!=null){ %>
                <a class="nav-link" href="/profile"><%= session.getAttribute("userName") %></a>
            <% } else { %><a href="/login" class="nav-link">Login</a><% } %>
            <a href="/vendors/new" class="btn-gold ms-2"><i class="bi bi-plus"></i> Add Vendor</a>
        </div>
    </div>
</nav>

<div class="page-header">
    <div class="container">
        <h2><i class="bi bi-shop me-2"></i>Vendor Directory</h2>
        <p>Component 2 — Vendor Management | Inheritance: VenueVendor · PhotographyVendor · CateringVendor</p>
    </div>
</div>

<div class="container pb-5">
    <!-- Filter Bar -->
    <div class="filter-bar d-flex gap-2 flex-wrap align-items-center">
        <strong style="font-size:.88rem;color:#888">Filter by Category:</strong>
        <a href="/vendors" class="btn btn-sm <%= request.getParameter("category")==null?"btn-dark":"btn-outline-secondary" %> rounded-pill">All</a>
        <a href="/vendors?category=VENUE"       class="btn btn-sm <%= "VENUE".equals(request.getParameter("category"))?"btn-primary":"btn-outline-primary" %> rounded-pill">🏛 Venue</a>
        <a href="/vendors?category=PHOTOGRAPHY" class="btn btn-sm <%= "PHOTOGRAPHY".equals(request.getParameter("category"))?"btn-purple":"btn-outline-secondary" %> rounded-pill">📷 Photography</a>
        <a href="/vendors?category=CATERING"    class="btn btn-sm <%= "CATERING".equals(request.getParameter("category"))?"btn-success":"btn-outline-success" %> rounded-pill">🍽 Catering</a>
    </div>

    <%
    List<Vendor> vendors = (List<Vendor>) request.getAttribute("vendors");
    if (vendors == null || vendors.isEmpty()) { %>
    <div class="card empty-state">
        <i class="bi bi-shop" style="font-size:4rem;color:#ddd"></i>
        <h5 class="text-muted mt-3">No vendors found</h5>
        <a href="/vendors/new" class="btn btn-dark rounded-pill mt-3 px-4">Register First Vendor</a>
    </div>
    <% } else { %>
    <div class="row g-4">
    <% for (Vendor v : vendors) {
        String accentColor = "VENUE".equals(v.getCategory()) ? "linear-gradient(90deg,#4776E6,#8E54E9)"
                           : "PHOTOGRAPHY".equals(v.getCategory()) ? "linear-gradient(90deg,#f953c6,#b91d73)"
                           : "linear-gradient(90deg,#11998e,#38ef7d)";
        String catClass = "VENUE".equals(v.getCategory()) ? "cat-venue"
                        : "PHOTOGRAPHY".equals(v.getCategory()) ? "cat-photography" : "cat-catering";
        String catIcon  = "VENUE".equals(v.getCategory()) ? "🏛" : "PHOTOGRAPHY".equals(v.getCategory()) ? "📷" : "🍽";
    %>
        <div class="col-md-4">
            <div class="vendor-card">
                <div class="vendor-accent" style="background:<%= accentColor %>"></div>
                <div class="p-4">
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <span class="category-badge <%= catClass %>"><%= catIcon %> <%= v.getCategory() %></span>
                        <div class="star-rating">
                            <% for(int i=1;i<=5;i++) { %><%= i<=v.getRating()?"★":"☆" %><% } %>
                            <small class="text-muted ms-1">(<%= v.getRating() %>)</small>
                        </div>
                    </div>
                    <h5 class="fw-800 mt-2 mb-1"><%= v.getBusinessName() %></h5>
                    <p class="text-muted mb-1" style="font-size:.85rem"><i class="bi bi-geo-alt me-1"></i><%= v.getLocation() %></p>
                    <p class="text-muted mb-2" style="font-size:.83rem;line-height:1.5"><%= v.getDescription().length()>80?v.getDescription().substring(0,80)+"...":v.getDescription() %></p>
                    <p class="price-tag mb-3"><i class="bi bi-cash me-1"></i>LKR <%= v.getPriceRange() %></p>
                    <div class="d-flex gap-2">
                        <a href="/vendors/<%= v.getVendorId() %>" class="btn btn-action btn-edit flex-grow-1 text-center">View</a>
                        <a href="/vendors/edit/<%= v.getVendorId() %>" class="btn btn-action btn-edit"><i class="bi bi-pencil"></i></a>
                        <a href="/vendors/delete/<%= v.getVendorId() %>" class="btn btn-action btn-del" onclick="return confirm('Delete this vendor?')"><i class="bi bi-trash"></i></a>
                    </div>
                </div>
            </div>
        </div>
    <% } %>
    </div>
    <div class="mt-3"><small class="text-muted">Total vendors: <strong><%= vendors.size() %></strong></small></div>
    <% } %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
