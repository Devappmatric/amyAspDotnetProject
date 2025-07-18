using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace ProductivityPointGlobal
{
    public partial class DefaultMaster : MasterPage
    {
        public string AuthenticatedUser { get; private set; }
        public static DataTable TechnicalBrands { get; private set; }
        public static DataTable TechnicalTopics { get; private set; }
        public static DataTable DesktopTopics { get; private set; }
        public static DataTable ProfessionalTopics { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ctlMasterForm.DefaultButton = "ctlSearchHome";

            Page.Header.DataBind();
            //var metaMasterTag1 = new HtmlMeta { Name = "robots", Content = "index,follow" };
            //head.Controls.Add(metaMasterTag1);

            var copyYear = DateTime.Now.Year.ToString(CultureInfo.InvariantCulture);
            ctlFooterYear.Text = copyYear;

            var usernameCookie = Request.Cookies["UserSettings"];

            ctlLogOut.Attributes.Add("onClick", "return false");
            ctlLogOutMobile.Attributes.Add("onClick", "return false");
            
            if (!IsPostBack)
            {
                GetMenuItems();

                //For Remember Me Cookie
                var rememberMeUserNameCookie = Request.Cookies.Get("RememberMeUserName");
                var rememberMePasswordCookie = Request.Cookies.Get("RememberMePassword");
                if ( rememberMeUserNameCookie != null && rememberMePasswordCookie != null)
                {
                    Username.Text = rememberMeUserNameCookie.Value;
                    Password.Text = rememberMePasswordCookie.Value;
                }

                //if (usernameCookie == null && rememberMeUserNameCookie != null && rememberMePasswordCookie != null)
                //{
                //    var admin = UserInfo.UserAuthenticate(rememberMeUserNameCookie.Value, rememberMePasswordCookie.Value);

                //    if (admin?.Rows.Count > 0)
                //    {
                //        usernameCookie = new HttpCookie("UserSettings")
                //        {
                //            ["Username"] = rememberMeUserNameCookie.Value,
                //            Value = rememberMeUserNameCookie.Value,
                //            Expires = DateTime.Now.AddDays(1)
                //        };

                //        Response.Cookies.Add(usernameCookie);

                //        PopulateCart();
                //    }
                //}

            }

            if (usernameCookie != null)
            {
                var temp = usernameCookie.Value;
                var userInfo = UserInfo.AccountInfo(temp);
                var firstName = "";
                var isGuestUser = false;
                foreach (DataRow row in userInfo.Rows)
                {
                    firstName= row["firstname"].ToString();
                    isGuestUser = (row["IsGuestUser"].ToString()) == "1";
                }

                if (!isGuestUser)
                {
                    ctlLogOut.Visible = true;
                    ctlLogOut.Text = @"<i class=""fa fa-user""></i> Hello " + firstName;

                    ctlLogOutMobile.Visible = true;
                    ctlLogOutMobile.Text = @"<i class=""fa fa-user""></i> Hello " + firstName;
                    //ctlCart.Visible = true;
                    ctlViewCart.Visible = false;

                    ctlLoginMobile.Visible = false;
                    ctlLogoutMobileHeader.Visible = true;

                    ctlLoginBox.Visible = false;
                    ctlLogOutBox.Visible = true;
                }

                
                //ctlViewCart.Text = "View Cart";
                //ctlViewCart.PostBackUrl = "~/cart/";                
            }
            else
            {
                ctlLoginBox.Visible = true;
                ctlLoginMobile.Visible = true;
                ctlLogoutMobileHeader.Visible = false;

                ctlLogOutBox.Visible = false;

                ctlLogOut.Visible = false;
                ctlLogOutMobile.Visible = false;
                //ctlCart.Visible = true;
                ctlViewCart.Text = @"<i class=""fa fa-user""></i> Log In";
                ctlLoginMobile.Text = @"<i class=""fa fa-user""></i> Log In";
                //ctlViewCartItems.Text = "/ Register";
                //ctlViewCartItems.PostBackUrl = "~/cart/account.aspx";
                //ctlViewCart.PostBackUrl = "~/cart/login.aspx";

                ctlLogOut.Attributes.Add("onClick", "return false");
            }

            
        }

        public static string Clean(string s)
        {
            var sb = new StringBuilder(s);
            sb.Replace(" ", " and ");
            return sb.ToString();
        }

        protected void ctlUserLoginNav_Click(object sender, EventArgs e)
        {

            var username = Username.Text;
            var password = Password.Text;

            var admin = UserInfo.UserAuthenticate(username, password);

            if (admin?.Rows.Count > 0)
            {
                PopulateCart();
            }

            //Add in Cookie
            HttpCookie myCookieUsername = new HttpCookie("RememberMeUserName");
            HttpCookie myCookiePassword = new HttpCookie("RememberMePassword");
            myCookieUsername.Value = "";
            myCookiePassword.Value = "";
            DateTime now = DateTime.Now;

           
            if (ctlRememberMe.Checked)
            { 
                // Set the cookie value.
                var rememberMeUserNameCookie = Request.Cookies.Get("RememberMeUserName");
                var rememberMePasswordCookie = Request.Cookies.Get("RememberMePassword");
                myCookieUsername.Value = username;
                myCookiePassword.Value = password;


            }
            else
            {
                myCookieUsername.Value = "";
                myCookiePassword.Value = "";
            }
            // Set the cookie expiration date.
            myCookieUsername.Expires = now.AddYears(1); 
            myCookiePassword.Expires = now.AddYears(1);

           
            // Add the cookie.
            Response.Cookies.Add(myCookieUsername);
            Response.Cookies.Add(myCookiePassword);
            

           

            if (admin?.Rows.Count > 0)
            {
                var userName = Username.Text;

                var userNameCookie = Request.Cookies.Get("UserSettings");

                if (userNameCookie == null)
                {
                    userNameCookie = new HttpCookie("UserSettings")
                    {
                        ["Username"] = userName,
                        Value = userName,
                        Expires = DateTime.Now.AddDays(1)
                    };


                    Response.Cookies.Add(userNameCookie);
                }

                // Reset Student List
                //ResetStudentList();
               
                Response.Redirect("~/default.aspx");//account-edit.aspx
            }
        }

        private void PopulateCart()
        {
            var usernameCookie = Request.Cookies["UserSettings"];
            var username = "";
            if (usernameCookie != null)
            {
                username = usernameCookie.Value;
            }
            if (username == "")
                return;
            var carts = UserInfo.GetUserCart(username);
            if (carts.Rows.Count > 0)
            {
                foreach (DataRow row in carts.Rows)
                {
                    var classId = row["courseId"].ToString();
                    var currentList = ShoppingCartAccess.GetItems();
                    bool isCourseSame = false;
                    foreach (DataRow item in currentList.Rows)
                    {
                        var temp = item["classId"].ToString();
                        if (temp == classId)
                        {
                            isCourseSame=true;
                            break;
                        }
                    }
                    if (isCourseSame)
                    {
                        continue;
                    }
                    ShoppingCartAccess.AddItem(classId, username);
                }
            }
        }

        protected void ctlPasswordResetNav_Click(object sender,EventArgs e)
        {
            Response.Redirect("~/cart/login.aspx?forgotpassword=true");
        }

        protected void ctlViewCart_Click(object sender, EventArgs e)
        {
            //Response.Redirect("~/cart/");
        }

        protected void ctlLogin_OnClick(object sender, EventArgs e)
        {
            
        }

        protected void ctlSearchHome_OnClick(object sender, EventArgs e)
        {
            //var regex = new Regex(@"[()[!\];',.\/@#$%^&*\-\\\\={}:""<>?_~`]");
            var regex = new Regex(@"[^a-z0-9]+",RegexOptions.IgnoreCase);
            //var matches = regex.Matches(ctlSearchInputHome.Text);
            string srch = regex.Replace(ctlSearchInputHome.Text.ToLower(), "-");
            Response.Redirect("~/search/" + srch,true);
            //if (matches.Count > 0)
            //{
            //    ctlSearchInputHome.Text = "Illegal Character Detected!";
            //}
            //else
            //{
            //    Response.Redirect("~/Search/" + ctlSearchInputHome.Text);
            //}
        }

        protected void ctlLogOutNav_OnClick(object sender, EventArgs e)
        {
            var coo = new HttpCookie("UserSettings", "") { Expires = DateTime.Now.AddDays(-30) };
            Response.Cookies.Add(coo);
            //coo = new HttpCookie("CartID", "") { Expires = DateTime.Now.AddDays(-30) };
            //Response.Cookies.Add(coo);
            //var httpCookie = Response.Cookies["UserSettings"];
            //if (httpCookie != null)
            //    httpCookie.Expires = DateTime.Now.AddDays(-1);
            Session.Abandon();
            Response.Redirect("~/");
        }

        protected void GetMenuItems()
        {
            TechnicalBrands = ContentAdditional.GetMainTechnicalCoursesCatalogBrands("Technical Courses");
            TechnicalTopics = ContentAdditional.GetMainTechnicalCoursesCatalogTopic("Technical Courses");
            DesktopTopics = ContentAdditional.GetMainTechnicalCoursesCatalogTopic("Desktop Applications");
            ProfessionalTopics = ContentAdditional.GetMainTechnicalCoursesCatalogTopic("Professional Development Skills");

        }


        protected void lvStud_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            lvCart.DataBind();
        }

        protected void lvStud_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            lvCart.DataBind();
        }

        protected void lvCart_DataBound(object sender, EventArgs e)
        {
            //pnlCouponApplied.Visible = false;
            if (lvCart.Items.Count == 0)
            {
                //pnlTotal.Visible = false;
                //ctlCheckOut.Visible = false;
                //phStud.Visible = false;
                return;
            }
            //phStud.Visible = true;
            //pnlCouponApplied.Visible = true;
            //pnlTotal.Visible = true;
            //ctlCheckOut.Visible = true;
            decimal total = 0;
            //foreach (var row in lvCart.Items)
            //{
            //    decimal linetotal = decimal.Parse((row.FindControl("price") as Literal).Text);
            //    total += linetotal;
            //}
            //ctlTotalCostReg.Text = total.ToString("c");
            int couponDsc = 0;
            //if (Session["CouponDiscount"] != null)
            //{
            //    couponDsc = (int)Session["CouponDiscount"];
            //    ctlDiscountTotal.Text = (total * couponDsc / 100).ToString("c");
            //    pnlCouponApplied.Visible = true;
            //}
            //ctlTotalCost.Text = (total * (100 - couponDsc) / 100).ToString("c");
            //(lvCart.FindControl("ltrTotal") as Literal).Text = total.ToString("c");
            //lvStud.DataBind();
        }

        protected void ctlCheckOutNav_Click(object sender, EventArgs e)
        {

            var usernameCookie = Request.Cookies["UserSettings"];

            if (usernameCookie != null)
            {
                AuthenticatedUser = usernameCookie.Value;
                //Response.Redirect("/cart/account-edit2.aspx", true);
                Response.Redirect("/cart/cart2.aspx", true);
            }
            else
            {
                //Response.Redirect("/cart/login.aspx");
                //Response.Redirect("/cart/account-edit2.aspx", true);
                Response.Redirect("/cart/cart2.aspx", true);
            }
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {

        }
    }
}