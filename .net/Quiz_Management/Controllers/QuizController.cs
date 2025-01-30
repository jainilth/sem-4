using Microsoft.AspNetCore.Mvc;

namespace Quiz_Management.Controllers
{
    public class QuizController : Controller
    {
        public IActionResult QuizList()
        {
            return View();
        }
        public IActionResult QuizAdd()
        {
            return View();
        }
    }
}
