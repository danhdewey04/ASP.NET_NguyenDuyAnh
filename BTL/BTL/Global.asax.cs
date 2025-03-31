using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.Services.Description;
using System.Web.SessionState;

namespace BTL
{
    public class Global : System.Web.HttpApplication
    {

        void Application_Start(object sender, EventArgs e)
        {
            // Initialize lists in application state
            List<Member> members = new List<Member>
        {
            new Member { Username = "admin", Password = "123456" }
        };
            Application["Members"] = members;
            Application["Comments"] = new List<Comment>();
        }

        void Session_Start(object sender, EventArgs e)
        {
            Session["IsLoggedIn"] = false;
            Session["CurrentUser"] = null;
        }


        [WebMethod]
        public static void SaveComment(string commentContent)
        {
            if (HttpContext.Current.Session["IsLoggedIn"] is bool isLoggedIn && isLoggedIn)
            {
                string username = HttpContext.Current.Session["CurrentUser"]?.ToString();
                if (!string.IsNullOrEmpty(username) && !string.IsNullOrEmpty(commentContent))
                {
                    if (HttpContext.Current.Session["Comments"] is List<Comment> comments)
                    {
                        comments.Add(new Comment { Username = username, Content = commentContent, TimeStamp = DateTime.Now });
                    }
                }
            }
        }

        [WebMethod]
        public static List<Comment> GetComments()
        {
            if (HttpContext.Current.Session["Comments"] is List<Comment> comments)
            {
                return comments;
            }
            return new List<Comment>();
        }

    [WebMethod]
        public static void SavePost(string title, string content)
        {
            if (HttpContext.Current.Session["posts"] is List<Post> posts)
            {
                posts.Add(new Post { Title = title, Content = content, Date = DateTime.Now });
            }
        }

        [WebMethod]
        public static List<Post> GetPosts()
        {
            if (HttpContext.Current.Session["posts"] is List<Post> posts)
            {
                return posts;
            }
            return new List<Post>();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }

        
    }
}