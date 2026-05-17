<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.ttt.component04.model.Task" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wedding Checklist — TTT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        *{font-family:'Inter',sans-serif;} body{background:#f5f4f0;}
        .ttt-navbar{background:linear-gradient(135deg,#1a1a2e,#16213e);padding:14px 0;}
        .ttt-navbar .navbar-brand{color:#f0c040!important;font-weight:800;}
        .ttt-navbar .nav-link{color:rgba(255,255,255,.7)!important;} .ttt-navbar .nav-link:hover{color:#f0c040!important;}
        .page-header{background:linear-gradient(135deg,#f953c6,#b91d73);padding:40px 0 30px;margin-bottom:32px;}
        .page-header h2{font-weight:800;color:white;} .page-header p{color:rgba(255,255,255,.7);font-size:.9rem;margin:0;}
        .card{border:none;border-radius:16px;box-shadow:0 4px 20px rgba(0,0,0,.07);}
        .task-item{padding:14px 16px;border-bottom:1px solid #f5f5f5;display:flex;align-items:center;gap:12px;transition:background .2s;}
        .task-item:hover{background:#fdf4fc;} .task-item:last-child{border:none;}
        .task-done{opacity:.5;text-decoration:line-through;}
        .task-check{width:22px;height:22px;border-radius:50%;border:2px solid #b91d73;display:flex;align-items:center;justify-content:center;cursor:pointer;flex-shrink:0;text-decoration:none;}
        .task-check.done{background:#b91d73;border-color:#b91d73;color:white;}
        .badge-cat{border-radius:20px;padding:3px 10px;font-size:.73rem;font-weight:700;}
        .cat-ceremony{background:#fce4ec;color:#880e4f;} .cat-reception{background:#e8eaf6;color:#283593;}
        .cat-vendor{background:#e8f5e9;color:#1b5e20;} .cat-diy{background:#fff3e0;color:#e65100;}
        .progress-bar-custom{background:linear-gradient(90deg,#f953c6,#b91d73);border-radius:10px;}
        .form-inline-card{background:white;border-radius:16px;box-shadow:0 2px 12px rgba(0,0,0,.06);padding:20px;}
        .form-control,.form-select{border-radius:10px;border:1.5px solid #e0e0e0;padding:10px 14px;font-size:.9rem;}
        .btn-add{background:linear-gradient(135deg,#f953c6,#b91d73);color:white;border:none;border-radius:10px;padding:10px 20px;font-weight:700;}
        .btn-del{background:#f8d7da;color:#721c24;border:none;border-radius:8px;padding:4px 8px;font-size:.8rem;}
        .btn-del:hover{background:#dc3545;color:white;}
        .stat-box{background:white;border-radius:14px;padding:16px 20px;box-shadow:0 2px 10px rgba(0,0,0,.06);}
        .stat-box h3{font-size:1.8rem;font-weight:800;color:#b91d73;margin:0;} .stat-box p{color:#888;font-size:.82rem;margin:0;}
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg ttt-navbar">
    <div class="container">
        <a class="navbar-brand" href="/">💍 Tie The Tech</a>
        <div class="navbar-nav ms-auto gap-2">
            <a class="nav-link" href="/">Home</a>
            <a class="nav-link active" href="/planning/checklist">Checklist</a>
            <a class="nav-link" href="/planning/budget">Budget</a>
            <a class="nav-link" href="/planning/guests">Guests</a>
            <% if(session.getAttribute("userId")!=null){%><a class="nav-link" href="/profile"><%= session.getAttribute("userName") %></a><%}%>
        </div>
    </div>
</nav>
<div class="page-header">
    <div class="container">
        <h2><i class="bi bi-check2-all me-2"></i>Wedding Checklist</h2>
        <p>Component 4 — Planning Tools | Task management with CRUD operations</p>
    </div>
</div>
<div class="container pb-5">
    <%
    List<Task> tasks = (List<Task>) request.getAttribute("tasks");
    int total = tasks != null ? tasks.size() : 0;
    int done  = tasks != null ? (int)(long)(Long)request.getAttribute("completedCount") : 0;
    int pct   = total > 0 ? (done * 100 / total) : 0;
    %>
    <!-- Stats -->
    <div class="row g-3 mb-4">
        <div class="col-md-3"><div class="stat-box"><p>Total Tasks</p><h3><%= total %></h3></div></div>
        <div class="col-md-3"><div class="stat-box"><h3 style="color:#11998e"><%= done %></h3><p>Completed</p></div></div>
        <div class="col-md-3"><div class="stat-box"><h3 style="color:#ff5722"><%= total-done %></h3><p>Pending</p></div></div>
        <div class="col-md-3"><div class="stat-box"><h3><%= pct %>%</h3><p>Progress</p></div></div>
    </div>
    <!-- Progress Bar -->
    <div class="mb-4">
        <div class="progress" style="height:10px;border-radius:10px;background:#f0e0f5">
            <div class="progress-bar progress-bar-custom" style="width:<%= pct %>%"></div>
        </div>
    </div>
    <!-- Add Task Form -->
    <div class="form-inline-card mb-4">
        <h6 class="fw-800 mb-3"><i class="bi bi-plus-circle me-2" style="color:#b91d73"></i>Add New Task</h6>
        <form action="/planning/tasks/add" method="POST">
            <div class="row g-2">
                <div class="col-md-4"><input type="text" class="form-control" name="title" placeholder="Task title..." required></div>
                <div class="col-md-2">
                    <select class="form-select" name="category">
                        <option value="CEREMONY">Ceremony</option><option value="RECEPTION">Reception</option>
                        <option value="VENDOR">Vendor</option><option value="DIY">DIY</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <select class="form-select" name="taskType">
                        <option value="APPOINTMENT">Appointment</option><option value="PURCHASE">Purchase</option>
                        <option value="BOOKING">Booking</option><option value="GENERAL">General</option>
                    </select>
                </div>
                <div class="col-md-2"><input type="date" class="form-control" name="dueDate"></div>
                <div class="col-md-2"><button type="submit" class="btn-add w-100"><i class="bi bi-plus"></i> Add</button></div>
            </div>
        </form>
    </div>
    <!-- Task List -->
    <div class="card">
        <% if (tasks == null || tasks.isEmpty()) { %>
        <div class="text-center p-5 text-muted"><i class="bi bi-check2-all" style="font-size:3rem;color:#ddd"></i><p class="mt-3">No tasks yet. Add your first task above!</p></div>
        <% } else { for (Task t : tasks) { %>
        <div class="task-item">
            <a href="/planning/tasks/complete/<%= t.getTaskId() %>" class="task-check <%= t.isCompleted()?"done":"" %>">
                <% if(t.isCompleted()){ %><i class="bi bi-check2" style="font-size:.75rem"></i><% } %>
            </a>
            <div class="flex-grow-1">
                <span class="<%= t.isCompleted()?"task-done":"" %>" style="font-weight:600"><%= t.getTitle() %></span>
                <div class="mt-1">
                    <span class="badge-cat cat-<%= t.getCategory().toLowerCase() %> me-1"><%= t.getCategory() %></span>
                    <% if(t.getDueDate()!=null&&!t.getDueDate().isEmpty()){ %><small class="text-muted"><i class="bi bi-calendar3 me-1"></i><%= t.getDueDate() %></small><% } %>
                </div>
            </div>
            <a href="/planning/tasks/delete/<%= t.getTaskId() %>" class="btn-del" onclick="return confirm('Delete?')"><i class="bi bi-trash"></i></a>
        </div>
        <% } } %>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
