using System.ComponentModel.DataAnnotations;

namespace AgriEnergyConnect.Models
{
    public class User
    {
        [Key]
        public int UserId { get; set; } //Primary Key

        [Required]
        public string Email { get; set; } //Users email address

        [Required]
        public string Password { get; set; } //Users password

        [Required]
        public string Role { get; set; } //Users Role (farmer/employee)
    }
}
