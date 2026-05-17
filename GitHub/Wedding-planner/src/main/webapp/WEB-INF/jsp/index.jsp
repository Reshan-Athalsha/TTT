<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tie The Tech — Wedding Planner</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <style>
        * { font-family: 'Inter', sans-serif; }
        body { background: #fdf9f0; }

        /* ---- NAVBAR ---- */
        .ttt-navbar {
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
            padding: 14px 0;
            box-shadow: 0 2px 20px rgba(0,0,0,0.3);
        }
        .ttt-navbar .navbar-brand { color: #f0c040 !important; font-weight: 800; font-size: 1.3rem; letter-spacing: 0.5px; }
        .ttt-navbar .nav-link { color: rgba(255,255,255,0.75) !important; font-weight: 500; transition: color 0.2s; }
        .ttt-navbar .nav-link:hover { color: #f0c040 !important; }
        .ttt-navbar .btn-nav-login { background: #f0c040; color: #1a1a2e; font-weight: 700; border: none; border-radius: 20px; padding: 6px 20px; }
        .ttt-navbar .btn-nav-login:hover { background: #d4a017; color: #1a1a2e; }

        /* ---- HERO ---- */
        .hero {
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 60%, #0f3460 100%);
            padding: 100px 0 80px;
            position: relative;
            overflow: hidden;
        }
        .hero::before {
            content: '';
            position: absolute; top: -50%; left: -50%;
            width: 200%; height: 200%;
            background: radial-gradient(circle at 30% 50%, rgba(240,192,64,0.08) 0%, transparent 50%),
                        radial-gradient(circle at 70% 30%, rgba(240,192,64,0.05) 0%, transparent 40%);
        }
        .hero h1 { color: #f0c040; font-weight: 800; font-size: 3.2rem; line-height: 1.2; }
        .hero p { color: rgba(255,255,255,0.7); font-size: 1.1rem; }
        .hero .badge-tag { background: rgba(240,192,64,0.15); color: #f0c040; border: 1px solid rgba(240,192,64,0.3); border-radius: 20px; padding: 6px 16px; font-size: 0.85rem; font-weight: 600; display: inline-block; margin-bottom: 20px; }
        .btn-hero { background: linear-gradient(135deg, #f0c040, #d4a017); color: #1a1a2e; font-weight: 700; border: none; border-radius: 30px; padding: 14px 38px; font-size: 1rem; transition: transform 0.2s, box-shadow 0.2s; }
        .btn-hero:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(240,192,64,0.4); color: #1a1a2e; }
        .btn-hero-outline { background: transparent; color: #f0c040; font-weight: 700; border: 2px solid #f0c040; border-radius: 30px; padding: 12px 32px; font-size: 1rem; transition: all 0.2s; }
        .btn-hero-outline:hover { background: #f0c040; color: #1a1a2e; }
        .hero-ring { font-size: 5rem; animation: float 3s ease-in-out infinite; display: inline-block; }
        @keyframes float { 0%,100% { transform: translateY(0); } 50% { transform: translateY(-12px); } }

        /* ---- COMPONENT CARDS ---- */
        .section-title { font-weight: 800; color: #1a1a2e; font-size: 2rem; }
        .section-sub { color: #888; font-size: 1rem; }
        .comp-card {
            background: white;
            border-radius: 18px;
            border: none;
            box-shadow: 0 4px 24px rgba(0,0,0,0.07);
            transition: transform 0.25s, box-shadow 0.25s;
            overflow: hidden;
            height: 100%;
        }
        .comp-card:hover { transform: translateY(-6px); box-shadow: 0 12px 40px rgba(0,0,0,0.13); }
        .comp-card .card-accent { height: 5px; }
        .comp-card .card-icon { width: 64px; height: 64px; border-radius: 16px; display: flex; align-items: center; justify-content: center; font-size: 1.8rem; margin-bottom: 16px; }
        .comp-card h5 { font-weight: 700; color: #1a1a2e; font-size: 1.15rem; }
        .comp-card p { color: #777; font-size: 0.9rem; line-height: 1.6; }
        .comp-card .btn-card { border-radius: 20px; font-weight: 600; font-size: 0.9rem; padding: 8px 22px; border: none; }
        .tag-crud { font-size: 0.75rem; font-weight: 600; color: #888; background: #f5f5f5; border-radius: 10px; padding: 3px 10px; }

        /* ---- STATS ---- */
        .stats-bar { background: linear-gradient(135deg, #1a1a2e, #16213e); border-radius: 18px; padding: 40px; color: white; }
        .stat-item h3 { font-weight: 800; font-size: 2.5rem; color: #f0c040; margin-bottom: 4px; }
        .stat-item p { color: rgba(255,255,255,0.6); font-size: 0.9rem; margin: 0; }

        /* ---- FOOTER ---- */
        footer { background: #1a1a2e; color: rgba(255,255,255,0.5); font-size: 0.85rem; }
        footer .gold { color: #f0c040; font-weight: 700; }
    </style>
</head>
<body>

<!-- ===== NAVBAR ===== -->
<nav class="navbar navbar-expand-lg ttt-navbar">
    <div class="container">
        <a class="navbar-brand" href="/"><span>💍</span> Tie The Tech</a>
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav">
            <span class="navbar-toggler-icon" style="filter:invert(1)"></span>
        </button>
        <div class="collapse navbar-collapse" id="mainNav">
            <div class="navbar-nav ms-auto align-items-center gap-2">
                <a class="nav-link" href="/"><i class="bi bi-house me-1"></i>Home</a>
                <a class="nav-link" href="/vendors"><i class="bi bi-shop me-1"></i>Vendors</a>
                <a class="nav-link" href="/bookings"><i class="bi bi-calendar-check me-1"></i>Bookings</a>
                <a class="nav-link" href="/payments"><i class="bi bi-credit-card me-1"></i>Payments</a>
                <a class="nav-link" href="/planning/checklist"><i class="bi bi-check2-all me-1"></i>Planning</a>
                <a class="nav-link" href="/reviews"><i class="bi bi-star me-1"></i>Reviews</a>
                <a class="nav-link" href="/admin"><i class="bi bi-speedometer2 me-1"></i>Admin</a>
                <a class="nav-link" href="/oop"><i class="bi bi-code-slash me-1"></i>OOP</a>
                <% if (session.getAttribute("userId") != null) { %>
                    <a class="nav-link" href="/profile"><i class="bi bi-person-circle me-1"></i><%= session.getAttribute("userName") %></a>
                    <a href="/logout" class="btn btn-nav-login ms-2">Logout</a>
                <% } else { %>
                    <a href="/login" class="btn btn-nav-login ms-2">Login</a>
                <% } %>
            </div>
        </div>
    </div>
</nav>

<!-- ===== HERO ===== -->
<section class="hero">
    <div class="container position-relative">
        <div class="row align-items-center">
            <div class="col-lg-7">
                <span class="badge-tag"><i class="bi bi-mortarboard me-1"></i> SE1020 — OOP Project</span>
                <h1>Plan Your Perfect<br>Wedding with TTT</h1>
                <p class="my-4">A complete wedding planning management system built with Spring Boot, MySQL, and pure OOP principles. Manage clients, bookings, and payments all in one place.</p>
                <div class="d-flex gap-3 flex-wrap">
                    <a href="/register" class="btn-hero">Get Started <i class="bi bi-arrow-right ms-1"></i></a>
                    <a href="/login" class="btn-hero-outline">Sign In</a>
                </div>
            </div>
            <div class="col-lg-5 text-center mt-5 mt-lg-0">
                <div class="hero-ring">💍</div>
                <p class="text-white-50 mt-3 small">Tie The Tech — Making Weddings Happen</p>
            </div>
        </div>
    </div>
</section>

<!-- ===== STATS BAR ===== -->
<section class="py-5">
    <div class="container">
        <div class="stats-bar">
            <div class="row text-center">
                <div class="col-md-3 col-6 stat-item">
                    <h3>6</h3>
                    <p>Team Members</p>
                </div>
                <div class="col-md-3 col-6 stat-item">
                    <h3>6</h3>
                    <p>CRUD Components</p>
                </div>
                <div class="col-md-3 col-6 stat-item">
                    <h3>5</h3>
                    <p>OOP Principles</p>
                </div>
                <div class="col-md-3 col-6 stat-item">
                    <h3>MySQL</h3>
                    <p>TTT_db Database</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ===== MODULE CARDS ===== -->
<section class="py-5" id="modules">
    <div class="container">
        <div class="text-center mb-5">
            <h2 class="section-title">System Modules</h2>
            <p class="section-sub">Each module is a fully independent component with complete CRUD operations</p>
        </div>
        <div class="row g-4">

            <!-- Component 1: Couple/User Management -->
            <div class="col-md-4">
                <div class="comp-card">
                    <div class="card-accent" style="background: linear-gradient(90deg, #4776E6, #8E54E9);"></div>
                    <div class="p-4">
                        <div class="card-icon" style="background: rgba(71,118,230,0.1);">
                            <span style="color:#4776E6; font-size:1.4rem">💑</span>
                        </div>
                        <span class="tag-crud mb-2 d-inline-block">CREATE · READ · UPDATE · DELETE</span>
                        <h5>Component 1 — Couple/User Management</h5>
                        <p>Register couples, secure login with sessions, manage wedding profiles (date, budget, theme, guest count). OOP: Inheritance · Polymorphism · Encapsulation.</p>
                        <a href="/register" class="btn btn-card text-white" style="background:linear-gradient(135deg,#4776E6,#8E54E9)">Access Portal →</a>
                    </div>
                </div>
            </div>

            <!-- Component 2: Vendor Management -->
            <div class="col-md-4">
                <div class="comp-card">
                    <div class="card-accent" style="background: linear-gradient(90deg, #f953c6, #b91d73);"></div>
                    <div class="p-4">
                        <div class="card-icon" style="background: rgba(249,83,198,0.1);">
                            <span style="color:#b91d73; font-size:1.4rem">🏪</span>
                        </div>
                        <span class="tag-crud mb-2 d-inline-block">CREATE · READ · UPDATE · DELETE</span>
                        <h5>Component 2 — Vendor Management</h5>
                        <p>Register venues, photographers &amp; caterers. Filter by category. OOP: Abstraction (calculatePricing) · Inheritance (VenueVendor, PhotographyVendor, CateringVendor).</p>
                        <a href="/vendors" class="btn btn-card text-white" style="background:linear-gradient(135deg,#f953c6,#b91d73)">Browse Vendors →</a>
                    </div>
                </div>
            </div>

            <!-- Component 3: Booking & Payment -->
            <div class="col-md-4">
                <div class="comp-card">
                    <div class="card-accent" style="background: linear-gradient(90deg, #f0c040, #d4a017);"></div>
                    <div class="p-4">
                        <div class="card-icon" style="background: rgba(240,192,64,0.12);">
                            <span style="font-size:1.4rem">📅</span>
                        </div>
                        <span class="tag-crud mb-2 d-inline-block">CREATE · READ · UPDATE · DELETE</span>
                        <h5>Component 3 — Booking &amp; Payment</h5>
                        <p>Send booking requests, track status (PENDING → CONFIRMED), process payments. Confirming payment auto-updates booking status. OOP: Encapsulation · Abstraction.</p>
                        <a href="/bookings" class="btn btn-card" style="background:linear-gradient(135deg,#f0c040,#d4a017);color:#1a1a2e;">View Bookings →</a>
                    </div>
                </div>
            </div>

            <!-- Component 4: Wedding Planning Tools -->
            <div class="col-md-4">
                <div class="comp-card">
                    <div class="card-accent" style="background: linear-gradient(90deg, #11998e, #38ef7d);"></div>
                    <div class="p-4">
                        <div class="card-icon" style="background: rgba(17,153,142,0.1);">
                            <span style="color:#11998e; font-size:1.4rem">📋</span>
                        </div>
                        <span class="tag-crud mb-2 d-inline-block">CREATE · READ · UPDATE · DELETE</span>
                        <h5>Component 4 — Wedding Planning Tools</h5>
                        <p>Interactive checklist with progress tracking, budget tracker (estimated vs actual), and guest list with RSVP management. OOP: Encapsulation · Association.</p>
                        <a href="/planning/checklist" class="btn btn-card text-white" style="background:linear-gradient(135deg,#11998e,#38ef7d);color:#1a1a2e!important;">Open Planner →</a>
                    </div>
                </div>
            </div>

            <!-- Component 5: Reviews & Ratings -->
            <div class="col-md-4">
                <div class="comp-card">
                    <div class="card-accent" style="background: linear-gradient(90deg, #f7971e, #ffd200);"></div>
                    <div class="p-4">
                        <div class="card-icon" style="background: rgba(247,151,30,0.1);">
                            <span style="color:#f7971e; font-size:1.4rem">⭐</span>
                        </div>
                        <span class="tag-crud mb-2 d-inline-block">CREATE · READ · UPDATE · DELETE</span>
                        <h5>Component 5 — Reviews &amp; Ratings</h5>
                        <p>Rate vendors 1–5 stars, write reviews, sort by rating or date. Two review types: Verified (editable) &amp; Public (final). OOP: Inheritance · Abstraction (canEdit()).</p>
                        <a href="/reviews" class="btn btn-card" style="background:linear-gradient(135deg,#f7971e,#ffd200);color:#1a1a2e;">View Reviews →</a>
                    </div>
                </div>
            </div>

            <!-- Component 6: Admin Dashboard -->
            <div class="col-md-4">
                <div class="comp-card">
                    <div class="card-accent" style="background: linear-gradient(90deg, #1a1a2e, #4776E6);"></div>
                    <div class="p-4">
                        <div class="card-icon" style="background: rgba(26,26,46,0.08);">
                            <span style="color:#1a1a2e; font-size:1.4rem">📊</span>
                        </div>
                        <span class="tag-crud mb-2 d-inline-block">READ · UPDATE · DELETE</span>
                        <h5>Component 6 — Admin Dashboard</h5>
                        <p>Platform-wide analytics: total users, vendors, bookings, revenue. Manage and delete users, vendors &amp; reviews. Cross-component data aggregation. OOP: Encapsulation.</p>
                        <a href="/admin" class="btn btn-card text-white" style="background:linear-gradient(135deg,#1a1a2e,#4776E6)">Admin Panel →</a>
                    </div>
                </div>
            </div>

        </div>

        <!-- OOP Link -->
        <div class="text-center mt-5">
            <a href="/oop" class="btn btn-outline-dark rounded-pill px-4 py-2 fw-600">
                <i class="bi bi-diagram-3 me-2"></i>View OOP Concepts Used in This Project
            </a>
        </div>
    </div>
</section>

<!-- ===== FOOTER ===== -->
<footer class="py-4 mt-4">
    <div class="container text-center">
        <p class="mb-0">© 2026 <span class="gold">Tie The Tech (TTT)</span> — SE1020 Object Oriented Programming Project</p>
        <p class="mt-1 mb-0">Built with Spring Boot · JPA · MySQL · Bootstrap 5</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
