using Microsoft.AspNetCore.Mvc;

namespace demo.Controllers
{
    public class productController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}