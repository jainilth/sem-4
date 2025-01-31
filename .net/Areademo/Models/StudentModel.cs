using System.ComponentModel.DataAnnotations;
namespace Areademo.Models
{
    public class StudentModel
    {
        [Required]
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }
    }
}
