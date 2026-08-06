<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Leave" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HRMS | Admin Dashboard</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/glass.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body class="glass-body">
<nav class="glass-navbar">
    <div class="glass-navbar-inner">
        <a class="glass-brand" href="adminDashboard">
            <span class="glass-brand-mark"><i class="bi bi-people-fill"></i></span>
            HRMS Admin
        </a>
        <div class="glass-nav-links">
            <a class="glass-nav-link active" href="adminDashboard"><i class="bi bi-speedometer2"></i> Dashboard</a>
            <a class="glass-nav-link" href="leave"><i class="bi bi-calendar-check"></i> Leave</a>
            <a class="glass-nav-link" href="documents"><i class="bi bi-folder2-open"></i> Documents</a>
            <a class="glass-nav-link" href="employee"><i class="bi bi-people"></i> Employees</a>
            <a class="glass-nav-link" href="SignOut"><i class="bi bi-box-arrow-right"></i> Sign Out</a>
        </div>
    </div>
</nav>

<main class="glass-page">
    <%
        String name=(String)session.getAttribute("name_key");
        if(name==null) name="Administrator";
        List<Leave> leaves=(List<Leave>)request.getAttribute("leaves");
        int totalLeaves=0;
        int pendingLeaves=0;
        int approvedLeaves=0;
        int rejectedLeaves=0;
        if(leaves!=null){
            for(Leave leave : leaves){
                totalLeaves++;
                if("APPROVED".equalsIgnoreCase(leave.getStatus())){
                    approvedLeaves++;
                }else if("REJECTED".equalsIgnoreCase(leave.getStatus())){
                    rejectedLeaves++;
                }else{
                    pendingLeaves++;
                }
            }
        }
    %>

    <section class="glass-hero">
        <div class="glass-hero-grid">
            <div>
                <div class="glass-kicker"><i class="bi bi-stars"></i> Enterprise operations center</div>
                <h1 class="glass-title">Welcome back, <span><%= name %></span></h1>
                <p class="glass-subtitle">Track leave approvals, manage employee accounts, and review document activity from a premium glass workspace tailored for HR teams.</p>
                <div class="glass-actions">
                    <a class="glass-btn" href="leave"><i class="bi bi-calendar-plus"></i> Review Leave</a>
                    <a class="glass-btn glass-btn-secondary" href="employee"><i class="bi bi-person-plus"></i> Manage Employees</a>
                </div>
            </div>
            <div class="glass-hero-side">
                <div class="glass-chip-row">
                    <span class="glass-chip"><i class="bi bi-shield-check"></i> Secure access</span>
                    <span class="glass-chip"><i class="bi bi-lightning-charge"></i> Fast decisions</span>
                    <span class="glass-chip"><i class="bi bi-layout-text-window-reverse"></i> Unified view</span>
                </div>
                <div class="stats-grid" style="margin-top:0;">
                    <div class="stat-card">
                        <div class="glass-icon-badge"><i class="bi bi-inbox"></i></div>
                        <div class="stat-label">Total Requests</div>
                        <div class="stat-value"><%= totalLeaves %></div>
                        <div class="stat-trend">Live leave queue</div>
                    </div>
                    <div class="stat-card">
                        <div class="glass-icon-badge"><i class="bi bi-hourglass-split"></i></div>
                        <div class="stat-label">Pending</div>
                        <div class="stat-value"><%= pendingLeaves %></div>
                        <div class="stat-trend">Awaiting action</div>
                    </div>
                    <div class="stat-card">
                        <div class="glass-icon-badge"><i class="bi bi-check2-circle"></i></div>
                        <div class="stat-label">Approved</div>
                        <div class="stat-value"><%= approvedLeaves %></div>
                        <div class="stat-trend">Completed workflows</div>
                    </div>
                    <div class="stat-card">
                        <div class="glass-icon-badge"><i class="bi bi-x-circle"></i></div>
                        <div class="stat-label">Rejected</div>
                        <div class="stat-value"><%= rejectedLeaves %></div>
                        <div class="stat-trend">Requires review</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="glass-section">
        <div class="glass-grid">
            <div class="glass-card-link" style="grid-column: span 4;">
                <a href="leave" class="glass-card">
                    <div class="glass-card-title"><span class="glass-icon-badge"><i class="bi bi-calendar-check"></i></span> Leave</div>
                    <p class="glass-small glass-meta">Review requests, approvals, and timelines in one place.</p>
                </a>
            </div>
            <div class="glass-card-link" style="grid-column: span 4;">
                <a href="documents" class="glass-card">
                    <div class="glass-card-title"><span class="glass-icon-badge"><i class="bi bi-folder2-open"></i></span> Documents</div>
                    <p class="glass-small glass-meta">Access secure files and supporting records instantly.</p>
                </a>
            </div>
            <div class="glass-card-link" style="grid-column: span 4;">
                <a href="employee" class="glass-card">
                    <div class="glass-card-title"><span class="glass-icon-badge"><i class="bi bi-people"></i></span> Employees</div>
                    <p class="glass-small glass-meta">Manage employee records and onboarding details.</p>
                </a>
            </div>
        </div>
    </section>

    <section class="glass-section">
        <div style="display:flex;align-items:flex-end;justify-content:space-between;gap:16px;margin-bottom:16px;">
            <div>
                <div class="glass-kicker"><i class="bi bi-clock-history"></i> Live feed</div>
                <h2 style="margin:12px 0 0;font-size:1.65rem;letter-spacing:-0.03em;">Recent Leave Requests</h2>
            </div>
            <a class="glass-nav-link" href="leave"><i class="bi bi-arrow-right"></i> View all</a>
        </div>

        <div class="glass-table-wrap">
            <table class="glass-table">
                <thead>
                    <tr>
                        <th>Employee</th>
                        <th>Type</th>
                        <th>Dates</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    if(leaves!=null&&!leaves.isEmpty()){
                        for(Leave leave:leaves){
                %>
                    <tr>
                        <td><strong><%= leave.getUser_name() %></strong></td>
                        <td><%= leave.getType() %></td>
                        <td><%= leave.getStartDate() %> to <%= leave.getEndDate() %></td>
                        <td>
                            <span class="status-badge <%= "APPROVED".equalsIgnoreCase(leave.getStatus())?"status-approved":"REJECTED".equalsIgnoreCase(leave.getStatus())?"status-rejected":"status-pending" %>">
                                <%= leave.getStatus() %>
                            </span>
                        </td>
                    </tr>
                <%
                        }
                    }else{
                %>
                    <tr>
                        <td colspan="4" class="glass-empty">No leave requests found.</td>
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