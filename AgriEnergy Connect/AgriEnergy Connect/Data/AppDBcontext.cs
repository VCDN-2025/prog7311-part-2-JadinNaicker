using Microsoft.EntityFrameworkCore;
using AgriEnergyConnect.Models;

namespace AgriEnergyConnect.Data 
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<User> Users { get; set; } //User table made
        public DbSet<Farmer> Farmers { get; set; } //Farmer table made
        public DbSet<Product> Products { get; set; } //Products table made
    }
}
