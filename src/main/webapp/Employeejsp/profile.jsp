<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>

<%
User user = (User) session.getAttribute("user");
if(user == null){
    response.sendRedirect("../index.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HRMS | Profile</title>
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
    <section class="glass-hero">
        <div class="profile-layout">
            <div class="glass-profile-card">
                <div class="glass-kicker"><i class="bi bi-person-vcard"></i> Employee profile</div>
                <div style="display:flex;align-items:center;gap:18px;margin-top:18px;">
                    <div class="profile-avatar"><%= user.getName().substring(0,1).toUpperCase() %></div>
                    <div class="profile-meta">
                        <h2><%= user.getName() %></h2>
                        <p>Employee Profile</p>
                    </div>
                </div>
                <div class="profile-actions">
<a href="<%=request.getContextPath()%>/Employeejsp/resetPassword.jsp" class="reset-btn">
    Reset Password
</a>                </div>
            </div>

            <div class="glass-panel">
                <div class="glass-card-title"><span class="glass-icon-badge"><i class="bi bi-info-circle"></i></span> Account details</div>
                <div class="profile-grid">
                    <div class="profile-item">
                        <span class="profile-label">Name</span>
                        <span class="profile-value"><%= user.getName() %></span>
                    </div>
                    <div class="profile-item">
                        <span class="profile-label">Email</span>
                        <span class="profile-value"><%= user.getEmail() %></span>
                    </div>
                    <div class="profile-item">
                        <span class="profile-label">Department</span>
                        <span class="profile-value"><%= user.getDepartment() %></span>
                    </div>
                    <div class="profile-item">
                        <span class="profile-label">Role</span>
                        <span class="profile-value"><%= user.getRole() %></span>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
</body>
</html>