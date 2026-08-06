<%@ page import="java.util.*" %>
<%@ page import="model.Leave" %>

<%
List<Leave> leaves = (List<Leave>)request.getAttribute("leaves");
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page import="java.util.*" %>
    <%@ page import="model.Leave" %>

    <%
    int totalLeaves = leaves == null ? 0 : leaves.size();
    int pendingLeaves = 0;
    int approvedLeaves = 0;
    int rejectedLeaves = 0;
    if (leaves != null) {
        for (Leave leave : leaves) {
            if ("APPROVED".equalsIgnoreCase(leave.getStatus())) {
                approvedLeaves++;
            } else if ("REJECTED".equalsIgnoreCase(leave.getStatus())) {
                rejectedLeaves++;
            } else {
                pendingLeaves++;
            }
        }
    }
    %>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>HRMS | Leave Management</title>
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
                <a class="glass-nav-link active" href="leave"><i class="bi bi-calendar-check"></i> Leave</a>
                <a class="glass-nav-link" href="documents"><i class="bi bi-folder2-open"></i> Documents</a>
                <a class="glass-nav-link" href="employee"><i class="bi bi-people"></i> Employees</a>
                <a class="glass-nav-link" href="SignOut"><i class="bi bi-box-arrow-right"></i> Sign Out</a>
            </div>
        </div>
    </nav>

    <main class="glass-page">
        <section class="glass-hero">
            <div class="glass-hero-grid">
                <div>
                    <div class="glass-kicker"><i class="bi bi-calendar-heart"></i> Leave control tower</div>
                    <h1 class="glass-title">Leave approvals <span>with clarity</span></h1>
                    <p class="glass-subtitle">Review requests, approve or reject submissions, and keep the queue visually organized with premium glass cards and readable status states.</p>
                    <div class="glass-actions">
                        <a class="glass-btn" href="#request-form"><i class="bi bi-pencil-square"></i> New request</a>
                        <a class="glass-btn glass-btn-secondary" href="#leave-table"><i class="bi bi-list-check"></i> Open queue</a>
                    </div>
                </div>
                <div class="glass-hero-side">
                    <div class="stats-grid" style="margin-top:0;">
                        <div class="stat-card">
                            <div class="glass-icon-badge"><i class="bi bi-inbox"></i></div>
                            <div class="stat-label">Total</div>
                            <div class="stat-value"><%= totalLeaves %></div>
                            <div class="stat-trend">Current leave requests</div>
                        </div>
                        <div class="stat-card">
                            <div class="glass-icon-badge"><i class="bi bi-hourglass-split"></i></div>
                            <div class="stat-label">Pending</div>
                            <div class="stat-value"><%= pendingLeaves %></div>
                            <div class="stat-trend">Needs review</div>
                        </div>
                        <div class="stat-card">
                            <div class="glass-icon-badge"><i class="bi bi-check2-circle"></i></div>
                            <div class="stat-label">Approved</div>
                            <div class="stat-value"><%= approvedLeaves %></div>
                            <div class="stat-trend">Completed</div>
                        </div>
                        <div class="stat-card">
                            <div class="glass-icon-badge"><i class="bi bi-x-circle"></i></div>
                            <div class="stat-label">Rejected</div>
                            <div class="stat-value"><%= rejectedLeaves %></div>
                            <div class="stat-trend">Not approved</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="request-form" class="glass-section">
            <div class="glass-form-card">
                <div class="glass-card-title"><span class="glass-icon-badge"><i class="bi bi-calendar-plus"></i></span> Apply leave</div>
                <form action="ApplyLeave" method="post">
                    <div class="glass-form-grid">
                        <div class="glass-field" style="grid-column: span 6;">
                            <label>Leave Type</label>
                            <select class="glass-control" name="type" required>
                                <option selected disabled>Select Leave Type</option>
                                <option value="CASUAL">Casual Leave</option>
                                <option value="SICK">Sick Leave</option>
                                <option value="PAID">Paid Leave</option>
                                <option value="UNPAID">Unpaid Leave</option>
                            </select>
                        </div>
                        <div class="glass-field" style="grid-column: span 3;">
                            <label>Start Date</label>
                            <input type="date" class="glass-control" name="startDate" required>
                        </div>
                        <div class="glass-field" style="grid-column: span 3;">
                            <label>End Date</label>
                            <input type="date" class="glass-control" name="endDate" required>
                        </div>
                        <div class="glass-field" style="grid-column: span 12;">
                            <label>Reason</label>
                            <textarea class="glass-control glass-textarea" name="reason" rows="4" placeholder="Enter reason for leave..." required></textarea>
                        </div>
                    </div>
                    <div class="glass-actions" style="margin-top:18px;">
                        <button class="glass-btn" type="submit"><i class="bi bi-send"></i> Submit Request</button>
                    </div>
                </form>
            </div>
        </section>

        <section id="leave-table" class="glass-section">
            <div class="glass-table-wrap">
                <table class="glass-table">
                    <thead>
                        <tr>
                            <th>Employee Name</th>
                            <th>Leave Type</th>
                            <th>Duration</th>
                            <th>Reason</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        if(leaves != null && !leaves.isEmpty()){
                            for(Leave leave : leaves){
                        %>
                        <tr>
                            <td><strong><%= leave.getUser_name() %></strong></td>
                            <td><%= leave.getType() %></td>
                            <td><%= leave.getStartDate() %> to <%= leave.getEndDate() %></td>
                            <td><%= leave.getReason() %></td>
                            <td>
                                <span class="status-badge <%= "APPROVED".equalsIgnoreCase(leave.getStatus())?"status-approved":"REJECTED".equalsIgnoreCase(leave.getStatus())?"status-rejected":"status-pending" %>">
                                    <%= leave.getStatus() %>
                                </span>
                            </td>
                            <td>
                                <div class="glass-actions" style="margin-top:0;">
                                    <a href="ApproveLeave?id=<%= leave.getId() %>" class="glass-btn glass-btn-success"><i class="bi bi-check2"></i> Approve</a>
                                    <a href="RejectLeave?id=<%= leave.getId() %>" class="glass-btn glass-btn-danger"><i class="bi bi-x"></i> Reject</a>
                                </div>
                            </td>
                        </tr>
                        <%
                            }
                        }else{
                        %>
                        <tr>
                            <td colspan="6" class="glass-empty">No Leave Requests Found</td>
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