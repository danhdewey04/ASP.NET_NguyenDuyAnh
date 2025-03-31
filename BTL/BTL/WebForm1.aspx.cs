using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static void SaveComment(string username, string content)
        {
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(content))
            {
                throw new ArgumentException("Username and content cannot be empty");
            }

            // Here we should save the comment to a database or any other storage mechanism.
            // For demonstration purposes, we're just going to keep comments in memory.
            List<Comment> comments = (List<Comment>)HttpContext.Current.Application["Comments"] ?? new List<Comment>();
            comments.Add(new Comment { Username = username, Content = content, TimeStamp = DateTime.Now });
            HttpContext.Current.Application["Comments"] = comments;
        }

        [WebMethod]
        public static List<Comment> GetComments()
        {
            // Retrieve comments from the Application state
            List<Comment> comments = (List<Comment>)HttpContext.Current.Application["Comments"] ?? new List<Comment>();
            return comments;
        }
    }
}