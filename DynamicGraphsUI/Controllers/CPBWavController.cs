using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace DynamicGraphsUI.Controllers
{
    public class CPBWavController : ApiController
    {
        private Test_ScenarioEntities dbContext = new Test_ScenarioEntities();
        // GET: api/CPBWav
        public double Get()
        {
            try
            {
                var data = dbContext.Get_CPB_Vs_OPB().FirstOrDefault();
                if (data.WAV.HasValue)
                {
                    return data.WAV.Value;
                }
                return 0;
            }
            catch (Exception)
            {

                return 0;
            }
        }

        // GET: api/CPBWav/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/CPBWav
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/CPBWav/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/CPBWav/5
        public void Delete(int id)
        {
        }
    }
}
