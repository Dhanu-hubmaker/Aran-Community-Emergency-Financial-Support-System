# ARAN – Community Emergency Financial Support System

> Every Signal Deserves Someone Who Answers.

## About the Project

ARAN is a web-based Community Emergency Financial Support System designed to connect people facing emergency financial needs with community members who are willing to provide support.

## Key Features

- User Registration and Login
- Emergency Request Submission
- Community Support
- Support Transaction Management
- Request Status Tracking
- User History
- Contact and Support
- Admin Dashboard
- Emergency Request Management
- Support Transaction Monitoring
- Contact Message Management

## Technologies Used

- ASP.NET Web Forms
- C#
- .NET Framework
- HTML
- CSS
- SQL Server
- LocalDB
- Visual Studio

## Database

Database Name:

`AranCommunitySupportDB`

### Tables

- Users
- EmergencyRequests
- SupportTransactions
- ContactMessages

## System Flow

```text
START
   ↓
Registration / Login
   ↓
Login Type?
   ├── User
   │    ↓
   │  User Dashboard
   │    ↓
   │  Submit Emergency Request
   │    ↓
   │  Request Stored in Database
   │    ↓
   │  View Support Requests
   │    ↓
   │  Select Request & Support
   │    ↓
   │  Support Transaction Recorded
   │    ↓
   │  Request Status Updated
   │    ↓
   │  View History
   │
   └── Admin
        ↓
      Admin Dashboard
        ↓
      Manage Emergency Requests
        ↓
      View Support Transactions
        ↓
      View Contact Messages

   ↓
  END
