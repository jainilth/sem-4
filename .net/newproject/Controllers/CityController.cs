using Microsoft.AspNetCore.Mvc;

namespace newproject.Controllers
{
    public class CityController : Controller
    {
        public IActionResult TableCity()
        {
            return View();
        }
        public IActionResult AddCity()
        {
            return View();
        }
    }
}
