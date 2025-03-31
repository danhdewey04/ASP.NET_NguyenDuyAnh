using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static BTL.Global;

namespace BTL
{
    public partial class flood : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public static List<Comment> comments = new List<Comment>();

        [WebMethod]
        public static void SaveComment(string username, string content)
        {
            comments.Add(new Comment { Username = username, Content = content });
        }

        [WebMethod]
        public static List<Comment> GetComments()
        {
            return comments;
        }

        [WebMethod]
        public static void LogoutUser()
        {
            HttpContext.Current.Session["IsLoggedIn"] = false;
            HttpContext.Current.Session["CurrentUser"] = null;
        }
    }
}