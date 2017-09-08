using System;
using System.Diagnostics;
using System.Web.Http;

namespace HelloWorld.Controllers
{
    public class HelloController: ApiController
    {
        [Route("api/hello/{message}")]
        [HttpGet]
        public string Get(string message)
        {
            var guid = Guid.NewGuid().ToString();
            var returnedMessage = $"Hello, {message} '{guid}'";
            Debug.WriteLine(returnedMessage);
            return returnedMessage;
        }

    }
}
