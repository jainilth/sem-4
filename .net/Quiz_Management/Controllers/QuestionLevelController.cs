using Microsoft.AspNetCore.Mvc;

namespace Quiz_Management.Controllers
{
    public class QuestionLevelController : Controller
    {
        public IActionResult QuestionLevelList()
        {
            return View();
        }
        public IActionResult AddQuestionLevel()
        {
            return View();
        }
    }
}
