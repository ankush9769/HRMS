<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HRMS - Employee Dashboard</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/glass.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body class="glass-body">
<nav class="glass-navbar">
    <div class="glass-navbar-inner">
        <a class="glass-brand" href="index.jsp">
            <span class="glass-brand-mark"><i class="bi bi-people-fill"></i></span>
            HRMS
        </a>
        <div class="glass-nav-links">
            <a class="glass-nav-link" href="leave"><i class="bi bi-calendar-check"></i> Leave</a>
            <a class="glass-nav-link" href="documents"><i class="bi bi-folder2-open"></i> Documents</a>
            <a class="glass-nav-link active" href="profile"><i class="bi bi-person-badge"></i> Profile</a>
            <a class="glass-nav-link" href="SignOut"><i class="bi bi-box-arrow-right"></i> Sign Out</a>
        </div>
    </div>
</nav>

<main class="glass-page">
    <%
        String name = (String) session.getAttribute("name_key");
        if(name == null) name = "Employee";
    %>
    <section class="glass-hero">
        <div class="glass-hero-grid">
            <div>
                <div class="glass-kicker"><i class="bi bi-person-workspace"></i> Employee workspace</div>
                <h1 class="glass-title">Welcome back, <span><%= name %></span></h1>
                <p class="glass-subtitle">Manage profile, leaves, documents, attendance, payroll, and other employee operations from one polished portal.</p>
                <div class="glass-actions">
                    <a class="glass-btn" href="leave"><i class="bi bi-calendar-check"></i> Leave</a>
                    <a class="glass-btn glass-btn-secondary" href="documents"><i class="bi bi-folder2-open"></i> Documents</a>
                </div>
            </div>
            <div class="glass-hero-side">
                <div class="glass-chip-row">
                    <span class="glass-chip"><i class="bi bi-clock-history"></i> Quick access</span>
                    <span class="glass-chip"><i class="bi bi-person-badge"></i> Personal profile</span>
                    <span class="glass-chip"><i class="bi bi-shield-check"></i> Secure portal</span>
                </div>
            </div>
        </div>
    </section>
</main>
</body>
</html>