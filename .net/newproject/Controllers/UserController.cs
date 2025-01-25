using Microsoft.AspNetCore.Mvc;

namespace newproject.Controllers
{
    public class UserController : Controller
    {
        public IActionResult TableUser()
        {
            return View();
        }
        public IActionResult AddUser()
        {
            return View();
        }
    }
}
