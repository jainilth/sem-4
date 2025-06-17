using CRUDAPIDemo.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace CRUDAPIDemo.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeController : Controller
    {

        [HttpPost("Serialize")]
        public IActionResult serializeJson([FromBody] HospitalMaster hospital)
        {
            if (ModelState.IsValid)
            {
                var output = JsonConvert.SerializeObject(hospital);
                return Ok(new
                {
                    Message = "employee data received and serialized sucessfully",
                    Data = output
                });
            }
            return NoContent();
        }

        [HttpPost]
        public IActionResult DeserializeJson([FromBody] string json)
        {
            try
            {
                var hospital = JsonConvert.DeserializeObject<HospitalMaster>(json);
                return Ok(new
                {
                    Message = "JSON deserialized successfully",
                    Hospital = hospital
                });
            }
            catch (Exception ex)
            {
                return BadRequest(new
                {
                    Message = "Invalid JSON format",
                    Error = ex.Message
                });
            }
        }



    }
}
