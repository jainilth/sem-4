using Microsoft.AspNetCore.Mvc;

namespace newproject.Controllers
{
    public class CountryController : Controller
    {
        public IActionResult Table()
        {
            return View();
        }
        public IActionResult AddCountry()
        {
            return View();
        }
    }
}
