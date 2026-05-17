<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile — Tie The Tech</title>
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
        .ttt-navbar .btn-logout { background: transparent; color: #f0c040; border: 1.5px solid #f0c040; border-radius: 20px; padding: 5px 18px; font-size: 0.88rem; font-weight: 600; }
        .ttt-navbar .btn-logout:hover { background: #f0c040; color: #1a1a2e; }
        .page-header { background: linear-gradient(135deg, #1a1a2e, #16213e); padding: 40px 0 30px; color: white; margin-bottom: 32px; }
        .page-header h2 { font-weight: 800; color: #f0c040; }
        .page-header p { color: rgba(255,255,255,0.6); font-size: 0.9rem; margin: 0; }
        .card { border: none; border-radius: 16px; box-shadow: 0 4px 20px rgba(0,0,0,0.07); }
        .avatar { width: 80px; height: 80px; border-radius: 50%; background: linear-gradient(135deg, #1a1a2e, #16213e); display: flex; align-items: center; justify-content: center; margin: 0 auto 16px; border: 3px solid #f0c040; }
        .avatar h2 { color: #f0c040; font-weight: 800; margin: 0; font-size: 1.8rem; }
        .role-badge { background: linear-gradient(135deg, #f0c040, #d4a017); color: #1a1a2e; font-weight: 700; border-radius: 20px; padding: 4px 14px; font-size: 0.8rem; }
        .section-label { font-weight: 700; color: #1a1a2e; font-size: 1rem; border-left: 4px solid #f0c040; padding-left: 12px; margin-bottom: 20px; }
        .form-label { font-weight: 600; color: #555; font-size: 0.88rem; }
        .form-control { border-radius: 10px; border: 1.5px solid #e0e0e0; padding: 11px 14px; }
        .form-control:focus { border-color: #f0c040; box-shadow: 0 0 0 3px rgba(240,192,64,0.15); }
        .form-control:disabled { background: #f8f8f8; color: #999; }
        .btn-save { background: linear-gradient(135deg, #1a1a2e, #16213e); color: #f0c040; border: none; border-radius: 10px; padding: 11px 28px; font-weight: 700; }
        .btn-save:hover { opacity: 0.9; color: #f0c040; }
        .danger-card { border: 1.5px solid #f8d7da; }
        .btn-delete { background: transparent; color: #dc3545; border: 1.5px solid #dc3545; border-radius: 10px; padding: 11px; width: 100%; font-weight: 700; }
        .btn-delete:hover { background: #dc3545; color: white; }
        .info-row { display: flex; align-items: center; padding: 12px 0; border-bottom: 1px solid #f0f0f0; }
        .info-row:last-child { border-bottom: none; }
        .info-label { color: #888; font-size: 0.85rem; width: 100px; }
        .info-value { font-weight: 600; color: #1a1a2e; }
        .alert { border-radius: 10px; border: none; }
    </style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg ttt-navbar">
    <div class="container">
        <a class="navbar-brand" href="/">💍 Tie The Tech</a>
        <div class="navbar-nav ms-auto align-items-center gap-3">
            <a class="nav-link" href="/"><i class="bi bi-house me-1"></i>Home</a>
            <a class="nav-link" href="/bookings"><i class="bi bi-calendar-check me-1"></i>Bookings</a>
            <a class="nav-link" href="/payments"><i class="bi bi-credit-card me-1"></i>Payments</a>
            <a href="/logout" class="btn-logout"><i class="bi bi-box-arrow-right me-1"></i>Logout</a>
        </div>
    </div>
</nav>

<!-- PAGE HEADER -->
<div class="page-header">
    <div class="container">
        <h2><i class="bi bi-person-circle me-2"></i>My Profile</h2>
        <p>Component 1 — User Management | READ &amp; UPDATE &amp; DELETE operations</p>
    </div>
</div>

<div class="container pb-5">
    <div class="row g-4">

        <!-- LEFT: User Info Card -->
        <div class="col-lg-4">
            <div class="card p-4 text-center mb-4">
                <div class="avatar">
                    <h2>
                        <%
                            String uName = (String) session.getAttribute("userName");
                            if (uName != null && !uName.isEmpty()) { out.print(uName.substring(0,1).toUpperCase()); }
                            else { out.print("U"); }
                        %>
                    </h2>
                </div>
                <h5 class="fw-800 mb-1">${sessionScope.userName}</h5>
                <p class="text-muted mb-3" style="font-size:0.9rem">${sessionScope.userEmail}</p>
                <span class="role-badge">${sessionScope.userRole}</span>

                <div class="mt-4 text-start">
                    <div class="info-row">
                        <span class="info-label">User ID</span>
                        <span class="info-value" style="font-size:0.85rem">${sessionScope.userId}</span>
                    </div>
                    <div class="info-row">
                        <span class="info-label">Role</span>
                        <span class="info-value">${sessionScope.userRole}</span>
                    </div>
                    <div class="info-row">
                        <span class="info-label">Status</span>
                        <span class="info-value"><i class="bi bi-circle-fill text-success me-1" style="font-size:0.6rem"></i>Active</span>
                    </div>
                </div>
            </div>

            <!-- Danger Zone -->
            <div class="card p-4 danger-card">
                <h6 class="text-danger fw-700 mb-1"><i class="bi bi-exclamation-triangle me-2"></i>Danger Zone</h6>
                <p class="text-muted mb-3" style="font-size:0.82rem">This will permanently delete your account and all associated data from the database.</p>
                <form action="/profile/delete" method="POST" onsubmit="return confirm('Are you absolutely sure? This cannot be undone!');">
                    <button type="submit" class="btn-delete"><i class="bi bi-trash me-2"></i>Delete My Account</button>
                </form>
            </div>
        </div>

        <!-- RIGHT: Update Form -->
        <div class="col-lg-8">
            <div class="card p-4">
                <div class="section-label">Update Profile Details</div>

                <% if (request.getAttribute("success") != null) { %>
                    <div class="alert alert-success mb-4"><i class="bi bi-check-circle me-2"></i><%= request.getAttribute("success") %></div>
                <% } %>

                <form action="/profile/update" method="POST">
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" name="name" class="form-control" value="${sessionScope.userName}" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email Address <small class="text-danger">(Cannot be changed)</small></label>
                        <input type="email" class="form-control" value="${sessionScope.userEmail}" disabled>
                    </div>
                    <hr class="my-4">
                    <p class="section-label">Change Password</p>
                    <p class="text-muted mb-3" style="font-size:0.88rem">Leave blank to keep your current password.</p>
                    <div class="mb-4">
                        <label class="form-label">New Password</label>
                        <input type="password" name="password" class="form-control" placeholder="Enter new password (optional)">
                    </div>
                    <button type="submit" class="btn-save"><i class="bi bi-floppy me-2"></i>Save Changes</button>
                </form>
            </div>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
