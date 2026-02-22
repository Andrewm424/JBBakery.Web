using System.Diagnostics;
using JBBakery.Web.Models;
using Microsoft.AspNetCore.Mvc;

namespace JBBakery.Web.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Menu()
        {
            return View();
        }

        public IActionResult Contact()
        {
            return View();
        }
    }
}