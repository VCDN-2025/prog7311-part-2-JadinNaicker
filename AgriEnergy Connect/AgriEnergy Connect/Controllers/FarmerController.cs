using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using System.Linq;
using AgriEnergyConnect.Models;
using AgriEnergyConnect.Data;
using System;

namespace AgriEnergyConnect.Controllers
{
    public class FarmerController : Controller //This controller is for the farmers allowing them to view their own products and add a product
    {
        private readonly AppDbContext _context;

        public FarmerController(AppDbContext context) // Allows database to access data
        {
            _context = context;
        }

        public IActionResult Index() //Displays products made by the current farmer logged in
        {
            var role = HttpContext.Session.GetString("UserRole");
            var userEmail = HttpContext.Session.GetString("UserEmail");

            if (role != "Farmer" || string.IsNullOrEmpty(userEmail))
                return RedirectToAction("Login", "Account");

            var farmer = _context.Farmers.FirstOrDefault(f => f.Email == userEmail);
            if (farmer == null)
                return RedirectToAction("Login", "Account");

            var products = _context.Products //Gets the products linked to the farmer who created them
                                   .Where(p => p.FarmerId == farmer.FarmerId)
                                   .ToList();

            return View(products);
        }

        [HttpGet]
        public IActionResult AddProduct() //Form for displaying the product
        {
            var role = HttpContext.Session.GetString("UserRole");
            if (role != "Farmer")
                return RedirectToAction("Login", "Account");

            return View();
        }

        [HttpPost]
        public IActionResult AddProduct(Product product) //Handles the submission of a new product by the farmer
        {
            var userEmail = HttpContext.Session.GetString("UserEmail"); //Gets the email of the current farmer logged in
            if (string.IsNullOrEmpty(userEmail))
                return RedirectToAction("Login", "Account");

            var farmer = _context.Farmers.FirstOrDefault(f => f.Email == userEmail);
            if (farmer == null)
                return RedirectToAction("Login", "Account");

            product.FarmerId = farmer.FarmerId; //Links the product to the farmer

            if (!ModelState.IsValid)
                return View(product);

            try
            {
                _context.Products.Add(product); //Saves product data in the database
                _context.SaveChanges();
                TempData["SuccessMessage"] = "Product added successfully!";
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Message = "ERROR: " + ex.Message; //Error handling
                return View(product);
            }
        }

        [HttpGet]
        public IActionResult EditProduct(int id) //Displays the edit form for a specific product
        {
            var userEmail = HttpContext.Session.GetString("UserEmail");
            var farmer = _context.Farmers.FirstOrDefault(f => f.Email == userEmail);

            var product = _context.Products.FirstOrDefault(p => p.ProductId == id && p.FarmerId == farmer.FarmerId);
            if (product == null)
                return NotFound();

            return View(product);
        }

        [HttpPost]
        public IActionResult EditProduct(Product updatedProduct) //Handles the update of a product's information
        {
            var userEmail = HttpContext.Session.GetString("UserEmail");
            var farmer = _context.Farmers.FirstOrDefault(f => f.Email == userEmail);

            var product = _context.Products.FirstOrDefault(p => p.ProductId == updatedProduct.ProductId && p.FarmerId == farmer.FarmerId);
            if (product == null)
                return NotFound();

            if (!ModelState.IsValid)
                return View(updatedProduct);

            //Updates fields
            product.Name = updatedProduct.Name;
            product.Category = updatedProduct.Category;
            product.Description = updatedProduct.Description;
            product.ProductionDate = updatedProduct.ProductionDate;
            product.Price = updatedProduct.Price;

            _context.SaveChanges(); //Saves updated data
            TempData["SuccessMessage"] = "Product updated successfully!";
            return RedirectToAction("Index");
        }

        [HttpPost]
        public IActionResult DeleteProduct(int id) //Handles deletion of a product by the farmer
        {
            var userEmail = HttpContext.Session.GetString("UserEmail");
            var farmer = _context.Farmers.FirstOrDefault(f => f.Email == userEmail);

            var product = _context.Products.FirstOrDefault(p => p.ProductId == id && p.FarmerId == farmer.FarmerId);
            if (product == null)
                return NotFound();

            _context.Products.Remove(product); //Deletes the product
            _context.SaveChanges();

            TempData["SuccessMessage"] = "Product deleted successfully!";
            return RedirectToAction("Index");
        }
    }
}
