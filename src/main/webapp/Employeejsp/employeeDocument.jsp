<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Document" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HRMS | Documents</title>
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
            <a class="glass-nav-link active" href="documents"><i class="bi bi-folder2-open"></i> Documents</a>
            <a class="glass-nav-link" href="profile"><i class="bi bi-person-badge"></i> Profile</a>
            <a class="glass-nav-link" href="SignOut"><i class="bi bi-box-arrow-right"></i> Sign Out</a>
        </div>
    </div>
</nav>

<main class="glass-page">
    <section class="glass-hero">
        <div class="glass-hero-grid">
            <div>
                <div class="glass-kicker"><i class="bi bi-folder-lock"></i> My secure documents</div>
                <h1 class="glass-title">Document center <span>for employees</span></h1>
                <p class="glass-subtitle">Upload and manage supporting files in a modern, premium workspace that keeps the existing upload and download behavior intact.</p>
                <div class="glass-actions">
                    <a class="glass-btn" href="#upload"><i class="bi bi-cloud-arrow-up"></i> Upload file</a>
                    <span class="glass-chip"><i class="bi bi-file-earmark-text"></i> PDF, JPG, PNG</span>
                    <span class="glass-chip"><i class="bi bi-hdd-network"></i> Up to 5 MB</span>
                </div>
            </div>
            <div class="glass-hero-side">
                <div class="glass-chip-row">
                    <span class="glass-chip"><i class="bi bi-shield-check"></i> Secure upload</span>
                    <span class="glass-chip"><i class="bi bi-cloud-check"></i> Download anytime</span>
                    <span class="glass-chip"><i class="bi bi-stars"></i> Liquid Glass UI</span>
                </div>
            </div>
        </div>
    </section>

    <section id="upload" class="glass-section">
        <div class="glass-grid">
            <div style="grid-column: span 5;">
                <div class="glass-form-card">
                    <div class="glass-card-title"><span class="glass-icon-badge"><i class="bi bi-cloud-upload"></i></span> Upload document</div>
                    <p class="glass-meta glass-small">The form action and file input name remain unchanged so the backend continues to receive multipart uploads as before.</p>
                    <form action="uploadDocument" method="post" enctype="multipart/form-data" style="margin-top:18px;">
                        <div class="glass-field" style="margin-bottom:16px;">
                            <label for="document">Select document</label>
                            <input type="file" id="document" name="document" class="glass-control" accept=".pdf,.jpg,.jpeg,.png" required>
                        </div>
                        <button type="submit" class="glass-btn"><i class="bi bi-upload"></i> Upload</button>
                    </form>
                </div>
            </div>
            <div style="grid-column: span 7;">
                <div class="glass-panel upload-dropzone">
                    <span class="glass-icon-badge"><i class="bi bi-drag-indicator"></i></span>
                    <strong>Private document vault</strong>
                    <p>Keep IDs, receipts, and records organized in a single clean library with a glass-style presentation.</p>
                </div>
            </div>
        </div>
    </section>

    <section class="glass-section">
        <div style="display:flex;align-items:flex-end;justify-content:space-between;gap:16px;margin-bottom:16px;">
            <div>
                <div class="glass-kicker"><i class="bi bi-journal-text"></i> Recent uploads</div>
                <h2 style="margin:12px 0 0;font-size:1.65rem;letter-spacing:-0.03em;">Document library</h2>
            </div>
        </div>

        <div class="glass-table-wrap">
            <table class="glass-table">
                <thead>
                    <tr>
                        <th>File</th>
                        <th>Type</th>
                        <th>Size</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    List<Document> documents=(List<Document>)request.getAttribute("documents");
                    if(documents!=null&&!documents.isEmpty()){
                        for(Document document:documents){
                %>
                    <tr>
                        <td><strong><%= document.getFileName() %></strong></td>
                        <td><%= document.getContentType() %></td>
                        <td><%= document.getFileSize() %> bytes</td>
                        <td><a href="downloadDocument?id=<%= document.getId() %>" class="glass-btn glass-btn-secondary"><i class="bi bi-download"></i> Download</a></td>
                    </tr>
                <%
                        }
                    }else{
                %>
                    <tr>
                        <td colspan="4" class="glass-empty">No documents uploaded yet.</td>
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