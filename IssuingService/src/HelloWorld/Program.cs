using System;
using System.Threading;
using Microsoft.Owin.Hosting;

namespace HelloWorld
{
    public class Program
    {
        public static void Main(string[] args)
        {
            //string baseAddress = "http://localhost:10000/";
            string baseAddress = "http://*:10000/";
            using (WebApp.Start<Startup>(url: baseAddress))
            {
                Console.WriteLine("App started with address '{0}' on a machine '{1}' with OS '{2}'", baseAddress, Environment.MachineName, Environment.OSVersion);
                Console.WriteLine();
                Thread.Sleep(Timeout.Infinite);
            }
        }
    }
}
