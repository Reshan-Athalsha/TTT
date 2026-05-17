<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.ttt.component04.model.Guest" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guest List — TTT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        *{font-family:'Inter',sans-serif;} body{background:#f5f4f0;}
        .ttt-navbar{background:linear-gradient(135deg,#1a1a2e,#16213e);padding:14px 0;}
        .ttt-navbar .navbar-brand{color:#f0c040!important;font-weight:800;}
        .ttt-navbar .nav-link{color:rgba(255,255,255,.7)!important;} .ttt-navbar .nav-link:hover{color:#f0c040!important;}
        .page-header{background:linear-gradient(135deg,#f0c040,#d4a017);padding:40px 0 30px;margin-bottom:32px;}
        .page-header h2{font-weight:800;color:#1a1a2e;} .page-header p{color:rgba(26,26,46,.65);font-size:.9rem;margin:0;}
        .card{border:none;border-radius:16px;box-shadow:0 4px 20px rgba(0,0,0,.07);}
        .stat-box{background:white;border-radius:14px;padding:16px 20px;box-shadow:0 2px 10px rgba(0,0,0,.06);}
        .stat-box h3{font-weight:800;font-size:1.8rem;margin:0;} .stat-box p{color:#888;font-size:.82rem;margin:0;}
        .table thead{background:linear-gradient(135deg,#f0c040,#d4a017);color:#1a1a2e;}
        .table thead th{font-weight:700;font-size:.85rem;border:none;padding:14px 16px;}
        .table tbody td{padding:12px 16px;vertical-align:middle;font-size:.9rem;border-color:#f5f5f5;}
        .badge-confirmed{background:#d1f5e0;color:#155724;border-radius:20px;padding:3px 10px;font-size:.75rem;font-weight:700;}
        .badge-declined{background:#f8d7da;color:#721c24;border-radius:20px;padding:3px 10px;font-size:.75rem;font-weight:700;}
        .badge-pending{background:#fff3cd;color:#856404;border-radius:20px;padding:3px 10px;font-size:.75rem;font-weight:700;}
        .btn-sm-act{border:none;border-radius:6px;padding:3px 8px;font-size:.75rem;font-weight:600;cursor:pointer;}
        .btn-confirm{background:#d1f5e0;color:#155724;} .btn-confirm:hover{background:#28a745;color:white;}
        .btn-decline{background:#f8d7da;color:#721c24;} .btn-decline:hover{background:#dc3545;color:white;}
        .btn-del{background:#dee2e6;color:#495057;} .btn-del:hover{background:#dc3545;color:white;}
        .form-control,.form-select{border-radius:10px;border:1.5px solid #e0e0e0;padding:10px 14px;}
        .btn-add{background:linear-gradient(135deg,#f0c040,#d4a017);color:#1a1a2e;border:none;border-radius:10px;padding:10px 20px;font-weight:700;}
        .form-card{background:white;border-radius:16px;box-shadow:0 2px 12px rgba(0,0,0,.06);padding:20px;}
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg ttt-navbar">
    <div class="container">
        <a class="navbar-brand" href="/">💍 Tie The Tech</a>
        <div class="navbar-nav ms-auto gap-2">
            <a class="nav-link" href="/planning/checklist">Checklist</a>
            <a class="nav-link" href="/planning/budget">Budget</a>
            <a class="nav-link active" href="/planning/guests">Guests</a>
        </div>
    </div>
</nav>
<div class="page-header">
    <div class="container">
        <h2><i class="bi bi-people me-2"></i>Guest List</h2>
        <p>Component 4 — Planning Tools | RSVP tracking with CRUD operations</p>
    </div>
</div>
<div class="container pb-5">
    <%
    List<Guest> guests = (List<Guest>) request.getAttribute("guests");
    long confirmed = request.getAttribute("confirmedCount") != null ? (Long) request.getAttribute("confirmedCount") : 0;
    long declined  = request.getAttribute("declinedCount")  != null ? (Long) request.getAttribute("declinedCount")  : 0;
    int total = guests != null ? guests.size() : 0;
    %>
    <div class="row g-3 mb-4">
        <div class="col-md-3"><div class="stat-box"><p>Total Guests</p><h3 style="color:#1a1a2e"><%= total %></h3></div></div>
        <div class="col-md-3"><div class="stat-box"><p>Confirmed</p><h3 style="color:#28a745"><%= confirmed %></h3></div></div>
        <div class="col-md-3"><div class="stat-box"><p>Declined</p><h3 style="color:#dc3545"><%= declined %></h3></div></div>
        <div class="col-md-3"><div class="stat-box"><p>Pending</p><h3 style="color:#f0c040"><%= total - confirmed - declined %></h3></div></div>
    </div>
    <div class="form-card mb-4">
        <h6 class="fw-800 mb-3"><i class="bi bi-person-plus me-2" style="color:#d4a017"></i>Add Guest</h6>
        <form action="/planning/guests/add" method="POST">
            <div class="row g-2">
                <div class="col-md-3"><input type="text" class="form-control" name="name" placeholder="Guest name" required></div>
                <div class="col-md-3"><input type="email" class="form-control" name="email" placeholder="Email"></div>
                <div class="col-md-2"><input type="number" class="form-control" name="tableNumber" placeholder="Table #" min="1"></div>
                <div class="col-md-2">
                    <select class="form-select" name="plusOne">
                        <option value="false">No Plus One</option>
                        <option value="true">Plus One ✓</option>
                    </select>
                </div>
                <div class="col-md-2"><button type="submit" class="btn-add w-100"><i class="bi bi-plus"></i> Add</button></div>
            </div>
        </form>
    </div>
    <div class="card">
        <div class="table-responsive">
            <table class="table mb-0">
                <thead><tr><th>Name</th><th>Email</th><th>RSVP</th><th>Table</th><th>+1</th><th class="text-center">Actions</th></tr></thead>
                <tbody>
                <% if(guests!=null){ for(Guest g:guests){ %>
                <tr>
                    <td><strong><%= g.getName() %></strong></td>
                    <td><small class="text-muted"><%= g.getEmail() != null ? g.getEmail() : "—" %></small></td>
                    <td><span class="badge-<%= g.getRsvpStatus().toLowerCase() %>"><%= g.getRsvpStatus() %></span></td>
                    <td><%= g.getTableNumber() > 0 ? "Table "+g.getTableNumber() : "—" %></td>
                    <td><%= g.isPlusOne() ? "✅" : "—" %></td>
                    <td class="text-center d-flex gap-1 justify-content-center">
                        <a href="/planning/guests/rsvp/<%= g.getGuestId() %>/CONFIRMED" class="btn-sm-act btn-confirm">✓ Yes</a>
                        <a href="/planning/guests/rsvp/<%= g.getGuestId() %>/DECLINED"  class="btn-sm-act btn-decline">✗ No</a>
                        <a href="/planning/guests/delete/<%= g.getGuestId() %>"          class="btn-sm-act btn-del" onclick="return confirm('Remove guest?')"><i class="bi bi-trash"></i></a>
                    </td>
                </tr>
                <% } } %>
                </tbody>
            </table>
            <% if(guests==null||guests.isEmpty()){ %>
            <div class="text-center p-5 text-muted"><i class="bi bi-people" style="font-size:3rem;color:#ddd"></i><p class="mt-3">No guests added yet.</p></div>
            <% } %>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
