using Microsoft.AspNetCore.Mvc;

namespace newproject.Controllers
{
    public class DemoController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
