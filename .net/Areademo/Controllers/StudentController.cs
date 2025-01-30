using Microsoft.AspNetCore.Mvc;

namespace Areademo.Controllers
{
    public class StudentController : Controller
    {
        public IActionResult Index1()
        {
            return View();
        }
    }
}
