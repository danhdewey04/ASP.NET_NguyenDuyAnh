using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI;
using Newtonsoft.Json;
using System.Web.Services;
using System.Web;

namespace BTL
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SendMessageButton_Click(object sender, EventArgs e)
        {
            // Tạo đối tượng contact với dữ liệu từ form
            var contact = new
            {
                Name = NameTextBox.Text,
                Email = EmailTextBox.Text,
                Message = MessageTextBox.Text,
                Timestamp = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")
            };

            // Chuyển đổi đối tượng thành JSON
            string json = JsonConvert.SerializeObject(contact, Newtonsoft.Json.Formatting.Indented);

            // Tạo tên file duy nhất bằng timestamp
            string fileName = "Contact_" + DateTime.Now.ToString("yyyyMMddHHmmssfff") + ".json";
            string filePath = Server.MapPath("~/Guest_Response/" + fileName);

            // Lưu JSON vào file
            try
            {
                File.WriteAllText(filePath, json);
                Response.Write("<script>alert('Your message has been saved successfully.');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('An error occurred while saving your message: " + ex.Message + "');</script>");
            }
        }

        [WebMethod]
        public static void LogoutUser()
        {
            HttpContext.Current.Session["IsLoggedIn"] = false;
            HttpContext.Current.Session["CurrentUser"] = null;
        }
    }
}