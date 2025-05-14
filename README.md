# Agri-Energy Connect

Agri-Energy Connect is an ASP.NET Core MVC web application designed to support South African farmers and promote green energy adoption in agriculture. The system allows employees to register farmers by capturing their name, email, and password, while farmers can log in and manage their product listings. The platform encourages sustainable practices by providing a centralized space for agricultural operations.

## Table of Contents
- [Overview](#overview)
- [Users](#users)
- [Architecture and Design](#architecture-and-design)
- [Database Setup](#database-setup)
- [Getting Started](#getting-started)
- [Running the Application](#running-the-application)
- [Core Features](#core-features)
- [Demo Video](#demo-video)
- [Dependencies](#dependencies)
- [Troubleshooting](#troubleshooting)
- [Credits](#credits)
- [References](#references)

---

## Overview

Agri-Energy Connect is built to empower farmers and employees in the South African agricultural sector. Through a clean, role-based interface, farmers can manage products, while employees can onboard and support farmers. The platform is built for scalability and ease of use.

Source Code: [GitHub Repository](https://github.com/VCDN-2025/prog7311-part-2-JadinNaicker.git)

---

## Users

### Farmer
Farmers can:
- Add new products.
- Include details such as name, category, description, price, and production date.
- View, edit, and delete only their own products.

### Employee
Employees can:
- Register farmers by entering name, email, and password.
- View a list of all registered farmers.
- View and filter products by category, date, or email.

---

## Architecture and Design

This system follows the **Model-View-Controller (MVC)** design pattern:
- **Model**: Defines data structures such as farmers, users, and products.
- **View**: Renders user-facing pages using Razor views.
- **Controller**: Handles user requests and bridges the model and views.

This separation ensures maintainable code, clean architecture, and easy integration with Entity Framework Core.

---

## Database Setup

This application uses **Microsoft SQL Server**, managed using **Entity Framework Core Migrations**.

### Main Tables
- `Farmers`
- `Products`
- `Users`

### Connection String
Located in `appsettings.json`:
```json
"ConnectionStrings": {
  "DefaultConnection": "Server=lab7L95SR\\SQLEXPRESS;Database=AgriEnergyConnectDB;Trusted_Connection=True;Encrypt=False;"
}
```

### Setup Commands
Run the following in Visual Studio's Package Manager Console:
```
Add-Migration InitialCreate
Update-Database
```

---

## Getting Started

### Prerequisites
- .NET 9 SDK  
- Visual Studio 2022  
- SQL Server Express  
- SQL Server Management Studio (SSMS)  

### Cloning the Repository
Download the ZIP from GitHub: [Agri-Energy Connect Repository](https://github.com/VCDN-2025/prog7311-part-2-JadinNaicker.git)  
Unzip the project folder. Paste it into your repo folder where all your other visual studio projects are.

---

## Running the Application

1. Open the solution in Visual Studio 2022.
2. Verify your `appsettings.json` connection string matches your local SQL Server.
3. Open **Package Manager Console** and run: `Update-Database`
4. Press `F5` to build and run the application.

---

## Core Features

### Employee Capabilities
- Register new farmers.
- View and manage farmer profiles.
- View all products and filter by category, date, or farmer.

### Farmer Capabilities
- Log in securely using credentials created by an employee.
- Add, edit, and delete their own products.

---

## Demo Video

[(Insert your video link here)](https://youtu.be/YVa4T5H6Wao)

---

## Dependencies

### NuGet Packages
```xml
<PackageReference Include="Microsoft.EntityFrameworkCore.SqlServer" Version="9.0.4" />
<PackageReference Include="Microsoft.EntityFrameworkCore.Tools" Version="9.0.4" />
```

### Other Technologies
- ASP.NET Core MVC  
- Entity Framework Core  
- SQL Server Express  
- Razor Pages  

---

## Troubleshooting

### Database Issues?
- Ensure SQL Server is running and the server name matches `appsettings.json`.

### Migration Problems?
- Re-run: `Add-Migration <Name>` and `Update-Database`.

### Login Errors?
- Confirm the user exists in the `Users` table and has the correct role.

---


---

## References

- Microsoft Documentation: [docs.microsoft.com](https://docs.microsoft.com)
- Entity Framework Core: [EF Core Docs](https://learn.microsoft.com/en-us/ef/core/)
