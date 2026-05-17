<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Write a Review — TTT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        *{font-family:'Inter',sans-serif;} body{background:#f5f4f0;}
        .ttt-navbar{background:linear-gradient(135deg,#1a1a2e,#16213e);padding:14px 0;}
        .ttt-navbar .navbar-brand{color:#f0c040!important;font-weight:800;}
        .ttt-navbar .nav-link{color:rgba(255,255,255,.7)!important;} .ttt-navbar .nav-link:hover{color:#f0c040!important;}
        .page-header{background:linear-gradient(135deg,#f7971e,#ffd200);padding:40px 0 30px;margin-bottom:32px;}
        .page-header h2{font-weight:800;color:#1a1a2e;} .page-header p{color:rgba(26,26,46,.6);font-size:.9rem;margin:0;}
        .card{border:none;border-radius:16px;box-shadow:0 4px 20px rgba(0,0,0,.07);}
        .form-label{font-weight:600;color:#444;font-size:.9rem;}
        .form-control,.form-select{border-radius:10px;border:1.5px solid #e0e0e0;padding:11px 14px;}
        .form-control:focus,.form-select:focus{border-color:#f7971e;box-shadow:0 0 0 3px rgba(247,151,30,.15);}
        .star-selector{display:flex;flex-direction:row-reverse;justify-content:flex-end;gap:4px;}
        .star-selector input{display:none;}
        .star-selector label{font-size:2rem;color:#ddd;cursor:pointer;transition:color .2s;}
        .star-selector input:checked ~ label,.star-selector label:hover,.star-selector label:hover ~ label{color:#f0c040;}
        .btn-submit{background:linear-gradient(135deg,#f7971e,#ffd200);color:#1a1a2e;border:none;border-radius:10px;padding:13px;font-weight:700;width:100%;}
        .btn-submit:hover{opacity:.9;color:#1a1a2e;}
        .btn-back{background:transparent;color:#888;border:1.5px solid #ddd;border-radius:10px;padding:13px;font-weight:600;width:100%;}
        .type-card{border:1.5px solid #e0e0e0;border-radius:12px;padding:14px;cursor:pointer;transition:all .2s;}
        .type-card:has(input:checked){border-color:#f7971e;background:#fff8ee;}
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg ttt-navbar">
    <div class="container">
        <a class="navbar-brand" href="/">💍 Tie The Tech</a>
        <div class="navbar-nav ms-auto gap-2">
            <a class="nav-link" href="/reviews">← All Reviews</a>
        </div>
    </div>
</nav>
<div class="page-header">
    <div class="container">
        <h2><i class="bi bi-star-fill me-2"></i>Write a Review</h2>
        <p>Component 5 — Reviews & Ratings | CREATE operation</p>
    </div>
</div>
<div class="container pb-5">
    <div class="row justify-content-center">
        <div class="col-md-7">
            <div class="card p-4">
                <form action="/reviews/new" method="POST">
                    <div class="mb-3">
                        <label class="form-label">Vendor ID <small class="text-muted">(from the Vendors page)</small></label>
                        <input type="text" class="form-control" name="vendorId" placeholder="e.g. VND-A1B2C" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Your Name</label>
                        <input type="text" class="form-control" name="userName"
                               value="<%= session.getAttribute("userName") != null ? session.getAttribute("userName") : "" %>"
                               placeholder="Your name" required>
                    </div>
                    <!-- Star Rating -->
                    <div class="mb-3">
                        <label class="form-label">Rating</label>
                        <div class="star-selector">
                            <input type="radio" name="rating" id="s5" value="5"><label for="s5">★</label>
                            <input type="radio" name="rating" id="s4" value="4"><label for="s4">★</label>
                            <input type="radio" name="rating" id="s3" value="3" checked><label for="s3">★</label>
                            <input type="radio" name="rating" id="s2" value="2"><label for="s2">★</label>
                            <input type="radio" name="rating" id="s1" value="1"><label for="s1">★</label>
                        </div>
                    </div>
                    <!-- OOP Demo: Review Type -->
                    <div class="mb-3">
                        <label class="form-label">Review Type <small class="text-muted">(OOP: Inheritance demo)</small></label>
                        <div class="row g-2">
                            <div class="col-6">
                                <label class="type-card d-block">
                                    <input type="radio" name="reviewType" value="VERIFIED" checked class="me-2">
                                    <strong>✓ Verified</strong>
                                    <p class="text-muted mb-0" style="font-size:.78rem">For couples with a booking — can edit later</p>
                                </label>
                            </div>
                            <div class="col-6">
                                <label class="type-card d-block">
                                    <input type="radio" name="reviewType" value="PUBLIC" class="me-2">
                                    <strong>Public</strong>
                                    <p class="text-muted mb-0" style="font-size:.78rem">Open to all — final once submitted</p>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Your Review</label>
                        <textarea class="form-control" name="comment" rows="4" placeholder="Share your experience with this vendor..." required></textarea>
                    </div>
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn-submit"><i class="bi bi-star me-2"></i>Submit Review</button>
                        <a href="/reviews" class="btn-back text-center text-decoration-none"><i class="bi bi-arrow-left me-2"></i>Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
