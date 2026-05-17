<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ttt.component05.model.Review" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Review — TTT</title>
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
        .form-label{font-weight:600;color:#444;font-size:.9rem;}
        .form-control,.form-select{border-radius:10px;border:1.5px solid #e0e0e0;padding:11px 14px;}
        .form-control:focus{border-color:#f0c040;box-shadow:0 0 0 3px rgba(240,192,64,.15);}
        .star-selector{display:flex;flex-direction:row-reverse;justify-content:flex-end;gap:4px;}
        .star-selector input{display:none;} .star-selector label{font-size:2rem;color:#ddd;cursor:pointer;transition:color .2s;}
        .star-selector input:checked ~ label,.star-selector label:hover,.star-selector label:hover ~ label{color:#f0c040;}
        .btn-save{background:linear-gradient(135deg,#f0c040,#d4a017);color:#1a1a2e;border:none;border-radius:10px;padding:13px;font-weight:700;width:100%;}
        .btn-back{background:transparent;color:#888;border:1.5px solid #ddd;border-radius:10px;padding:13px;font-weight:600;width:100%;}
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg ttt-navbar">
    <div class="container">
        <a class="navbar-brand" href="/">💍 Tie The Tech</a>
        <div class="navbar-nav ms-auto gap-2"><a class="nav-link" href="/reviews">← Reviews</a></div>
    </div>
</nav>
<div class="page-header">
    <div class="container">
        <h2><i class="bi bi-pencil-square me-2"></i>Edit Review</h2>
        <p>Component 5 — Reviews & Ratings | UPDATE operation</p>
    </div>
</div>
<div class="container pb-5">
    <div class="row justify-content-center">
        <div class="col-md-7">
            <% Review r = (Review) request.getAttribute("review");
               if(r != null) { %>
            <div class="card p-4">
                <div class="mb-3 p-3 rounded" style="background:#fff3cd;font-size:.85rem;color:#856404">
                    <i class="bi bi-hash me-1"></i><strong>Review ID:</strong> <%= r.getReviewId() %>
                    &nbsp;&nbsp;<strong>Type:</strong> <%= r.getReviewType() %>
                </div>
                <form action="/reviews/edit" method="POST">
                    <input type="hidden" name="reviewId" value="<%= r.getReviewId() %>">
                    <div class="mb-3">
                        <label class="form-label">Rating</label>
                        <div class="star-selector">
                            <% for(int i=5;i>=1;i--){ %>
                            <input type="radio" name="rating" id="s<%= i %>" value="<%= i %>" <%= r.getRating()==i?"checked":"" %>>
                            <label for="s<%= i %>">★</label>
                            <% } %>
                        </div>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Your Review</label>
                        <textarea class="form-control" name="comment" rows="5"><%= r.getComment() %></textarea>
                    </div>
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn-save"><i class="bi bi-floppy me-2"></i>Save Changes</button>
                        <a href="/reviews" class="btn-back text-center text-decoration-none"><i class="bi bi-arrow-left me-2"></i>Back</a>
                    </div>
                </form>
            </div>
            <% } %>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
