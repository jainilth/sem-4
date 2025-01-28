using Microsoft.AspNetCore.Mvc;

namespace Quiz_Management.Controllers
{
    public class UserController : Controller
    {
        public IActionResult Table()
        {
            return View();
        }
    }
}
