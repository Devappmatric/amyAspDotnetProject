using System;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Web;
using System.Web.UI.WebControls;

namespace ProductivityPointGlobal.cart
{
    public partial class AccountEdit2 : System.Web.UI.Page
    {
        public string AuthenticatedUser { get; private set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            AppHelpers.PageTitle("Productivity Point Learning Solutions - View/Edit Account");
            AppHelpers.MetaData("description", "");
            AppHelpers.MetaData("keywords", "View/Edit Account, Productivity Point Learning Solutions");

            //ctlShowStudentNotification.Visible = false;
      
            var usernameCookie = Request.Cookies["UserSettings"];

            if (usernameCookie != null)
            {
                AuthenticatedUser = usernameCookie.Value;
            }
            else
            {
                //Response.Redirect("login.aspx");
            }

            if (IsPostBack)
                return;

            //SelectedCourses();
            AccountInfo();
            BillingInfo();
            BillingInfoBLock.Visible = false;
			//StudentInfo();
		}

        protected void AccountInfo()
        {
            ctlEditAccountInfo.DataSource = UserInfo.AccountInfo(AuthenticatedUser);
            ctlEditAccountInfo.DataBind();
        }
        protected void BillingInfo()
        {
            ctlEditBillingInfo.DataSource = UserInfo.BillingInfo(AuthenticatedUser);
            ctlEditBillingInfo.DataBind();
        }
        //protected void StudentInfo()
        //{
        //    DataTable dt = UserInfo.StudentInfo(AuthenticatedUser);


        //    ctlStudentList.DataSource = dt;
        //    ctlStudentList.DataBind();

        //}

        //protected void SelectedCourses()
        //{
        //    var dt = ShoppingCartAccess.GetSelectedCourses();

        //    ctlStudentCourse.DataSource = dt;
        //    ctlStudentCourse.DataTextField = "courseName";
        //    ctlStudentCourse.DataValueField = "courseName";
        //    ctlStudentCourse.DataBind();
        //}

        //protected void ctlAddStudent_Click(object sender, EventArgs e)
        //{
        //    using(var cnn=new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["SQLConnectionProd"].ConnectionString))
        //    {
        //        var cmd = new System.Data.SqlClient.SqlCommand("dbo.tblCartStudents_i", cnn)
        //        {
        //            CommandType = System.Data.CommandType.StoredProcedure
        //        };
        //        cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 100).Value = ctlStudentName.Text.Trim();
        //        cmd.Parameters.Add("@email", SqlDbType.VarChar, 255).Value = ctlStudentEmail.Text.Trim();
        //        cmd.Parameters.Add("@cartId", SqlDbType.Int).Value = int.Parse(ctlStudentCourse.SelectedValue);
        //        cnn.Open();
        //        cmd.ExecuteNonQuery();
        //        cnn.Close();
        //        cmd.Dispose();
        //    }
        //    lvStud.DataBind();
        //    ctlStudentInfoSame.Checked = false;
        //    ctlStudentName.Text = "";
        //    ctlStudentEmail.Text = "";
        //    ctlStudentCourse.SelectedIndex = -1;
        //    //var p2 = ctlStudentName.Text;
        //    //var p3 = ctlStudentEmail.Text;
        //    //var p4 = ctlStudentCourse.SelectedValue;

        //    //UserInfo.AddStudent(AuthenticatedUser, p2, p3, p4);
        //    //StudentInfo();
        //}

        //protected void ctlRemoveStudent_Click(object sender, EventArgs e)
        //{
        //    for (var i = 0; i < ctlStudentList.Rows.Count; i++)
        //    {
        //        var row = ctlStudentList.Rows[i];
        //        var isChecked = ((CheckBox)row.FindControl("ctlRemove")).Checked;

        //        if (!isChecked)
        //            continue;
        //        var key = ctlStudentList.DataKeys[row.DataItemIndex];

        //        if (key == null)
        //            continue;
        //        var dataKey = (int)key.Value;
        //        ShoppingCartAccess.RemoveStudent(dataKey.ToString(CultureInfo.InvariantCulture));
        //    }
        //    StudentInfo();
        //}

        protected void ctlPlaceOrder_Click(object sender, EventArgs e)
        {
            var accountInfo = UserInfo.AccountInfo(AuthenticatedUser);

            var isGuest = accountInfo.Rows[0]["IsGuestUser"].ToString().ToLower() == "1";
            if (isGuest)
            {
                //if the user is a guest update email and redirect to student info page
                var email = ((TextBox)ctlEditAccountInfo.FindControl("ctlEmail")).Text.Trim();
                UserInfo.UpdateUserEmail(AuthenticatedUser, email);
                AuthenticatedUser = email;
                ctlEditAccountInfo_ItemUpdating(sender, null);

                var userNameCookie = Request.Cookies.Get("UserSettings");
                userNameCookie = new HttpCookie("UserSettings");
                userNameCookie.Value = email; // or use email/temp ID
                userNameCookie.Expires = DateTime.Now.AddDays(7); // Optional expiry
                Response.Cookies.Add(userNameCookie);
            }
            else
            {
                ctlEditAccountInfo_ItemUpdating(sender, null);
            }

            Response.Redirect("~/cart/StudentInfo.aspx");
        }

        protected void ctlApplyUpdate_Click(object sender, EventArgs e)
        {
            UpdateContactInfo();
        }

        private void UpdateContactInfo()
        {
            if (ctlEditAccountInfo.CurrentMode == FormViewMode.Edit)
            {
                ctlEditAccountInfo.UpdateItem(true);
                //Response.Redirect("~/cart/account-edit.aspx");
            }
            else
            {
               // ctlApplyUpdate.Enabled = false;
                //Response.Redirect("~/cart/account-edit.aspx");
            }
        }

        protected void ctlApplyBillingUpdate_Click(object sender, EventArgs e)
        {
            UpdateContactInfo();
            if (ctlEditBillingInfo.CurrentMode == FormViewMode.Edit)
            {
                ctlEditBillingInfo.UpdateItem(true);
                Response.Redirect("~/cart/account-edit2.aspx");
            }
            else
            {
                Response.Redirect("~/cart/account-edit2.aspx");
            }
        }

        protected void ctlUpdateAccountInfo_Click(object sender, EventArgs e)
        {
            ctlEditAccountInfo.ChangeMode(FormViewMode.Edit);
        }

        protected void ctlUpdateBillingInfo_Click(object sender, EventArgs e)
        {
            ctlEditBillingInfo.ChangeMode(FormViewMode.Edit);
        }

        protected void ctlEditProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/cart/account-edit.aspx");
        }

        //protected void ctlStudentList_DataBound(object sender, EventArgs e)
        //{
        //    ctlRemoveStudent.Visible = ctlStudentList.Rows.Count > 0;

        //    if (ctlStudentList.Rows.Count > 0)
        //    {
        //        ctlShowStudentNotification.Visible = false;
        //        ctlPlaceOrder.Enabled = true;
        //    }
        //    else
        //    {
        //        ctlShowStudentNotification.Visible = true;
        //        ctlPlaceOrder.Enabled = false;
        //    }
        //}

        protected void ctlBillingInfoSame_CheckedChanged(object sender, EventArgs e)
        {
            var billingInfoSame = (CheckBox)ctlEditAccountInfo.FindControl("ctlBillingInfoSame");

            if (!billingInfoSame.Checked)
            {
                BillingInfoBLock.Visible = true;
				var billingFirstName = (TextBox)ctlEditBillingInfo.FindControl("ctlBillingFirstName");
                var billingLastName = (TextBox)ctlEditBillingInfo.FindControl("ctlBillingLastName");
                var billingPhone = (TextBox)ctlEditBillingInfo.FindControl("ctlBillingPhone");
                var billingCompany = (TextBox)ctlEditBillingInfo.FindControl("ctlBillingCompany");
                var billingAddress = (TextBox)ctlEditBillingInfo.FindControl("ctlBillingAddress");
                var billingCity = (TextBox)ctlEditBillingInfo.FindControl("ctlBillingCity");
                var billingCountry = (DropDownList)ctlEditBillingInfo.FindControl("ctlBillingCountry");
                var billingState = (TextBox)ctlEditBillingInfo.FindControl("ctlBillingState");
                var billingZipcode = (TextBox)ctlEditBillingInfo.FindControl("ctlBillingZipCode");
                var email = (TextBox)ctlEditBillingInfo.FindControl("ctlEmail");

                billingFirstName.Text = "";
                billingLastName.Text = "";
                billingPhone.Text = "";
                billingCompany.Text = "";
                billingAddress.Text = "";
                billingCity.Text = "";
                billingCountry.Text = "";
                billingState.Text = "";
                billingZipcode.Text = "";
            }
            else
            {
				BillingInfoBLock.Visible = false;
				var firstName = (TextBox) ctlEditAccountInfo.FindControl("ctlFirstName");
                var lastName = (TextBox) ctlEditAccountInfo.FindControl("ctlLastName");
                var phone = (TextBox) ctlEditAccountInfo.FindControl("ctlPhone");
                var company = (TextBox) ctlEditAccountInfo.FindControl("ctlCompany");
                var address = (TextBox) ctlEditAccountInfo.FindControl("ctlAddress");
                var city = (TextBox) ctlEditAccountInfo.FindControl("ctlCity");
                var country = (DropDownList) ctlEditAccountInfo.FindControl("ctlCountry");
                var state = (TextBox) ctlEditAccountInfo.FindControl("ctlState");
                var zipcode = (TextBox) ctlEditAccountInfo.FindControl("ctlZipCode");

                var billingFirstName = (TextBox)ctlEditBillingInfo.FindControl("ctlBillingFirstName");
                var billingLastName = (TextBox)ctlEditBillingInfo.FindControl("ctlBillingLastName");
                var billingPhone = (TextBox)ctlEditBillingInfo.FindControl("ctlBillingPhone");
                var billingCompany = (TextBox)ctlEditBillingInfo.FindControl("ctlBillingCompany");
                var billingAddress = (TextBox)ctlEditBillingInfo.FindControl("ctlBillingAddress");
                var billingCity = (TextBox)ctlEditBillingInfo.FindControl("ctlBillingCity");
                var billingCountry = (DropDownList)ctlEditBillingInfo.FindControl("ctlBillingCountry");
                var billingState = (TextBox)ctlEditBillingInfo.FindControl("ctlBillingState");
                var billingZipcode = (TextBox)ctlEditBillingInfo.FindControl("ctlBillingZipCode");

                billingFirstName.Text = firstName.Text;
                billingLastName.Text = lastName.Text;
                billingPhone.Text = phone.Text;
                billingCompany.Text = company.Text;
                billingAddress.Text = address.Text;
                billingCity.Text = city.Text;
                billingCountry.SelectedValue = country.SelectedItem.Value;
                billingState.Text = state.Text;
                billingZipcode.Text = zipcode.Text;
            }
        }

        protected void ctlEditAccountInfo_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            var firstName = ((TextBox)ctlEditAccountInfo.FindControl("ctlFirstName")).Text;
            var lastName = ((TextBox)ctlEditAccountInfo.FindControl("ctlLastName")).Text;
            var phone = ((TextBox)ctlEditAccountInfo.FindControl("ctlPhone")).Text;
            var company = ((TextBox)ctlEditAccountInfo.FindControl("ctlCompany")).Text;
            var address = ((TextBox)ctlEditAccountInfo.FindControl("ctlAddress")).Text;
            var city = ((TextBox)ctlEditAccountInfo.FindControl("ctlCity")).Text;
            var country = ((DropDownList)ctlEditAccountInfo.FindControl("ctlCountry")).SelectedItem.Value;
            var state = ((TextBox)ctlEditAccountInfo.FindControl("ctlState")).Text;
            var zipcode = ((TextBox)ctlEditAccountInfo.FindControl("ctlZipCode")).Text;
            var email = ((TextBox)ctlEditAccountInfo.FindControl("ctlEmail")).Text;

            UserInfo.UpdateUserInfo(AuthenticatedUser, firstName, lastName, phone, company, address, city, country, state, zipcode);
            var billingInfoSame = (CheckBox)ctlEditAccountInfo.FindControl("ctlBillingInfoSame");
            if (billingInfoSame.Checked)
                UserInfo.UpdateBillingInfo(AuthenticatedUser, firstName, lastName, phone, company, address, city, country, state, zipcode);
            else
                ctlEditBillingInfo_ItemUpdating(sender, e);
        }

        protected void ctlEditBillingInfo_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            var billingFirstName = ((TextBox)ctlEditBillingInfo.FindControl("ctlBillingFirstName")).Text;
            var billingLastName = ((TextBox)ctlEditBillingInfo.FindControl("ctlBillingLastName")).Text;
            var billingPhone = ((TextBox)ctlEditBillingInfo.FindControl("ctlBillingPhone")).Text;
            var billingCompany = ((TextBox)ctlEditBillingInfo.FindControl("ctlBillingCompany")).Text;
            var billingAddress = ((TextBox)ctlEditBillingInfo.FindControl("ctlBillingAddress")).Text;
            var billingCity = ((TextBox)ctlEditBillingInfo.FindControl("ctlBillingCity")).Text;
            var billingCountry = ((DropDownList)ctlEditBillingInfo.FindControl("ctlBillingCountry")).SelectedItem.Value;
            var billingState = ((TextBox)ctlEditBillingInfo.FindControl("ctlBillingState")).Text;
            var billingZipcode = ((TextBox)ctlEditBillingInfo.FindControl("ctlBillingZipCode")).Text;
            var email = ((TextBox)ctlEditAccountInfo.FindControl("ctlEmail")).Text;

            UserInfo.UpdateBillingInfo(AuthenticatedUser, billingFirstName, billingLastName, billingPhone, billingCompany, billingAddress, billingCity, billingCountry, billingState, billingZipcode);
        }

        //protected void ctlStudentInfoSame_CheckedChanged(object sender, EventArgs e)
        //{
        //    if (ctlEditAccountInfo.CurrentMode != FormViewMode.Edit) return;
        //    if (ctlStudentInfoSame.Checked)
        //    {
        //        var fName = (TextBox)ctlEditAccountInfo.FindControl("ctlFirstName");
        //        var lName = (TextBox)ctlEditAccountInfo.FindControl("ctlLastName");

        //        var firstName = fName.Text;
        //        var lastName = lName.Text;

        //        ctlStudentName.Text = firstName + " " + lastName;
        //        ctlStudentEmail.Text = AuthenticatedUser;
        //    }
        //    else
        //    {
        //        ctlStudentName.Text = "";
        //        ctlStudentEmail.Text = "";
        //    }
        //}
    }
}