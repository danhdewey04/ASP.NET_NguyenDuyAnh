using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMessages();
            }
        }

        public class ContactMessage
        {
            public string Name { get; set; }
            public string Email { get; set; }
            public string Message { get; set; }
            public DateTime Timestamp { get; set; }
        }
        private void LoadMessages()
        {
            string[] files = Directory.GetFiles(Server.MapPath("~/Guest_Response/"), "Contact*.json");
            List<ContactMessage> messages = new List<ContactMessage>();

            foreach (string file in files)
            {
          
                    // Đọc nội dung file JSON
                    string json = File.ReadAllText(file);

                    // Deserialize JSON thành đối tượng ContactMessage
                    ContactMessage message = JsonConvert.DeserializeObject<ContactMessage>(json);

                    if (message != null)
                    {
                        messages.Add(message);
                    }

            }

            MessagesGridView.DataSource = messages;
            MessagesGridView.DataBind();
        }

        [WebMethod]
        public static void LogoutUser()
        {
            HttpContext.Current.Session["IsLoggedIn"] = false;
            HttpContext.Current.Session["CurrentUser"] = null;
        }
    }
}