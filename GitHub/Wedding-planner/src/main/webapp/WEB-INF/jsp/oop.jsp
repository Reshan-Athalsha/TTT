<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OOP Concepts — Tie The Tech</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&family=Fira+Code:wght@400;500&display=swap" rel="stylesheet">
    <style>
        * { font-family: 'Inter', sans-serif; }
        body { background: #f5f4f0; }
        .ttt-navbar { background: linear-gradient(135deg, #1a1a2e, #16213e); padding: 14px 0; box-shadow: 0 2px 20px rgba(0,0,0,0.25); }
        .ttt-navbar .navbar-brand { color: #f0c040 !important; font-weight: 800; }
        .ttt-navbar .nav-link { color: rgba(255,255,255,0.7) !important; font-weight: 500; }
        .ttt-navbar .nav-link:hover { color: #f0c040 !important; }
        .hero { background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%); padding: 60px 0; }
        .hero h1 { color: #f0c040; font-weight: 800; font-size: 2.5rem; }
        .hero p { color: rgba(255,255,255,0.65); max-width: 600px; }
        .concept-card { background: white; border-radius: 16px; border: none; box-shadow: 0 4px 20px rgba(0,0,0,0.07); margin-bottom: 24px; overflow: hidden; transition: transform 0.2s; }
        .concept-card:hover { transform: translateY(-3px); }
        .concept-accent { height: 4px; }
        .concept-body { padding: 28px; }
        .concept-icon { width: 56px; height: 56px; border-radius: 14px; display: flex; align-items: center; justify-content: center; font-size: 1.6rem; margin-bottom: 14px; }
        .concept-title { font-weight: 800; font-size: 1.15rem; color: #1a1a2e; margin-bottom: 6px; }
        .concept-desc { color: #666; font-size: 0.9rem; line-height: 1.7; margin-bottom: 16px; }
        .where-used { background: #f8f8f8; border-radius: 10px; padding: 12px 16px; }
        .where-used strong { font-size: 0.8rem; color: #888; display: block; margin-bottom: 6px; text-transform: uppercase; letter-spacing: 0.5px; }
        .tag { display: inline-block; background: #f0f0f0; color: #444; border-radius: 6px; padding: 3px 10px; font-size: 0.78rem; font-weight: 600; margin: 2px; }
        .code-block { background: #1a1a2e; border-radius: 10px; padding: 16px 20px; margin-top: 14px; font-family: 'Fira Code', monospace; font-size: 0.82rem; color: #f0c040; line-height: 1.7; overflow-x: auto; }
        .code-block .cm { color: rgba(255,255,255,0.4); }
        .code-block .kw { color: #c792ea; }
        .code-block .cl { color: #82aaff; }
        .code-block .st { color: #c3e88d; }
        .code-block .an { color: #f0c040; }
        .section-heading { font-weight: 800; font-size: 1.8rem; color: #1a1a2e; }
        .marks-card { background: linear-gradient(135deg, #1a1a2e, #16213e); border-radius: 16px; padding: 32px; color: white; }
        .marks-card h4 { color: #f0c040; font-weight: 800; }
        .mark-row { display: flex; justify-content: space-between; align-items: center; padding: 10px 0; border-bottom: 1px solid rgba(255,255,255,0.08); }
        .mark-row:last-child { border-bottom: none; }
        .mark-label { color: rgba(255,255,255,0.7); font-size: 0.9rem; }
        .mark-val { color: #f0c040; font-weight: 700; }
    </style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg ttt-navbar">
    <div class="container">
        <a class="navbar-brand" href="/">💍 Tie The Tech</a>
        <div class="navbar-nav ms-auto align-items-center gap-2">
            <a class="nav-link" href="/"><i class="bi bi-house me-1"></i>Home</a>
            <a class="nav-link" href="/bookings"><i class="bi bi-calendar-check me-1"></i>Bookings</a>
            <a class="nav-link" href="/payments"><i class="bi bi-credit-card me-1"></i>Payments</a>
            <% if (session.getAttribute("userId") != null) { %>
                <a class="nav-link" href="/profile"><i class="bi bi-person-circle me-1"></i><%= session.getAttribute("userName") %></a>
                <a href="/logout" class="nav-link" style="color:rgba(255,255,255,0.7)!important">Logout</a>
            <% } else { %>
                <a href="/login" class="nav-link">Login</a>
            <% } %>
        </div>
    </div>
</nav>

<!-- HERO -->
<div class="hero">
    <div class="container text-center">
        <div style="font-size:3rem; margin-bottom:16px">🎓</div>
        <h1>OOP Concepts in TTT</h1>
        <p class="mx-auto mt-3">How our Wedding Planner system demonstrates all 5 Object-Oriented Programming principles from SE1020 — with real code examples.</p>
    </div>
</div>

<div class="container py-5">
    <div class="row">
        <div class="col-lg-8">

            <h2 class="section-heading mb-4">The 5 OOP Principles</h2>

            <!-- 1. ENCAPSULATION -->
            <div class="concept-card">
                <div class="concept-accent" style="background: linear-gradient(90deg,#4776E6,#8E54E9)"></div>
                <div class="concept-body">
                    <div class="concept-icon" style="background:rgba(71,118,230,0.1)">🔒</div>
                    <div class="concept-title">1. Encapsulation</div>
                    <div class="concept-desc">
                        All data fields in every model class are declared <code>private</code>. External code can only read or modify data through controlled <code>public</code> getter and setter methods. This prevents direct, uncontrolled access to internal state.
                    </div>
                    <div class="where-used">
                        <strong>Where it's used</strong>
                        <span class="tag">User.java</span>
                        <span class="tag">Booking.java</span>
                        <span class="tag">Payment.java</span>
                        <span class="tag">Client.java</span>
                    </div>
                    <div class="code-block">
<span class="cm">// All fields are private — nobody can access them directly</span>
<span class="kw">private</span> String userId;
<span class="kw">private</span> String name;
<span class="kw">private</span> String email;

<span class="cm">// Controlled access via public getter/setter (Encapsulation)</span>
<span class="kw">public</span> String <span class="cl">getName</span>() { <span class="kw">return</span> name; }
<span class="kw">public void</span> <span class="cl">setName</span>(String name) { <span class="kw">this</span>.name = name; }
                    </div>
                </div>
            </div>

            <!-- 2. INHERITANCE -->
            <div class="concept-card">
                <div class="concept-accent" style="background: linear-gradient(90deg,#f0c040,#d4a017)"></div>
                <div class="concept-body">
                    <div class="concept-icon" style="background:rgba(240,192,64,0.12)">🧬</div>
                    <div class="concept-title">2. Inheritance</div>
                    <div class="concept-desc">
                        The <code>Client</code> class <strong>inherits</strong> all properties and methods from the abstract <code>User</code> class using the <code>extends</code> keyword. This avoids code duplication — <code>Client</code> gets <code>name</code>, <code>email</code>, <code>password</code>, and all getters/setters for free.
                    </div>
                    <div class="where-used">
                        <strong>Where it's used</strong>
                        <span class="tag">Client extends User</span>
                        <span class="tag">super() constructor call</span>
                    </div>
                    <div class="code-block">
<span class="cm">// Client INHERITS everything from User</span>
<span class="kw">public class</span> <span class="cl">Client</span> <span class="kw">extends</span> <span class="cl">User</span> {

    <span class="kw">public</span> <span class="cl">Client</span>(String userId, String name, String email, String password) {
        <span class="cm">// Calls parent constructor — inheriting all fields</span>
        <span class="kw">super</span>(userId, name, email, password, <span class="st">"CLIENT"</span>);
    }
}
                    </div>
                </div>
            </div>

            <!-- 3. POLYMORPHISM -->
            <div class="concept-card">
                <div class="concept-accent" style="background: linear-gradient(90deg,#11998e,#38ef7d)"></div>
                <div class="concept-body">
                    <div class="concept-icon" style="background:rgba(17,153,142,0.1)">🔄</div>
                    <div class="concept-title">3. Polymorphism</div>
                    <div class="concept-desc">
                        The abstract method <code>displayRoleDetails()</code> is declared in <code>User</code> and overridden in <code>Client</code>. A <code>User</code> reference can hold a <code>Client</code> object, and the correct subclass method is called at runtime. This is also demonstrated in <code>toFileString()</code> from the interface.
                    </div>
                    <div class="where-used">
                        <strong>Where it's used</strong>
                        <span class="tag">displayRoleDetails() override</span>
                        <span class="tag">User ref = new Client()</span>
                        <span class="tag">toFileString() interface</span>
                    </div>
                    <div class="code-block">
<span class="cm">// Polymorphism: User reference holds a Client object</span>
<span class="cl">User</span> newClient = <span class="kw">new</span> <span class="cl">Client</span>(userId, name, email, password);

<span class="cm">// @Override in Client — different behaviour for same method</span>
<span class="an">@Override</span>
<span class="kw">public void</span> <span class="cl">displayRoleDetails</span>() {
    System.out.println(<span class="st">"This user is a registered CLIENT."</span>);
}
                    </div>
                </div>
            </div>

            <!-- 4. ABSTRACTION -->
            <div class="concept-card">
                <div class="concept-accent" style="background: linear-gradient(90deg,#f953c6,#b91d73)"></div>
                <div class="concept-body">
                    <div class="concept-icon" style="background:rgba(249,83,198,0.1)">🎭</div>
                    <div class="concept-title">4. Abstraction</div>
                    <div class="concept-desc">
                        The <code>User</code> class is declared <code>abstract</code> — it cannot be instantiated directly. It defines the blueprint that concrete subclasses must follow. The <code>FileOperations</code> interface further abstracts the concept of serialization into a contract.
                    </div>
                    <div class="where-used">
                        <strong>Where it's used</strong>
                        <span class="tag">abstract class User</span>
                        <span class="tag">abstract displayRoleDetails()</span>
                        <span class="tag">FileOperations interface</span>
                    </div>
                    <div class="code-block">
<span class="cm">// Abstract class — cannot do: new User()</span>
<span class="kw">public abstract class</span> <span class="cl">User</span> <span class="kw">implements</span> <span class="cl">FileOperations</span> {

    <span class="cm">// Abstract method — subclasses MUST implement this</span>
    <span class="kw">public abstract void</span> <span class="cl">displayRoleDetails</span>();
}

<span class="cm">// Interface — defines a contract</span>
<span class="kw">public interface</span> <span class="cl">FileOperations</span> {
    String <span class="cl">toFileString</span>(); <span class="cm">// Must be implemented</span>
}
                    </div>
                </div>
            </div>

            <!-- 5. INFORMATION HIDING -->
            <div class="concept-card">
                <div class="concept-accent" style="background: linear-gradient(90deg,#373B44,#4286f4)"></div>
                <div class="concept-body">
                    <div class="concept-icon" style="background:rgba(66,134,244,0.1)">🛡️</div>
                    <div class="concept-title">5. Information Hiding</div>
                    <div class="concept-desc">
                        Internal implementation details are hidden from the rest of the system. For example, <em>how</em> data is saved to the database is hidden inside the Repository layer — the Controller only calls <code>save()</code> without knowing the SQL. The password field is never exposed in JSP views.
                    </div>
                    <div class="where-used">
                        <strong>Where it's used</strong>
                        <span class="tag">JPA Repository hides SQL</span>
                        <span class="tag">private fields</span>
                        <span class="tag">session attributes</span>
                    </div>
                    <div class="code-block">
<span class="cm">// Controller doesn't know HOW data is saved (hidden)</span>
clientRepository.<span class="cl">save</span>(client); <span class="cm">// SQL is hidden inside JPA</span>

<span class="cm">// Password is private — never directly accessible</span>
<span class="kw">private</span> String password; <span class="cm">// Hidden from outside world</span>
                    </div>
                </div>
            </div>

        </div>

        <!-- RIGHT SIDEBAR -->
        <div class="col-lg-4">

            <!-- Marks Card -->
            <div class="marks-card mb-4">
                <h4 class="mb-4"><i class="bi bi-award me-2"></i>Marks Breakdown</h4>
                <div class="mark-row"><span class="mark-label">CRUD Operations</span><span class="mark-val">30 marks</span></div>
                <div class="mark-row"><span class="mark-label">OOP Concepts</span><span class="mark-val">20 marks</span></div>
                <div class="mark-row"><span class="mark-label">DB / File Handling</span><span class="mark-val">10 marks</span></div>
                <div class="mark-row"><span class="mark-label">UI Design</span><span class="mark-val">10 marks</span></div>
                <div class="mark-row"><span class="mark-label">GitHub Commits</span><span class="mark-val">10 marks</span></div>
                <div class="mark-row"><span class="mark-label">Presentation/Viva</span><span class="mark-val">10 marks</span></div>
                <div class="mark-row"><span class="mark-label">Documentation</span><span class="mark-val">10 marks</span></div>
                <hr style="border-color:rgba(255,255,255,0.15);margin:16px 0">
                <div class="mark-row"><span class="mark-label fw-700" style="color:white">Total</span><span class="mark-val" style="font-size:1.2rem">100 marks</span></div>
            </div>

            <!-- Class Summary Card -->
            <div class="card p-4 mb-4">
                <h6 class="fw-800 mb-3" style="color:#1a1a2e;border-left:4px solid #f0c040;padding-left:10px">Class Structure</h6>
                <div style="font-size:0.85rem;line-height:2;">
                    <div>📦 <strong>model/</strong></div>
                    <div class="ms-3">↳ <code>User.java</code> (abstract)</div>
                    <div class="ms-3">↳ <code>Client.java</code> extends User</div>
                    <div class="ms-3">↳ <code>Booking.java</code></div>
                    <div class="ms-3">↳ <code>Payment.java</code></div>
                    <div>📦 <strong>interfaces/</strong></div>
                    <div class="ms-3">↳ <code>FileOperations.java</code></div>
                    <div>📦 <strong>repository/</strong></div>
                    <div class="ms-3">↳ <code>ClientRepository</code></div>
                    <div class="ms-3">↳ <code>BookingRepository</code></div>
                    <div class="ms-3">↳ <code>PaymentRepository</code></div>
                    <div>📦 <strong>controller/</strong></div>
                    <div class="ms-3">↳ <code>HomeController</code></div>
                    <div class="ms-3">↳ <code>UserController</code></div>
                    <div class="ms-3">↳ <code>BookingController</code></div>
                    <div class="ms-3">↳ <code>PaymentController</code></div>
                </div>
            </div>

            <!-- Tech Stack Card -->
            <div class="card p-4">
                <h6 class="fw-800 mb-3" style="color:#1a1a2e;border-left:4px solid #f0c040;padding-left:10px">Tech Stack</h6>
                <div class="d-flex flex-wrap gap-2">
                    <span class="tag">Java 17</span>
                    <span class="tag">Spring Boot 3.2</span>
                    <span class="tag">Spring Data JPA</span>
                    <span class="tag">Hibernate ORM</span>
                    <span class="tag">MySQL (TTT_db)</span>
                    <span class="tag">JSP + JSTL</span>
                    <span class="tag">Bootstrap 5</span>
                    <span class="tag">Maven</span>
                    <span class="tag">GitHub</span>
                </div>
            </div>

        </div>
    </div>

    <div class="text-center mt-4">
        <a href="/" class="btn btn-dark rounded-pill px-4"><i class="bi bi-arrow-left me-2"></i>Back to Home</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
