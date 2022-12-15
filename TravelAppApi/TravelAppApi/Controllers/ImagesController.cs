using Microsoft.AspNetCore.Mvc;

namespace TravelAppApi.Controllers;

[ApiController]
[Route("[controller]")]
public class ImagesController: ControllerBase
{
    [HttpGet]
    [Route("{name}")]
    public IActionResult GetImage([FromRoute] string name)
    {
        Byte[] b = System.IO.File.ReadAllBytes(@$"./Assets/{name}"); 
        return File(b, "image/jpeg");
    }
}