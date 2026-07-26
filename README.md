# Samyak Computer Classes - Smart Admission CRM & ERP

An enterprise-grade CRM and ERP solution tailored for computer education institutes, managing inquiries, lead conversions, course enrollments, fee installments, student ledgers, batch scheduling, and analytical reporting.

---

## Technical Stack & Architecture

- **Backend**: .NET 9.0 Web API (Clean Architecture with Domain, Application, Infrastructure, API layers)
- **Frontend**: React 19 + TypeScript + Vite 8.1 (Glassmorphic Dark Design System, responsive grid layout)
- **Database**: Microsoft SQL Server Express (`MSSQL16.SQLEXPRESS`) with EF Core 9
- **Authentication**: JWT Bearer Tokens with Role-Based Access Control (RBAC)
- **Production Server**: Single-port unified hosting on Kestrel (Port `5000` / `5001`), serving REST API and compiled React SPA static files from `wwwroot`.

---

## Default Administrator Credentials

- **Email**: `admin@samyakfaridabad.com`
- **Password**: `Admin@123`
- **Role**: `Super Admin` (Full system access)

---

## Server Access URLs

- **Public Internet (HTTPS)**: `https://road-declare-built-ceiling.trycloudflare.com`
- **Local Wi-Fi LAN (HTTP)**: `http://192.168.31.137:5000`
- **Localhost (HTTP)**: `http://localhost:5000`
- **Health Check**: `http://localhost:5000/health`

---

## Core Features

1. **Lead Management**: Inquiry capture, status pipelines, AI lead conversion scoring, counsellor allocation, remarks timeline.
2. **Student & Course Management**: Student profiles, course catalog, fee structure definition.
3. **Fee Ledger & Billing**: Student installment schedules, pending fee trackers, receipt generation.
4. **AI & Predictive Analytics**: AI lead quality scoring, intelligent follow-up recommendations, call summary parser.
5. **Messaging Integration**: Meta Cloud WhatsApp API integration, SMS, Email dispatch logging.
6. **Analytical Reports**: Lead acquisition source breakdown, conversion funnel, revenue & admissions reports.
