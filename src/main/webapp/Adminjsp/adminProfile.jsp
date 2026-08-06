<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HRMS - Human Resource Management System</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/glass.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body class="glass-body">
<nav class="glass-navbar">
    <div class="glass-navbar-inner">
        <a class="glass-brand" href="index.jsp">
            <span class="glass-brand-mark"><i class="bi bi-people-fill"></i></span>
            HRMS Admin
        </a>
        <div class="glass-nav-links">
            <a class="glass-nav-link" href="adminDashboard"><i class="bi bi-speedometer2"></i> Dashboard</a>
            <a class="glass-nav-link" href="leave"><i class="bi bi-calendar-check"></i> Leave</a>
            <a class="glass-nav-link" href="documents"><i class="bi bi-folder2-open"></i> Documents</a>
            <a class="glass-nav-link active" href="employee"><i class="bi bi-people"></i> Employees</a>
            <a class="glass-nav-link" href="SignOut"><i class="bi bi-box-arrow-right"></i> Sign Out</a>
        </div>
    </div>
</nav>

<main class="glass-page">
    <%
        String name = (String) session.getAttribute("name_key");
        if(name == null) name = "Administrator";
    %>
    <section class="glass-hero">
        <div class="glass-hero-grid">
            <div>
                <div class="glass-kicker"><i class="bi bi-person-badge"></i> Admin profile</div>
                <h1 class="glass-title">Welcome back, <span><%= name %></span></h1>
                <p class="glass-subtitle">Manage employees, leave, and document operations from a focused enterprise control surface with premium depth and spacing.</p>
                <div class="glass-actions">
                    <a class="glass-btn" href="adminDashboard"><i class="bi bi-speedometer2"></i> Open dashboard</a>
                    <a class="glass-btn glass-btn-secondary" href="employee"><i class="bi bi-people"></i> Employee list</a>
                </div>
            </div>
            <div class="glass-hero-side">
                <div class="glass-panel">
                    <div class="profile-avatar" style="width:84px;height:84px;border-radius:26px;"><%= name.substring(0,1).toUpperCase() %></div>
                    <div class="profile-meta" style="margin-top:14px;">
                        <h2 style="margin:0;">Administrator</h2>
                        <p>HRMS operations manager</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
</body>
</html>