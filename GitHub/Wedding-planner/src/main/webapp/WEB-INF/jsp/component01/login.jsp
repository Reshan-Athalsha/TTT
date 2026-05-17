<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login — Tie The Tech</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        * { font-family: 'Inter', sans-serif; }
        body { background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%); min-height: 100vh; display: flex; align-items: center; padding: 40px 0; }
        .auth-card { background: white; border-radius: 20px; box-shadow: 0 25px 60px rgba(0,0,0,0.35); overflow: hidden; }
        .auth-header { background: linear-gradient(135deg, #1a1a2e, #16213e); padding: 32px; text-align: center; }
        .auth-header .logo { font-size: 2.5rem; display: inline-block; animation: float 3s ease-in-out infinite; }
        @keyframes float { 0%,100%{transform:translateY(0)} 50%{transform:translateY(-8px)} }
        .auth-header h4 { color: #f0c040; font-weight: 800; margin: 10px 0 4px; }
        .auth-header p { color: rgba(255,255,255,0.55); font-size: 0.9rem; margin: 0; }
        .auth-body { padding: 32px; }
        .form-label { font-weight: 600; color: #444; font-size: 0.88rem; }
        .form-control { border-radius: 10px; border: 1.5px solid #e0e0e0; padding: 11px 14px 11px 38px; font-size: 0.95rem; }
        .form-control:focus { border-color: #f0c040; box-shadow: 0 0 0 3px rgba(240,192,64,0.15); }
        .icon-wrap { position: relative; }
        .icon-wrap i { position: absolute; left: 12px; top: 50%; transform: translateY(-50%); color: #aaa; }
        .btn-ttt { background: linear-gradient(135deg, #f0c040, #d4a017); color: #1a1a2e; border: none; border-radius: 10px; padding: 13px; font-weight: 700; width: 100%; font-size: 1rem; }
        .btn-ttt:hover { opacity: 0.9; color: #1a1a2e; }
        .alert { border-radius: 10px; border: none; font-size: 0.9rem; }
        .back-link { position: fixed; top: 20px; left: 20px; }
        .back-link a { color: rgba(255,255,255,0.6); text-decoration: none; font-size: 0.9rem; }
        .back-link a:hover { color: #f0c040; }
    </style>
</head>
<body>
<div class="back-link"><a href="/"><i class="bi bi-arrow-left me-1"></i>Home</a></div>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-5 col-lg-4">
            <div class="auth-card">
                <div class="auth-header">
                    <div class="logo">💍</div>
                    <h4>Welcome Back!</h4>
                    <p>Sign in to Tie The Tech</p>
                </div>
                <div class="auth-body">
                    <% if (request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger mb-3"><i class="bi bi-exclamation-circle me-2"></i><%= request.getAttribute("error") %></div>
                    <% } %>
                    <% if (request.getParameter("registered") != null) { %>
                        <div class="alert alert-success mb-3"><i class="bi bi-check-circle me-2"></i>Registration successful! Please login.</div>
                    <% } %>
                    <% if (request.getParameter("logout") != null) { %>
                        <div class="alert alert-info mb-3"><i class="bi bi-box-arrow-right me-2"></i>You have been logged out securely.</div>
                    <% } %>
                    <form action="/login" method="POST">
                        <div class="mb-3">
                            <label class="form-label">Email Address</label>
                            <div class="icon-wrap"><i class="bi bi-envelope"></i>
                                <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
                            </div>
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Password</label>
                            <div class="icon-wrap"><i class="bi bi-lock"></i>
                                <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
                            </div>
                        </div>
                        <button type="submit" class="btn-ttt"><i class="bi bi-box-arrow-in-right me-2"></i>Sign In</button>
                    </form>
                    <hr class="my-4">
                    <p class="text-center text-muted mb-0" style="font-size:0.9rem">Don't have an account? <a href="/register" style="color:#1a1a2e;font-weight:700;">Register here</a></p>
                </div>
            </div>
            <p class="text-center text-white-50 mt-3" style="font-size:0.78rem">Component 1 — User Management</p>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
