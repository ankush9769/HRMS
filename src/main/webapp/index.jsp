<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HRMS | Sign In</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/glass.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body class="glass-body">
<main class="auth-page">
    <div class="auth-shell">
        <section class="glass-hero auth-branding">
            <div class="auth-brand-row">
                <span class="auth-brand-logo"><i class="bi bi-people-fill"></i></span>
                HRMS
            </div>
            <div class="glass-kicker"><i class="bi bi-shield-lock"></i> Secure employee portal</div>
            <h1 class="auth-title" style="margin-top:18px;">Premium Human Resource Management</h1>
            <p class="auth-subtitle">
                Manage employees, leaves, documents, and profiles from one elegant workspace designed with a Liquid Glass interface.
            </p>
            <div class="glass-chip-row" style="margin-top:22px;">
                <span class="glass-chip"><i class="bi bi-lightning-charge"></i> Fast workflows</span>
                <span class="glass-chip"><i class="bi bi-stars"></i> Premium UI</span>
                <span class="glass-chip"><i class="bi bi-device-desktop"></i> Responsive</span>
            </div>
        </section>

        <section class="glass-auth-card">
            <div class="auth-logo"><i class="bi bi-person-lock"></i></div>
            <div class="auth-header">
                <h2>Sign in</h2>
                <p>Continue to your HRMS dashboard.</p>
            </div>

            <form action="signin" method="post">
                <div class="glass-field" style="margin-bottom:18px;">
                    <label for="email">Email Address</label>
                    <input id="email" type="email" name="email" class="glass-control" placeholder="Enter your email" required>
                </div>

                <div class="glass-field" style="margin-bottom:22px;">
                    <label for="password">Password</label>
                    <input id="password" type="password" name="password" class="glass-control" placeholder="Enter your password" required>
                </div>

                <button class="glass-btn" type="submit" style="width:100%;">
                    <i class="bi bi-box-arrow-in-right"></i> Sign In
                </button>
            </form>

            <p class="auth-note">Human Resource Management System</p>
        </section>
    </div>
</main>
</body>
</html>