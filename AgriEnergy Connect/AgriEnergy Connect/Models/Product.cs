using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;

namespace AgriEnergyConnect.Models
{
    public class Product
    {
        [Key]
        public int ProductId { get; set; } //Primary Key

        [Required]
        public string Name { get; set; } //Name of product

        public string Category { get; set; } //Product category name

        public DateTime ProductionDate { get; set; } //Production date of product

        public string Description { get; set; } //product description

        public double Price { get; set; } //Price of the product

        [ForeignKey("Farmer")]
        public int FarmerId { get; set; } //Foreign Key

        [ValidateNever] 
        public Farmer Farmer { get; set; }
    }
}
