<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HRMS | Reset Password</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/glass.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body class="glass-body">
<main class="auth-page">
    <div class="auth-shell" style="grid-template-columns:0.95fr 1.05fr;">
        <section class="glass-hero auth-branding">
            <div class="auth-brand-row">
                <span class="auth-brand-logo"><i class="bi bi-shield-lock"></i></span>
                HRMS
            </div>
            <div class="glass-kicker"><i class="bi bi-key"></i> Security settings</div>
            <h1 class="auth-title" style="margin-top:18px;">Reset your password</h1>
            <p class="auth-subtitle">Update your account password from a premium glass authentication screen designed for focus and clarity.</p>
            <div class="glass-chip-row" style="margin-top:22px;">
                <span class="glass-chip"><i class="bi bi-lock-fill"></i> Secure</span>
                <span class="glass-chip"><i class="bi bi-eye-slash"></i> Private</span>
                <span class="glass-chip"><i class="bi bi-check2-circle"></i> Verified flow</span>
            </div>
        </section>

        <section class="glass-auth-card">
            <div class="auth-logo"><i class="bi bi-key"></i></div>
            <div class="auth-header">
                <h2>Reset Password</h2>
                <p>Update your account password</p>
            </div>
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert-glass">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
            <form action="resetPasswords" method="post">
                <div class="glass-field" style="margin-bottom:16px;">
                    <label for="currentPassword">Current Password</label>
                    <input type="password" id="currentPassword" name="currentPassword" class="glass-control" placeholder="Enter your current password" required>
                </div>
                <div class="glass-field" style="margin-bottom:16px;">
                    <label for="newPassword">New Password</label>
                    <input type="password" id="newPassword" name="newPassword" class="glass-control" placeholder="Enter your new password" required>
                </div>
                <div class="glass-field" style="margin-bottom:20px;">
                    <label for="confirmPassword">Confirm New Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" class="glass-control" placeholder="Confirm your new password" required>
                </div>
                <button type="submit" class="glass-btn" style="width:100%;"><i class="bi bi-shield-check"></i> Update Password</button>
            </form>
            <p class="auth-note"><a href="profile" class="glass-nav-link" style="display:inline-flex;padding:0;background:none;">← Back to Profile</a></p>
        </section>
    </div>
</main>
</body>
</html>

