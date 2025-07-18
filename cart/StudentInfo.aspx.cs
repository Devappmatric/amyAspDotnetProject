using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Runtime.Serialization;
using System.Security.Authentication;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using AuthorizeNet;
using Square;

namespace ProductivityPointGlobal.cart
{
    public partial class StudentInfo : Page
    {
        public string AuthenticatedUser { get; private set; }
        public string Username { get; private set; }
        public decimal ShoppingCartTotal { get; set; }
        public decimal ShoppingCartTotalReg { get; set; }
        public decimal CouponCodeTotal { get; set; }
        public decimal CouponCodeAmount { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string StudentEmail { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            //AppHelpers.PageTitle("Productivity Point Learning Solutions - Payment Summary");
            AppHelpers.MetaData("description", "");
            AppHelpers.MetaData("keywords", "Payment Summary, Productivity Point Learning Solutions");

            Username = Request.Cookies["UserSettings"].Value;
            AuthenticatedUser = Username;

            if (IsPostBack)
            {
                return;
            }
            chkSameAsContactInformation.Checked = false;

            //StudentInfo();
            //CreditCardYear();
            //BindBasket();

        }

        protected void lvCart_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                HiddenField hfClassID = (HiddenField)e.Item.FindControl("hfClassID");
                HiddenField hfCartID = (HiddenField)e.Item.FindControl("hfCartID");
                HiddenField hfsid = (HiddenField)e.Item.FindControl("hfsid");

                if (hfClassID != null)
                {
                    // Set the value of the HiddenField dynamically
                    hfClassID.Value = DataBinder.Eval(e.Item.DataItem, "ClassID").ToString();
                    hfCartID.Value = DataBinder.Eval(e.Item.DataItem, "CartID").ToString();
                    hfsid.Value = DataBinder.Eval(e.Item.DataItem, "sid").ToString();
                }
                // Get the quantity value
                int quantity = Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "Quantity"));

                // Find the Repeater control inside the ItemTemplate
                Repeater rptQuantity = (Repeater)e.Item.FindControl("rptStudentsList");

                // Create a list with a number of elements equal to the quantity
                List<int> quantityList = new List<int>();
                for (int i = 0; i < quantity; i++)
                {
                    quantityList.Add(i);  // Add empty values just to repeat the fields
                }

                // Bind the list to the Repeater
                rptQuantity.DataSource = quantityList;
                rptQuantity.DataBind();
            }
        }

        protected void ctlPlaceOrder_Click(object sender, EventArgs e)
        {
            ctlPlaceOrder.Enabled = false;
            // Loop through each ListView item (each course)
            foreach (ListViewItem item in lvCart.Items)
            {
                // Find the Repeater for the current ListView item
                Repeater rptStudentsList = (Repeater)item.FindControl("rptStudentsList");
                var hfCartID = (HiddenField)item.FindControl("hfCartId");
                var hfClassID = (HiddenField)item.FindControl("hfClassID");
                var hfsid = (HiddenField)item.FindControl("hfsid");
                // Loop through each student in the Repeater (based on quantity)
                foreach (RepeaterItem repeaterItem in rptStudentsList.Items)
                {
                    // Find the controls inside the Repeater for each student
                    TextBox txtFirstName = (TextBox)repeaterItem.FindControl("txtFirstName");
                    TextBox txtLastName = (TextBox)repeaterItem.FindControl("txtLastName");
                    TextBox txtStudentEmail = (TextBox)repeaterItem.FindControl("txtStudentEmail");

                    // Get the values entered by the user
                    string firstName = txtFirstName.Text;
                    string lastName = txtLastName.Text;
                    string studentEmail = txtStudentEmail.Text;

                    // Save the data (You can save it to a database or process it here)
                    var cartId = Request.Cookies["CartID"].Value;
                    SaveStudentToDatabase(firstName, lastName, studentEmail, hfClassID.Value, hfCartID.Value, hfsid.Value);
                }
            }
            Response.Redirect("~/cart/payment2.aspx");
        }

        private void SaveStudentToDatabase(string firstName, string lastName, string studentEmail, string classId, string maincartId, string cartId)
        {
            // Logic to save the student to the database, e.g., using ADO.NET or Entity Framework
            // Example using ADO.NET:
            string connectionString = AppConfiguration.DbConnectionString; // Replace with your actual connection string

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO tblCartStudents (maincartId, name, email, classid, cartId) VALUES (@maincartId, @name, @email, @classid, @cartId)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@maincartId", maincartId);
                    cmd.Parameters.AddWithValue("@cartId", cartId);
                    cmd.Parameters.AddWithValue("@name", firstName + " " + lastName);
                    cmd.Parameters.AddWithValue("@email", studentEmail);
                    cmd.Parameters.AddWithValue("@classid", classId);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        protected void chkSameAsContactInformation_CheckedChanged(object sender, EventArgs e)
        {
            PopulateStudentInfo();
        }

        private void PopulateStudentInfo()
        {
            if (lvCart.Items.Count > 0)
            {
                // Get the first ListView item (you can change this logic to target another item if needed)
                ListViewItem item = lvCart.Items[0];

                // Find the Repeater within the ListView item
                Repeater rptStudentsList = (Repeater)item.FindControl("rptStudentsList");

                // Make sure there is at least one student in the repeater
                if (rptStudentsList.Items.Count > 0)
                {
                    using (var cnn = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["SQLConnectionProd"].ConnectionString))
                    {
                        var cmd = new System.Data.SqlClient.SqlCommand("dbo.spUserInfo", cnn) { CommandType = System.Data.CommandType.StoredProcedure };
                        cmd.Parameters.Add("@username", SqlDbType.NVarChar, 100).Value = AuthenticatedUser;
                        cnn.Open();
                        using (var r = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection))
                        {
                            bool isGustUser = Guid.TryParse(AuthenticatedUser, out Guid result);
                            if (r.Read())
                            {
                                FirstName = r["firstname"].ToString();
                                LastName = r["lastname"].ToString();
                                StudentEmail = isGustUser ? "" : AuthenticatedUser;
                            }
                            r.Close();
                        }
                        cmd.Dispose();
                    }

                    foreach (ListViewItem studentList in lvCart.Items)
                    {
                        // Find the first item in the Repeater
                        Repeater firstItem = (Repeater)studentList.FindControl("rptStudentsList");

                        foreach (RepeaterItem rItem in firstItem.Items)
                        {
                            // Find the TextBox controls for First Name, Last Name, and Email
                            TextBox txtFirstName = (TextBox)rItem.FindControl("txtFirstName");
                            TextBox txtLastName = (TextBox)rItem.FindControl("txtLastName");
                            TextBox txtStudentEmail = (TextBox)rItem.FindControl("txtStudentEmail");

                            // If the checkbox is checked, populate the fields with some data
                            if (chkSameAsContactInformation.Checked)
                            {
                                txtFirstName.Text = FirstName;
                                txtLastName.Text = LastName;
                                txtStudentEmail.Text = StudentEmail;
                            }
                            else
                            {
                                // If unchecked, clear the fields
                                txtFirstName.Text = string.Empty;
                                txtLastName.Text = string.Empty;
                                txtStudentEmail.Text = string.Empty;
                            }
                            break;
                        }
                    }
                }
            }
        }
    }

}