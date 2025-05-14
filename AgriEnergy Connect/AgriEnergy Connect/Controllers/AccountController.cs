using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using System.Linq;
using AgriEnergyConnect.Models;
using AgriEnergyConnect.Data;

namespace AgriEnergyConnect.Controllers // Controller responsible for handling login and logout functionality
{
    public class AccountController : Controller
    {
        private readonly AppDbContext _context;

        public AccountController(AppDbContext context) // Access data in the database
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Login() //Displays login form
        { 
            ViewBag.RoleList = new List<string> { "Farmer", "Employee" }; //dropdown view for farmer and employee
            return View();
        }

        [HttpPost]
        public IActionResult Login(string email, string password, string role)
        { 
            var user = _context.Users.FirstOrDefault(u => u.Email == email && u.Password == password && u.Role == role); //Matches users data in the database to get their correct role and information
            if (user != null) //Stores users login
            { 
             /***Title: Session in ASP.NET Core
                 Author: Microsoft
                 Date: 29 May 2024
                 Avaliability: https://learn.microsoft.com/en-us/aspnet/core/fundamentals/app-state?view=aspnetcore-8.0#session-state 
             ***/
                HttpContext.Session.SetString("UserEmail", user.Email);
                HttpContext.Session.SetString("UserRole", user.Role);
                HttpContext.Session.SetInt32("UserId", user.UserId);

                return RedirectToAction("Index", "Home"); //Redirects users to the home page according to their role
            }
            //Error handling
            /***Title: Views in ASP.NET Core MVC
                Author: Microsoft
                Date: 17 June 2024
                Avaliability: https://learn.microsoft.com/en-us/aspnet/core/mvc/views/overview?view=aspnetcore-8.0#viewbag-viewdata-and-strongly-typed-views 
            ***/
            ViewBag.Message = "Invalid email, password, or role.";
            ViewBag.RoleList = new List<string> { "Farmer", "Employee" };
            return View();
        }

        public IActionResult Logout()
        { //Allows users to logout
            HttpContext.Session.Clear();
            return RedirectToAction("Login");
        }
    }
}
