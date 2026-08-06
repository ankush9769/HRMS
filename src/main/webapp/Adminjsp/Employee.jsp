<%@ page import="java.util.*" %>
<%@ page import="model.User" %>

<%
List<User> employees = (List<User>)request.getAttribute("employees");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Employee - HRMS</title>
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
            <a class="glass-nav-link active" href="employee"><i class="bi bi-people"></i> Employee</a>
            <a class="glass-nav-link" href="SignOut"><i class="bi bi-box-arrow-right"></i> Sign Out</a>
        </div>
    </div>
</nav>

<main class="glass-page">
    <section class="glass-hero">
        <div class="glass-hero-grid">
            <div>
                <div class="glass-kicker"><i class="bi bi-person-plus"></i> Employee management</div>
                <h1 class="glass-title">Add and review <span>employees</span></h1>
                <p class="glass-subtitle">Use the same employee creation flow while upgrading the form, spacing, table, and responsiveness to a premium glass dashboard style.</p>
            </div>
            <div class="glass-hero-side">
                <div class="glass-chip-row">
                    <span class="glass-chip"><i class="bi bi-shield-check"></i> Secure records</span>
                    <span class="glass-chip"><i class="bi bi-layout-text-window-reverse"></i> Clean list</span>
                    <span class="glass-chip"><i class="bi bi-person-vcard"></i> HR ready</span>
                </div>
            </div>
        </div>
    </section>

    <section class="glass-section">
        <div class="glass-grid">
            <div style="grid-column: span 5;">
                <div class="glass-form-card">
                    <div class="glass-card-title"><span class="glass-icon-badge"><i class="bi bi-person-plus-fill"></i></span> Add employee</div>
                    <form action="AddEmployee" method="post">
                        <div class="glass-field" style="margin-bottom:16px;">
                            <label>Employee Name</label>
                            <input type="text" class="glass-control" name="name" required>
                        </div>
                        <div class="glass-field" style="margin-bottom:16px;">
                            <label>Work Email</label>
                            <input type="email" class="glass-control" name="email" required>
                        </div>
                        <div class="glass-field" style="margin-bottom:20px;">
                            <label>Department</label>
                            <select class="glass-control" name="department">
                                <option>Human Resources</option>
                                <option>Information Technology</option>
                                <option>Finance</option>
                                <option>Marketing</option>
                                <option>Sales</option>
                                <option>Operations</option>
                            </select>
                        </div>
                        <button class="glass-btn" style="width:100%;"><i class="bi bi-person-plus"></i> Add Employee</button>
                    </form>
                </div>
            </div>
            <div style="grid-column: span 7;">
                <div class="glass-panel upload-dropzone">
                    <span class="glass-icon-badge"><i class="bi bi-people"></i></span>
                    <strong>Employee directory overview</strong>
                    <p>Review employee records in a glass table below. The backend list and add workflow remain untouched.</p>
                </div>
            </div>
        </div>
    </section>

    <section class="glass-section">
        <div class="glass-table-wrap">
            <table class="glass-table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Department</th>
                        <th>Role</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    if(employees != null){
                        for(User user : employees){
                %>
                    <tr>
                        <td><strong><%= user.getName() %></strong></td>
                        <td><%= user.getEmail() %></td>
                        <td><%= user.getDepartment() %></td>
                        <td><span class="status-badge status-info"><%= user.getRole() %></span></td>
                    </tr>
                <%
                        }
                    }else{
                %>
                    <tr>
                        <td colspan="4" class="glass-empty">No Employees Found</td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </section>
</main>
</body>
</html>