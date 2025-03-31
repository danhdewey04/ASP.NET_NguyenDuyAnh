using System;
using System.Collections.Generic;
using System.Web.Services;
using System.Web;

namespace BTL
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }


        [WebMethod]
        public static void LogoutUser()
        {
            HttpContext.Current.Session["IsLoggedIn"] = false;
            HttpContext.Current.Session["CurrentUser"] = null;
        }
    }
}