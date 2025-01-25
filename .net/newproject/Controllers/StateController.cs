using Microsoft.AspNetCore.Mvc;

namespace newproject.Controllers
{
    public class StateController : Controller
    {
        public IActionResult TableState()
        {
            return View();
        }
        public IActionResult AddState()
        {
            return View();
        }
    }
}
