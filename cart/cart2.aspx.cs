using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Policy;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Int32;

namespace ProductivityPointGlobal.cart
{
    public partial class Cart2 : Page
    {
        public string AuthenticatedUser { get; private set; }
        public decimal ShoppingCartTotalReg { get; set; }
        public decimal CouponCodeAmount { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            lvStud.Visible = false;
            if (IsPostBack)
            {
                return;
            }
            AppHelpers.PageTitle("Productivity Point Learning Solutions - Cart Summary");
            AppHelpers.MetaData("description", "");
            AppHelpers.MetaData("keywords", "Cart Summary, Productivity Point Learning Solutions");

            // Check if user is logged in
            CheckLoginStatus();

            // Get Shopping Cart
            //BindBasket();
        }

        protected void Quantity_TextChanged(object sender, EventArgs e)
        {
            var quantityTextBox = (TextBox)sender;
            var quantity = 0;
            if (TryParse(quantityTextBox.Text, out quantity))
            {
                var row = (ListViewDataItem)quantityTextBox.NamingContainer;
                var dataKey = lvCart.DataKeys[row.DisplayIndex];
                if (dataKey != null)
                {
                    var classId = dataKey.Value.ToString();
                    ShoppingCartAccess.UpdateItem(classId, quantity);
                }
            }
            lvCart.DataBind();
        }

        protected void CheckLoginStatus()
        {
            var userNameCookie = Request.Cookies.Get("UserSettings");

            if (userNameCookie == null)
            {
                var guid = Guid.NewGuid().ToString();
                userNameCookie = new HttpCookie("UserSettings");
                userNameCookie.Value = guid; // or use email/temp ID
                userNameCookie.Expires = DateTime.Now.AddDays(7); // Optional expiry
                Response.Cookies.Add(userNameCookie);
                AddGuestUser(guid);
            }
            
            AuthenticatedUser = userNameCookie.Value;
        }

        protected void AddGuestUser(string guid)
        {

            string connStr = ConfigurationManager.ConnectionStrings["SQLConnectionProd"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string insertQuery = @"
                        INSERT INTO tblUsers
                        (GuestUserGuid)
                        VALUES
                        (@GuestUserGuid)";

                using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@GuestUserGuid", guid);
                    cmd.ExecuteNonQuery();
                }

                conn.Close();
            }
        }

        protected void ctlLogInUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void ctlLogOutUser_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            if (Request.Cookies["CartID"] != null)
            {
                var httpCookie = Response.Cookies["CartID"];
                if (httpCookie != null) httpCookie.Expires = DateTime.Now.AddDays(-1);
                Session.Remove("CartID");
            }

            Response.Redirect("~/cart/");
        }

        protected void ctlChangeQuantity(object  sender, EventArgs e)
        {
            TextBox txtQuantity = (TextBox)sender; // Get the changed TextBox
            ListViewItem item = (ListViewItem)txtQuantity.NamingContainer; // Get parent row

            // Retrieve the ID of the item
            HiddenField hiddenId = (HiddenField)item.FindControl("hiddenItemId"); // If you have a hidden field
            var itemId = hiddenId.Value;

            // Get the new quantity
            int newQuantity;
            if (int.TryParse(txtQuantity.Text, out newQuantity) && newQuantity > 0)
            {
                // Call function to update quantity in database
                ShoppingCartAccess.UpdateItem(itemId, newQuantity);
            }
            else
            {
                // Handle invalid input (optional)
                txtQuantity.Text = "1"; // Reset to default
            }
            Response.Redirect(Request.RawUrl, false);
            //lvCart.DataBind();
        }

        protected void ctlCheckOut_Click(object sender, EventArgs e)
        {
            //var rowsCount = ctlCartInfo.Rows.Count;

            //for (var i = 0; i < rowsCount; i++)
            //{
            //    var gridRow = ctlCartInfo.Rows[i];
            //    var dataKey = ctlCartInfo.DataKeys[i];

            //    if (dataKey == null) continue;
            //    var classId = dataKey.Value.ToString();
            //    var quantityTextBox = (TextBox)gridRow.FindControl("ctlQuantity");

            //    int quantity;
            //    if (TryParse(quantityTextBox.Text, out quantity))
            //    {
            //        ShoppingCartAccess.UpdateItem(classId, quantity);
            //    }
            //}
            //BindBasket();

            foreach (var row in lvCart.Items)
            {
                var temp = row.FindControl("Quantity");
                //var quanity = decimal.Parse((row.FindControl("Seats") as TextBox).Text);
                var quanity = 1;

				if (quanity == 0)
                {
                    var userName = "";
                    var email = "";

                    using (var cnn = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["SQLConnectionProd"].ConnectionString))
                    {
                        var cmd = new System.Data.SqlClient.SqlCommand("dbo.spUserInfo", cnn) { CommandType = System.Data.CommandType.StoredProcedure };
                        cmd.Parameters.Add("@username", SqlDbType.NVarChar, 100).Value = AuthenticatedUser;
                        cnn.Open();
                        using (var r = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection))
                        {
                            if (r.Read())
                            {
                                userName = string.Format("{0} {1}", r["firstname"], r["lastname"]);
                                email = AuthenticatedUser;
                            }
                            r.Close();
                        }
                        cmd.Dispose();
                    }

                    using (var cnn = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["SQLConnectionProd"].ConnectionString))
                    {
                        var cmd = new System.Data.SqlClient.SqlCommand("dbo.tblCartStudents_i", cnn)
                        {
                            CommandType = System.Data.CommandType.StoredProcedure
                        };
                        cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 100).Value = userName;
                        cmd.Parameters.Add("@email", SqlDbType.VarChar, 255).Value = email;
                        cmd.Parameters.Add("@cartId", SqlDbType.Int).Value = int.Parse(ctlStudentCourse.SelectedValue);
                        cnn.Open();
                        cmd.ExecuteNonQuery();
                        cnn.Close();
                        cmd.Dispose();
                    }
                }
            }

            var usernameCookie = Request.Cookies["UserSettings"];

			AuthenticatedUser = usernameCookie?.Value;
			Response.Redirect("account-edit2.aspx", true);
		}

        protected void ctlContinueShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/courses/");
        }

        protected void lvStud_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            lvCart.DataBind();
        }

        protected void lvStud_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            lvCart.DataBind();
        }

        protected void lvCart_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                TextBox txtQuantity = (TextBox)e.Item.FindControl("txtQuantity"); // Find the TextBox
                if (txtQuantity != null)
                {
                    string itemId = DataBinder.Eval(e.Item.DataItem, "id").ToString(); // Get dynamic ID
                    txtQuantity.Attributes["min"] = "1"; // Set minimum value to 1
                }
            }
        }

        protected void lvCart_DataBound(object sender, EventArgs e)
        {
            pnlCouponApplied.Visible = false;
            if (lvCart.Items.Count == 0)
            {
                pnlTotal.Visible = false;
                ctlCheckOut.Visible = false;
                phStud.Visible = false;
                return;
            }
            phStud.Visible = true;
            //pnlCouponApplied.Visible = true;
            pnlTotal.Visible = true;
            ctlCheckOut.Visible = true;
            decimal total = 0;
            foreach (var row in lvCart.Items)
            {
                decimal linetotal = decimal.Parse((row.FindControl("price") as Literal).Text);
                decimal quantity = decimal.Parse((row.FindControl("txtQuantity") as TextBox).Text);
                total += (linetotal*quantity);
            }
            int couponDsc = 0;
            if (Session["CouponDiscount"] != null)
            {
                couponDsc = (int)Session["CouponDiscount"];
                ctlDiscountTotal.Text = (total * couponDsc / 100).ToString("c");
                pnlCouponApplied.Visible = true;
            }
            ctlTotalCost.Text = (total * (100 - couponDsc) / 100).ToString("c");
            //(lvCart.FindControl("ltrTotal") as Literal).Text = total.ToString("c");
            //lvStud.DataBind();
        }
        protected void ctlStudentInfoSame_CheckedChanged(object sender, EventArgs e)
        {
            if (ctlStudentInfoSame.Checked)
            {
                //var fName = (TextBox)ctlEditAccountInfo.FindControl("ctlFirstName");
                //var lName = (TextBox)ctlEditAccountInfo.FindControl("ctlLastName");

                //var firstName = fName.Text;
                //var lastName = lName.Text;
                using (var cnn = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["SQLConnectionProd"].ConnectionString))
                {
                    var cmd = new System.Data.SqlClient.SqlCommand("dbo.spUserInfo", cnn) { CommandType = System.Data.CommandType.StoredProcedure };
                    cmd.Parameters.Add("@username", SqlDbType.NVarChar, 100).Value = AuthenticatedUser;
                    cnn.Open();
                    using(var r = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection))
                    {
                        if (r.Read())
                        {
                            ctlStudentName.Text = string.Format("{0} {1}", r["firstname"], r["lastname"]);
                            ctlStudentEmail.Text = AuthenticatedUser;
                        }
                        r.Close();
                    }
                    cmd.Dispose();
                }
            }
            else
            {
                ctlStudentName.Text = "";
                ctlStudentEmail.Text = "";
            }
        }
        protected void ctlAddStudent_Click(object sender, EventArgs e)
        {
            using(var cnn=new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["SQLConnectionProd"].ConnectionString))
            {
                var cmd = new System.Data.SqlClient.SqlCommand("dbo.tblCartStudents_i", cnn)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 100).Value = ctlStudentName.Text.Trim();
                cmd.Parameters.Add("@email", SqlDbType.VarChar, 255).Value = ctlStudentEmail.Text.Trim();
                cmd.Parameters.Add("@cartId", SqlDbType.Int).Value = int.Parse(ctlStudentCourse.SelectedValue);
                cnn.Open();
                cmd.ExecuteNonQuery();
                cnn.Close();
                cmd.Dispose();
            }
            lvStud.DataBind();
            ctlStudentInfoSame.Checked = false;
            ctlStudentName.Text = "";
            ctlStudentEmail.Text = "";
            //ctlStudentCourse.SelectedIndex = -1;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "addstud", "setTimeout(function(){ window.scrollTo(0,$('#stud').offset().top-$('.navbar-fixed-top').height());},100);", true);
            //var p2 = ctlStudentName.Text;
            //var p3 = ctlStudentEmail.Text;
            //var p4 = ctlStudentCourse.SelectedValue;

            //UserInfo.AddStudent(AuthenticatedUser, p2, p3, p4);
            //StudentInfo();
        }

        protected void lvStud_DataBound(object sender, EventArgs e)
        {
            phNoStud.Visible = lvStud.Items.Count == 0;
            lvCart.DataBind();
        }

        protected void lvCart_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            lvStud.DataBind();
        }
    }
}