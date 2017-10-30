using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Reflection;
using System.Web.Http;
using Newtonsoft.Json;

namespace DynamicGraphsUI.Controllers
{
    public class GraphController : ApiController
    {

        // GET: api/Graph
        public HttpResponseMessage Get()
        {
            
            string result = System.IO.File.ReadAllText(@"C:\Jethro\test.json");
            return Request.CreateResponse(HttpStatusCode.OK, JsonConvert.DeserializeObject(result));
        }

        // GET: api/Graph/5
        public string Get(int id)
        {
            return "value";
        }

        //// POST: api/Graph
        //public void Post([FromBody]string value)
        //{
        //}

        //// PUT: api/Graph/5
        //public void Put(int id, [FromBody]string value)
        //{
        //}

        //// DELETE: api/Graph/5
        //public void Delete(int id)
        //{
        //}
    }
}
