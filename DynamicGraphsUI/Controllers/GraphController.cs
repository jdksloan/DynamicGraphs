using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Reflection;
using System.Web.Http;

namespace DynamicGraphsUI.Controllers
{
    public class GraphController : ApiController
    {
        // GET: api/Graph
        public string Get()
        {
            using (StreamReader r = new StreamReader(@"C:\Jethro\test.json"))
            {
                return  r.ReadToEnd();
            }
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
