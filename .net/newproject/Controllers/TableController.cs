using Microsoft.AspNetCore.Mvc;

namespace newproject.Controllers
{
    public class TableController : Controller
    {
        public IActionResult Table1()
        {
            return View();
        }
        public IActionResult Table2()
        {
            return View();
        }
    }
}
