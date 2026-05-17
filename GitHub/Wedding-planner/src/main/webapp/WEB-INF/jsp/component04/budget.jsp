<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.ttt.component04.model.BudgetItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Budget Tracker — TTT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        *{font-family:'Inter',sans-serif;} body{background:#f5f4f0;}
        .ttt-navbar{background:linear-gradient(135deg,#1a1a2e,#16213e);padding:14px 0;}
        .ttt-navbar .navbar-brand{color:#f0c040!important;font-weight:800;}
        .ttt-navbar .nav-link{color:rgba(255,255,255,.7)!important;} .ttt-navbar .nav-link:hover{color:#f0c040!important;}
        .page-header{background:linear-gradient(135deg,#11998e,#38ef7d);padding:40px 0 30px;margin-bottom:32px;}
        .page-header h2{font-weight:800;color:#1a1a2e;} .page-header p{color:rgba(26,26,46,.65);font-size:.9rem;margin:0;}
        .card{border:none;border-radius:16px;box-shadow:0 4px 20px rgba(0,0,0,.07);}
        .summary-box{background:linear-gradient(135deg,#1a1a2e,#16213e);border-radius:14px;padding:20px 24px;color:white;}
        .summary-box h3{color:#f0c040;font-weight:800;font-size:1.8rem;margin:0;}
        .summary-box p{color:rgba(255,255,255,.6);font-size:.82rem;margin:0;}
        .summary-box.green h3{color:#38ef7d;} .summary-box.red h3{color:#ff6b6b;}
        .table thead{background:linear-gradient(135deg,#11998e,#0d8073);color:white;}
        .table thead th{font-weight:600;font-size:.85rem;border:none;padding:14px 16px;}
        .table tbody td{padding:12px 16px;vertical-align:middle;font-size:.9rem;border-color:#f5f5f5;}
        .badge-over{background:#f8d7da;color:#721c24;border-radius:20px;padding:3px 10px;font-size:.75rem;font-weight:700;}
        .badge-ok{background:#d1f5e0;color:#155724;border-radius:20px;padding:3px 10px;font-size:.75rem;font-weight:700;}
        .btn-del{background:#f8d7da;color:#721c24;border:none;border-radius:8px;padding:4px 8px;}
        .btn-del:hover{background:#dc3545;color:white;}
        .form-control,.form-select{border-radius:10px;border:1.5px solid #e0e0e0;padding:10px 14px;}
        .btn-add{background:linear-gradient(135deg,#11998e,#38ef7d);color:#1a1a2e;border:none;border-radius:10px;padding:10px 20px;font-weight:700;}
        .form-card{background:white;border-radius:16px;box-shadow:0 2px 12px rgba(0,0,0,.06);padding:20px;}
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg ttt-navbar">
    <div class="container">
        <a class="navbar-brand" href="/">💍 Tie The Tech</a>
        <div class="navbar-nav ms-auto gap-2">
            <a class="nav-link" href="/planning/checklist">Checklist</a>
            <a class="nav-link active" href="/planning/budget">Budget</a>
            <a class="nav-link" href="/planning/guests">Guests</a>
        </div>
    </div>
</nav>
<div class="page-header">
    <div class="container">
        <h2><i class="bi bi-wallet2 me-2"></i>Budget Tracker</h2>
        <p>Component 4 — Planning Tools | Budget CRUD</p>
    </div>
</div>
<div class="container pb-5">
    <%
    List<BudgetItem> items = (List<BudgetItem>) request.getAttribute("budgetItems");
    double estimated = request.getAttribute("totalEstimated") != null ? (Double) request.getAttribute("totalEstimated") : 0;
    double actual    = request.getAttribute("totalActual")    != null ? (Double) request.getAttribute("totalActual")    : 0;
    double diff      = request.getAttribute("difference")     != null ? (Double) request.getAttribute("difference")     : 0;
    %>
    <div class="row g-3 mb-4">
        <div class="col-md-4"><div class="summary-box"><p>Total Estimated</p><h3>LKR <%= String.format("%.0f",estimated) %></h3></div></div>
        <div class="col-md-4"><div class="summary-box"><p>Total Spent</p><h3>LKR <%= String.format("%.0f",actual) %></h3></div></div>
        <div class="col-md-4"><div class="summary-box <%= diff>=0?"green":"red" %>"><p>Remaining</p><h3>LKR <%= String.format("%.0f",diff) %></h3></div></div>
    </div>
    <div class="form-card mb-4">
        <h6 class="fw-800 mb-3"><i class="bi bi-plus-circle me-2" style="color:#11998e"></i>Add Budget Item</h6>
        <form action="/planning/budget/add" method="POST">
            <div class="row g-2">
                <div class="col-md-2">
                    <select class="form-select" name="category">
                        <option value="VENUE">Venue</option><option value="CATERING">Catering</option>
                        <option value="PHOTOGRAPHY">Photography</option><option value="FLOWERS">Flowers</option>
                        <option value="ATTIRE">Attire</option><option value="MUSIC">Music</option><option value="OTHER">Other</option>
                    </select>
                </div>
                <div class="col-md-3"><input type="text" class="form-control" name="description" placeholder="Description" required></div>
                <div class="col-md-2"><input type="number" step="0.01" class="form-control" name="estimated" placeholder="Estimated (LKR)" required></div>
                <div class="col-md-2"><input type="number" step="0.01" class="form-control" name="actual" placeholder="Actual (LKR)" value="0"></div>
                <div class="col-md-3"><button type="submit" class="btn-add w-100"><i class="bi bi-plus"></i> Add</button></div>
            </div>
        </form>
    </div>
    <div class="card">
        <div class="table-responsive">
            <table class="table mb-0">
                <thead><tr><th>Category</th><th>Description</th><th>Estimated</th><th>Actual</th><th>Status</th><th class="text-center">Del</th></tr></thead>
                <tbody>
                <% if(items!=null){ for(BudgetItem item:items){ %>
                <tr>
                    <td><strong><%= item.getCategory() %></strong></td>
                    <td><%= item.getDescription() %></td>
                    <td>LKR <%= String.format("%.2f",item.getEstimated()) %></td>
                    <td>LKR <%= String.format("%.2f",item.getActual()) %></td>
                    <td><span class="<%= item.getActual()>item.getEstimated()?"badge-over":"badge-ok" %>"><%= item.getActual()>item.getEstimated()?"Over":"On Track" %></span></td>
                    <td class="text-center"><a href="/planning/budget/delete/<%= item.getItemId() %>" class="btn-del" onclick="return confirm('Delete?')"><i class="bi bi-trash"></i></a></td>
                </tr>
                <% } } %>
                </tbody>
                <tfoot><tr style="background:#f0f8ff;font-weight:700"><td colspan="2">TOTAL</td><td>LKR <%= String.format("%.2f",estimated) %></td><td>LKR <%= String.format("%.2f",actual) %></td><td colspan="2"></td></tr></tfoot>
            </table>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
