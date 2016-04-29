using System;
using System.IO;
using System.Net;

namespace GetLeads
{
    class GetLeads
    {
        static void Main()
        {
            // specify URL/Component/Method and API Access Key
            const string url = "https://api.idxbroker.com/leads/lead";
            const string accesskey = "YourAccessKeyHere";

            // instantiate new HttpWebRequest
            var request = WebRequest.Create(url);
            // set header information
            request.ContentType = "applicaton/x-www-form-urlencoded";
            request.Headers.Add("accesskey", accesskey);
            // create output string objects
            var responseHeaders = "";
            var leads = "";

            try
            {
                // send GET request and store response
                var response = request.GetResponse();
                // create stream from response
                using (var responseStream = new StreamReader(response.GetResponseStream()))
                {
                    responseHeaders = response.Headers.ToString();
                    leads = responseStream.ReadToEnd();
                }
                // dispose of response to free it for reuse
                response.Close();
            }
            // if trying to add restricted header
            catch (ArgumentException e)
            {
                Console.WriteLine(e.Message);
            }
            // if web exception is thrown
            catch (WebException e)
            {
                Console.WriteLine("WebException Thrown. Message: " + e.Message);
                if (e.Status == WebExceptionStatus.ProtocolError)
                {
                    Console.WriteLine("Status Code: " + ((HttpWebResponse)e.Response).StatusCode);
                    Console.WriteLine("Status Description: " + ((HttpWebResponse)e.Response).StatusDescription);
                    Console.WriteLine("Server: " + ((HttpWebResponse)e.Response).Server);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception Thrown. Message: " + e.Message);
            }

            // print output strings
            Console.WriteLine(responseHeaders);
            Console.WriteLine(leads);
        }
    }
}
