using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using AgriEnergyConnect.Models;
using AgriEnergyConnect.Data;

namespace AgriEnergyConnect.Controllers
{
    public class EmployeeController : Controller // This controller is responsible for actions that only Employees can perform like adding a farmer or viewing all products by farmers
    {
        private readonly AppDbContext _context;

        public EmployeeController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index() // Displays all products and sets up filter dropdowns
        {  /***Title: Session in ASP.NET Core
                 Author: Microsoft
                 Date: 29 May 2024
                 Avaliability: https://learn.microsoft.com/en-us/aspnet/core/fundamentals/app-state?view=aspnetcore-8.0#session-state 
             ***/
            var role = HttpContext.Session.GetString("UserRole"); //Employees can access this page only
            if (role != "Employee")
                return RedirectToAction("Login", "Account");
           
            //Dropdown filter
            ViewBag.FarmerEmails = _context.Farmers.Select(f => f.Email).Distinct().ToList();
            ViewBag.Categories = _context.Products
                                         .Select(p => p.Category)
                                         .Where(c => !string.IsNullOrEmpty(c))
                                         .Distinct()
                                         .ToList();

            var allProducts = _context.Products //Gathers products and farmers information
                                      .Include(p => p.Farmer)
                                      .ToList();

            return View(allProducts);
        }

        public IActionResult FilterProducts(string category, DateTime? fromDate, DateTime? toDate, string farmerEmail) //Filter method to filter certain criterias
        {
            var role = HttpContext.Session.GetString("UserRole");
            if (role != "Employee")
                return RedirectToAction("Login", "Account");

            ViewBag.FarmerEmails = _context.Farmers.Select(f => f.Email).Distinct().ToList(); //Filter dropdown view
            ViewBag.Categories = _context.Products
                                         .Select(p => p.Category)
                                         .Where(c => !string.IsNullOrEmpty(c))
                                         .Distinct()
                                         .ToList();

            var filtered = _context.Products //Starts filtering products
                                   .Include(p => p.Farmer)
                                   .AsQueryable();
            //Different filters made if if statements and parameters
            /***Title:Tutorial: Add sorting, filtering, and paging - ASP.NET MVC with EF Core
                 Author: Microsoft
                 Date: 10 April 2024
                 Avaliability:https://learn.microsoft.com/en-us/aspnet/core/data/ef-mvc/sort-filter-page?view=aspnetcore-9.0
             ***/
            if (!string.IsNullOrEmpty(category)) 
                filtered = filtered.Where(p => p.Category == category);

            if (fromDate.HasValue)
                filtered = filtered.Where(p => p.ProductionDate >= fromDate.Value); 

            if (toDate.HasValue)
                filtered = filtered.Where(p => p.ProductionDate <= toDate.Value);

            if (!string.IsNullOrEmpty(farmerEmail))
                filtered = filtered.Where(p => p.Farmer.Email == farmerEmail);

            return View("Index", filtered.ToList()); //returns filter to the user
        }

        [HttpGet]
        public IActionResult AddFarmer() //Method used for employees adding farmers
        {
            var role = HttpContext.Session.GetString("UserRole");
            if (role != "Employee")
                return RedirectToAction("Login", "Account");

            return View();
        }

        public IActionResult ViewFarmers() //Method used for employees to see all farmers that are on the platform
        {
            var role = HttpContext.Session.GetString("UserRole");
            if (role != "Employee")
                return RedirectToAction("Login", "Account");

            var allFarmers = _context.Farmers.ToList();
            return View(allFarmers);
        }

        [HttpPost]
        public IActionResult AddFarmer(Farmer farmer) //Method used for employees to add farmers on the platform
        {
            if (!ModelState.IsValid)
                return View(farmer);

            _context.Farmers.Add(farmer); //Saves famers information in the farmers table
            _context.SaveChanges();

            var existingUser = _context.Users.FirstOrDefault(u => u.Email == farmer.Email); //Verifies if the farmer is added in the user table
            if (existingUser == null)
            {
                _context.Users.Add(new User
                {
                    Email = farmer.Email,
                    Password = farmer.Password,
                    Role = "Farmer"
                });
                _context.SaveChanges();
            }

            return RedirectToAction("Index");
        }
    }
}
