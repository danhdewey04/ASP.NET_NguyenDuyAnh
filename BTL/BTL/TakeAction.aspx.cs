using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class TakeAction : System.Web.UI.Page
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