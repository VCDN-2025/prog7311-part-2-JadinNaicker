using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AgriEnergyConnect.Models
{
    public class Farmer
    {
        [Key]
        public int FarmerId { get; set; } //Primary Key

        [Required]
        public string Name { get; set; } //Farmers full name

        [Required]
        public string Email { get; set; } //Farmers email address

        [NotMapped] //NotMapped used for password so the farmers password is not saved in the database for security meassures
        [Required]
        public string Password { get; set; } //Farmers password
    }
}
