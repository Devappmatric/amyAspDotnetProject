<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="account-edit2.aspx.cs" Inherits="ProductivityPointGlobal.cart.AccountEdit2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .checkout-menu > a {
            border-radius: 8px !important;
        }

        .form-group {
            display: flex;
        }

            .form-group > label {
                width: 180px;
            }

        .checkout-header-style {
            background-color: #23446a !important;
            padding: 10px;
            color: White;
            margin: -15px;
            font-size: 24px;
            text-align: center;
        }

        .contact-and-billing-block {
            padding: 10px;
        }

            .contact-and-billing-block > div {
                background-color: #efefef;
                margin-top: 0px;
                height: 590px;
                padding: 10px;
            }
    </style>

    <style>
        .fa-button-right {
            position: relative;
            padding-left: 30px; /* Space for the icon */
        }

            .fa-button-right::after {
                content: "\f061"; /* FontAwesome right arrow icon */
                font-family: "Font Awesome 6 Free";
                font-weight: 900;
                position: absolute;
                left: 10px;
                top: 50%;
                transform: translateY(-50%);
            }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid view subPage">
        <div class="row subSectionPadding1">
            <div class="container">
                <div class="row padding20T">

                    <div class="col-lg-4 col-md-5 hidden-sm hidden-xs margin20T responsiveCol">
                        <%--<uc:ContactForm runat="server" />--%>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--<uc:Search ID="ucSearch" runat="server" />--%>

    <div class="container-fluid bgWhite subPage padding75B">
        <div class="row" style="margin-top: 40px;">
            <div class="container ">
                <div class="row">
                    <div class="col-lg-8 col-md-6 col-sm-12 col-xs-12">

                        <uc:ShoppingCart2 ID="uc1" Selection="1" runat="server" />

                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <div class="row" style="padding-top: 40px;">
                                    <div class="col-lg-6 contact-and-billing-block subSectionPadding" style="background-color: #efefef">
                                        <div>
                                            <p class="sectionHeadingSubPage text-left checkout-header-style">Contact Information</p>
                                            <div class="form-group"><span>&nbsp;</span></div>
                                            <asp:FormView ID="ctlEditAccountInfo" DataKeyNames="id" AllowPaging="false" RenderOuterTable="False" DefaultMode="Edit" runat="server" OnItemUpdating="ctlEditAccountInfo_ItemUpdating">
                                                <EditItemTemplate>
                                                    <div class="form-group">
                                                        <asp:CheckBox ID="ctlBillingInfoSame" OnCheckedChanged="ctlBillingInfoSame_CheckedChanged" Checked="true" CausesValidation="false" AutoPostBack="true" runat="server" />&nbsp;&nbsp;My Contact and Billing Info are the same
                                                   
                                                    </div>
                                                    <div class="form-group">
                                                        <label>First Name</label>
                                                        <asp:TextBox ID="ctlFirstName" CssClass="form-control" AutoCompleteType="None" Text='<%# Bind("firstname") %>' placeholder="First Name" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Last Name</label>
                                                        <asp:TextBox ID="ctlLastName" CssClass="form-control" AutoCompleteType="None" Text='<%# Bind("lastname") %>' placeholder="Last Name" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Email</label>
                                                        <asp:TextBox ID="ctlEmail" CssClass="form-control" AutoCompleteType="None" Text='<%# Bind("username") %>' placeholder="Email" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Phone Number</label>
                                                        <asp:TextBox ID="ctlPhone" CssClass="form-control" AutoCompleteType="None" Text='<%# Bind("phone") %>' placeholder="Phone Number" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Company</label>
                                                        <asp:TextBox ID="ctlCompany" CssClass="form-control" AutoCompleteType="None" Text='<%# Bind("company") %>' placeholder="Company" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Address</label>
                                                        <asp:TextBox ID="ctlAddress" CssClass="form-control" AutoCompleteType="None" Text='<%# Bind("address") %>' placeholder="Address" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>City</label>
                                                        <asp:TextBox ID="ctlCity" CssClass="form-control" AutoCompleteType="None" Text='<%# Bind("city") %>' placeholder="City" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Country</label>
                                                        <asp:DropDownList ID="ctlCountry" CssClass="form-control" SelectedValue='<%# Bind("country") %>' runat="server">
                                                            <asp:ListItem Value="" Selected="True">Country</asp:ListItem>
                                                            <asp:ListItem Value="AF">Afghanistan</asp:ListItem>
                                                            <asp:ListItem Value="AL">Albania</asp:ListItem>
                                                            <asp:ListItem Value="DZ">Algeria</asp:ListItem>
                                                            <asp:ListItem Value="AS">American Samoa</asp:ListItem>
                                                            <asp:ListItem Value="AD">Andorra</asp:ListItem>
                                                            <asp:ListItem Value="AO">Angola</asp:ListItem>
                                                            <asp:ListItem Value="AI">Anguilla</asp:ListItem>
                                                            <asp:ListItem Value="AQ">Antarctica</asp:ListItem>
                                                            <asp:ListItem Value="AG">Antigua And Barbuda</asp:ListItem>
                                                            <asp:ListItem Value="AR">Argentina</asp:ListItem>
                                                            <asp:ListItem Value="AM">Armenia</asp:ListItem>
                                                            <asp:ListItem Value="AW">Aruba</asp:ListItem>
                                                            <asp:ListItem Value="AU">Australia</asp:ListItem>
                                                            <asp:ListItem Value="AT">Austria</asp:ListItem>
                                                            <asp:ListItem Value="AZ">Azerbaijan</asp:ListItem>
                                                            <asp:ListItem Value="BS">Bahamas</asp:ListItem>
                                                            <asp:ListItem Value="BH">Bahrain</asp:ListItem>
                                                            <asp:ListItem Value="BD">Bangladesh</asp:ListItem>
                                                            <asp:ListItem Value="BB">Barbados</asp:ListItem>
                                                            <asp:ListItem Value="BY">Belarus</asp:ListItem>
                                                            <asp:ListItem Value="BE">Belgium</asp:ListItem>
                                                            <asp:ListItem Value="BZ">Belize</asp:ListItem>
                                                            <asp:ListItem Value="BJ">Benin</asp:ListItem>
                                                            <asp:ListItem Value="BM">Bermuda</asp:ListItem>
                                                            <asp:ListItem Value="BT">Bhutan</asp:ListItem>
                                                            <asp:ListItem Value="BO">Bolivia</asp:ListItem>
                                                            <asp:ListItem Value="BA">Bosnia And Herzegowina</asp:ListItem>
                                                            <asp:ListItem Value="BW">Botswana</asp:ListItem>
                                                            <asp:ListItem Value="BV">Bouvet Island</asp:ListItem>
                                                            <asp:ListItem Value="BR">Brazil</asp:ListItem>
                                                            <asp:ListItem Value="IO">British Indian Ocean Territory</asp:ListItem>
                                                            <asp:ListItem Value="BN">Brunei Darussalam</asp:ListItem>
                                                            <asp:ListItem Value="BG">Bulgaria</asp:ListItem>
                                                            <asp:ListItem Value="BF">Burkina Faso</asp:ListItem>
                                                            <asp:ListItem Value="BI">Burundi</asp:ListItem>
                                                            <asp:ListItem Value="KH">Cambodia</asp:ListItem>
                                                            <asp:ListItem Value="CM">Cameroon</asp:ListItem>
                                                            <asp:ListItem Value="CA">Canada</asp:ListItem>
                                                            <asp:ListItem Value="CV">Cape Verde</asp:ListItem>
                                                            <asp:ListItem Value="KY">Cayman Islands</asp:ListItem>
                                                            <asp:ListItem Value="CF">Central African Republic</asp:ListItem>
                                                            <asp:ListItem Value="TD">Chad</asp:ListItem>
                                                            <asp:ListItem Value="CL">Chile</asp:ListItem>
                                                            <asp:ListItem Value="CN">China</asp:ListItem>
                                                            <asp:ListItem Value="CX">Christmas Island</asp:ListItem>
                                                            <asp:ListItem Value="CC">Cocos (Keeling) Islands</asp:ListItem>
                                                            <asp:ListItem Value="CO">Colombia</asp:ListItem>
                                                            <asp:ListItem Value="KM">Comoros</asp:ListItem>
                                                            <asp:ListItem Value="CG">Congo</asp:ListItem>
                                                            <asp:ListItem Value="CK">Cook Islands</asp:ListItem>
                                                            <asp:ListItem Value="CR">Costa Rica</asp:ListItem>
                                                            <asp:ListItem Value="CI">Cote D'Ivoire</asp:ListItem>
                                                            <asp:ListItem Value="HR">Croatia (Local Name: Hrvatska)</asp:ListItem>
                                                            <asp:ListItem Value="CU">Cuba</asp:ListItem>
                                                            <asp:ListItem Value="CY">Cyprus</asp:ListItem>
                                                            <asp:ListItem Value="CZ">Czech Republic</asp:ListItem>
                                                            <asp:ListItem Value="DK">Denmark</asp:ListItem>
                                                            <asp:ListItem Value="DJ">Djibouti</asp:ListItem>
                                                            <asp:ListItem Value="DM">Dominica</asp:ListItem>
                                                            <asp:ListItem Value="DO">Dominican Republic</asp:ListItem>
                                                            <asp:ListItem Value="TP">East Timor</asp:ListItem>
                                                            <asp:ListItem Value="EC">Ecuador</asp:ListItem>
                                                            <asp:ListItem Value="EG">Egypt</asp:ListItem>
                                                            <asp:ListItem Value="SV">El Salvador</asp:ListItem>
                                                            <asp:ListItem Value="GQ">Equatorial Guinea</asp:ListItem>
                                                            <asp:ListItem Value="ER">Eritrea</asp:ListItem>
                                                            <asp:ListItem Value="EE">Estonia</asp:ListItem>
                                                            <asp:ListItem Value="ET">Ethiopia</asp:ListItem>
                                                            <asp:ListItem Value="FK">Falkland Islands (Malvinas)</asp:ListItem>
                                                            <asp:ListItem Value="FO">Faroe Islands</asp:ListItem>
                                                            <asp:ListItem Value="FJ">Fiji</asp:ListItem>
                                                            <asp:ListItem Value="FI">Finland</asp:ListItem>
                                                            <asp:ListItem Value="FR">France</asp:ListItem>
                                                            <asp:ListItem Value="GF">French Guiana</asp:ListItem>
                                                            <asp:ListItem Value="PF">French Polynesia</asp:ListItem>
                                                            <asp:ListItem Value="TF">French Southern Territories</asp:ListItem>
                                                            <asp:ListItem Value="GA">Gabon</asp:ListItem>
                                                            <asp:ListItem Value="GM">Gambia</asp:ListItem>
                                                            <asp:ListItem Value="GE">Georgia</asp:ListItem>
                                                            <asp:ListItem Value="DE">Germany</asp:ListItem>
                                                            <asp:ListItem Value="GH">Ghana</asp:ListItem>
                                                            <asp:ListItem Value="GI">Gibraltar</asp:ListItem>
                                                            <asp:ListItem Value="GR">Greece</asp:ListItem>
                                                            <asp:ListItem Value="GL">Greenland</asp:ListItem>
                                                            <asp:ListItem Value="GD">Grenada</asp:ListItem>
                                                            <asp:ListItem Value="GP">Guadeloupe</asp:ListItem>
                                                            <asp:ListItem Value="GU">Guam</asp:ListItem>
                                                            <asp:ListItem Value="GT">Guatemala</asp:ListItem>
                                                            <asp:ListItem Value="GN">Guinea</asp:ListItem>
                                                            <asp:ListItem Value="GW">Guinea-Bissau</asp:ListItem>
                                                            <asp:ListItem Value="GY">Guyana</asp:ListItem>
                                                            <asp:ListItem Value="HT">Haiti</asp:ListItem>
                                                            <asp:ListItem Value="HM">Heard And Mc Donald Islands</asp:ListItem>
                                                            <asp:ListItem Value="VA">Holy See (Vatican City State)</asp:ListItem>
                                                            <asp:ListItem Value="HN">Honduras</asp:ListItem>
                                                            <asp:ListItem Value="HK">Hong Kong</asp:ListItem>
                                                            <asp:ListItem Value="HU">Hungary</asp:ListItem>
                                                            <asp:ListItem Value="IS">Icel And</asp:ListItem>
                                                            <asp:ListItem Value="IN">India</asp:ListItem>
                                                            <asp:ListItem Value="ID">Indonesia</asp:ListItem>
                                                            <asp:ListItem Value="IR">Iran (Islamic Republic Of)</asp:ListItem>
                                                            <asp:ListItem Value="IQ">Iraq</asp:ListItem>
                                                            <asp:ListItem Value="IE">Ireland</asp:ListItem>
                                                            <asp:ListItem Value="IL">Israel</asp:ListItem>
                                                            <asp:ListItem Value="IT">Italy</asp:ListItem>
                                                            <asp:ListItem Value="JM">Jamaica</asp:ListItem>
                                                            <asp:ListItem Value="JP">Japan</asp:ListItem>
                                                            <asp:ListItem Value="JO">Jordan</asp:ListItem>
                                                            <asp:ListItem Value="KZ">Kazakhstan</asp:ListItem>
                                                            <asp:ListItem Value="KE">Kenya</asp:ListItem>
                                                            <asp:ListItem Value="KI">Kiribati</asp:ListItem>
                                                            <asp:ListItem Value="KP">Korea, Dem People'S Republic</asp:ListItem>
                                                            <asp:ListItem Value="KR">Korea, Republic Of</asp:ListItem>
                                                            <asp:ListItem Value="KW">Kuwait</asp:ListItem>
                                                            <asp:ListItem Value="KG">Kyrgyzstan</asp:ListItem>
                                                            <asp:ListItem Value="LA">Lao People'S Dem Republic</asp:ListItem>
                                                            <asp:ListItem Value="LV">Latvia</asp:ListItem>
                                                            <asp:ListItem Value="LB">Lebanon</asp:ListItem>
                                                            <asp:ListItem Value="LS">Lesotho</asp:ListItem>
                                                            <asp:ListItem Value="LR">Liberia</asp:ListItem>
                                                            <asp:ListItem Value="LY">Libyan Arab Jamahiriya</asp:ListItem>
                                                            <asp:ListItem Value="LI">Liechtenstein</asp:ListItem>
                                                            <asp:ListItem Value="LT">Lithuania</asp:ListItem>
                                                            <asp:ListItem Value="LU">Luxembourg</asp:ListItem>
                                                            <asp:ListItem Value="MO">Macau</asp:ListItem>
                                                            <asp:ListItem Value="MK">Macedonia</asp:ListItem>
                                                            <asp:ListItem Value="MG">Madagascar</asp:ListItem>
                                                            <asp:ListItem Value="MW">Malawi</asp:ListItem>
                                                            <asp:ListItem Value="MY">Malaysia</asp:ListItem>
                                                            <asp:ListItem Value="MV">Maldives</asp:ListItem>
                                                            <asp:ListItem Value="ML">Mali</asp:ListItem>
                                                            <asp:ListItem Value="MT">Malta</asp:ListItem>
                                                            <asp:ListItem Value="MH">Marshall Islands</asp:ListItem>
                                                            <asp:ListItem Value="MQ">Martinique</asp:ListItem>
                                                            <asp:ListItem Value="MR">Mauritania</asp:ListItem>
                                                            <asp:ListItem Value="MU">Mauritius</asp:ListItem>
                                                            <asp:ListItem Value="YT">Mayotte</asp:ListItem>
                                                            <asp:ListItem Value="MX">Mexico</asp:ListItem>
                                                            <asp:ListItem Value="FM">Micronesia, Federated States</asp:ListItem>
                                                            <asp:ListItem Value="MD">Moldova, Republic Of</asp:ListItem>
                                                            <asp:ListItem Value="MC">Monaco</asp:ListItem>
                                                            <asp:ListItem Value="MN">Mongolia</asp:ListItem>
                                                            <asp:ListItem Value="MS">Montserrat</asp:ListItem>
                                                            <asp:ListItem Value="MA">Morocco</asp:ListItem>
                                                            <asp:ListItem Value="MZ">Mozambique</asp:ListItem>
                                                            <asp:ListItem Value="MM">Myanmar</asp:ListItem>
                                                            <asp:ListItem Value="NA">Namibia</asp:ListItem>
                                                            <asp:ListItem Value="NR">Nauru</asp:ListItem>
                                                            <asp:ListItem Value="NP">Nepal</asp:ListItem>
                                                            <asp:ListItem Value="NL">Netherlands</asp:ListItem>
                                                            <asp:ListItem Value="AN">Netherlands Ant Illes</asp:ListItem>
                                                            <asp:ListItem Value="NC">New Caledonia</asp:ListItem>
                                                            <asp:ListItem Value="NZ">New Zealand</asp:ListItem>
                                                            <asp:ListItem Value="NI">Nicaragua</asp:ListItem>
                                                            <asp:ListItem Value="NE">Niger</asp:ListItem>
                                                            <asp:ListItem Value="NG">Nigeria</asp:ListItem>
                                                            <asp:ListItem Value="NU">Niue</asp:ListItem>
                                                            <asp:ListItem Value="NF">Norfolk Island</asp:ListItem>
                                                            <asp:ListItem Value="MP">Northern Mariana Islands</asp:ListItem>
                                                            <asp:ListItem Value="NO">Norway</asp:ListItem>
                                                            <asp:ListItem Value="OM">Oman</asp:ListItem>
                                                            <asp:ListItem Value="PK">Pakistan</asp:ListItem>
                                                            <asp:ListItem Value="PW">Palau</asp:ListItem>
                                                            <asp:ListItem Value="PA">Panama</asp:ListItem>
                                                            <asp:ListItem Value="PG">Papua New Guinea</asp:ListItem>
                                                            <asp:ListItem Value="PY">Paraguay</asp:ListItem>
                                                            <asp:ListItem Value="PE">Peru</asp:ListItem>
                                                            <asp:ListItem Value="PH">Philippines</asp:ListItem>
                                                            <asp:ListItem Value="PN">Pitcairn</asp:ListItem>
                                                            <asp:ListItem Value="PL">Poland</asp:ListItem>
                                                            <asp:ListItem Value="PT">Portugal</asp:ListItem>
                                                            <asp:ListItem Value="PR">Puerto Rico</asp:ListItem>
                                                            <asp:ListItem Value="QA">Qatar</asp:ListItem>
                                                            <asp:ListItem Value="RE">Reunion</asp:ListItem>
                                                            <asp:ListItem Value="RO">Romania</asp:ListItem>
                                                            <asp:ListItem Value="RU">Russian Federation</asp:ListItem>
                                                            <asp:ListItem Value="RW">Rwanda</asp:ListItem>
                                                            <asp:ListItem Value="KN">Saint K Itts And Nevis</asp:ListItem>
                                                            <asp:ListItem Value="LC">Saint Lucia</asp:ListItem>
                                                            <asp:ListItem Value="VC">Saint Vincent, The Grenadines</asp:ListItem>
                                                            <asp:ListItem Value="WS">Samoa</asp:ListItem>
                                                            <asp:ListItem Value="SM">San Marino</asp:ListItem>
                                                            <asp:ListItem Value="ST">Sao Tome And Principe</asp:ListItem>
                                                            <asp:ListItem Value="SA">Saudi Arabia</asp:ListItem>
                                                            <asp:ListItem Value="SN">Senegal</asp:ListItem>
                                                            <asp:ListItem Value="SC">Seychelles</asp:ListItem>
                                                            <asp:ListItem Value="SL">Sierra Leone</asp:ListItem>
                                                            <asp:ListItem Value="SG">Singapore</asp:ListItem>
                                                            <asp:ListItem Value="SK">Slovakia (Slovak Republic)</asp:ListItem>
                                                            <asp:ListItem Value="SI">Slovenia</asp:ListItem>
                                                            <asp:ListItem Value="SB">Solomon Islands</asp:ListItem>
                                                            <asp:ListItem Value="SO">Somalia</asp:ListItem>
                                                            <asp:ListItem Value="ZA">South Africa</asp:ListItem>
                                                            <asp:ListItem Value="GS">South Georgia , S Sandwich Is.</asp:ListItem>
                                                            <asp:ListItem Value="ES">Spain</asp:ListItem>
                                                            <asp:ListItem Value="LK">Sri Lanka</asp:ListItem>
                                                            <asp:ListItem Value="SH">St. Helena</asp:ListItem>
                                                            <asp:ListItem Value="PM">St. Pierre And Miquelon</asp:ListItem>
                                                            <asp:ListItem Value="SD">Sudan</asp:ListItem>
                                                            <asp:ListItem Value="SR">Suriname</asp:ListItem>
                                                            <asp:ListItem Value="SJ">Svalbard, Jan Mayen Islands</asp:ListItem>
                                                            <asp:ListItem Value="SZ">Sw Aziland</asp:ListItem>
                                                            <asp:ListItem Value="SE">Sweden</asp:ListItem>
                                                            <asp:ListItem Value="CH">Switzerland</asp:ListItem>
                                                            <asp:ListItem Value="SY">Syrian Arab Republic</asp:ListItem>
                                                            <asp:ListItem Value="TW">Taiwan</asp:ListItem>
                                                            <asp:ListItem Value="TJ">Tajikistan</asp:ListItem>
                                                            <asp:ListItem Value="TZ">Tanzania, United Republic Of</asp:ListItem>
                                                            <asp:ListItem Value="TH">Thailand</asp:ListItem>
                                                            <asp:ListItem Value="TG">Togo</asp:ListItem>
                                                            <asp:ListItem Value="TK">Tokelau</asp:ListItem>
                                                            <asp:ListItem Value="TO">Tonga</asp:ListItem>
                                                            <asp:ListItem Value="TT">Trinidad And Tobago</asp:ListItem>
                                                            <asp:ListItem Value="TN">Tunisia</asp:ListItem>
                                                            <asp:ListItem Value="TR">Turkey</asp:ListItem>
                                                            <asp:ListItem Value="TM">Turkmenistan</asp:ListItem>
                                                            <asp:ListItem Value="TC">Turks And Caicos Islands</asp:ListItem>
                                                            <asp:ListItem Value="TV">Tuvalu</asp:ListItem>
                                                            <asp:ListItem Value="UG">Uganda</asp:ListItem>
                                                            <asp:ListItem Value="UA">Ukraine</asp:ListItem>
                                                            <asp:ListItem Value="AE">United Arab Emirates</asp:ListItem>
                                                            <asp:ListItem Value="GB">United Kingdom</asp:ListItem>
                                                            <asp:ListItem Value="US">United States</asp:ListItem>
                                                            <asp:ListItem Value="UM">United States Minor Is.</asp:ListItem>
                                                            <asp:ListItem Value="UY">Uruguay</asp:ListItem>
                                                            <asp:ListItem Value="UZ">Uzbekistan</asp:ListItem>
                                                            <asp:ListItem Value="VU">Vanuatu</asp:ListItem>
                                                            <asp:ListItem Value="VE">Venezuela</asp:ListItem>
                                                            <asp:ListItem Value="VN">Viet Nam</asp:ListItem>
                                                            <asp:ListItem Value="VG">Virgin Islands (British)</asp:ListItem>
                                                            <asp:ListItem Value="VI">Virgin Islands (U.S.)</asp:ListItem>
                                                            <asp:ListItem Value="WF">Wallis And Futuna Islands</asp:ListItem>
                                                            <asp:ListItem Value="EH">Western Sahara</asp:ListItem>
                                                            <asp:ListItem Value="YE">Yemen</asp:ListItem>
                                                            <asp:ListItem Value="YU">Yugoslavia</asp:ListItem>
                                                            <asp:ListItem Value="ZR">Zaire</asp:ListItem>
                                                            <asp:ListItem Value="ZM">Zambia</asp:ListItem>
                                                            <asp:ListItem Value="ZW">Zimbabwe</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>State</label>
                                                        <asp:TextBox ID="ctlState" CssClass="form-control" AutoCompleteType="None" Text='<%# Bind("state") %>' placeholder="State/Province" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Zip Code</label>
                                                        <asp:TextBox ID="ctlZipCode" CssClass="form-control" AutoCompleteType="None" Text='<%# Bind("zipcode") %>' placeholder="Zip Code" runat="server" />
                                                    </div>
                                                </EditItemTemplate>
                                            </asp:FormView>
                                            <div class="form-group text-right">
                                                <asp:Button ID="ctlApplyUpdate" runat="server" CssClass="btn btn-success" Text="Update1" Visible="false" OnClick="ctlApplyUpdate_Click" />
                                            </div>
                                        </div>

                                    </div>

                                    <div runat="server" id="BillingInfoBLock" class="col-lg-6 contact-and-billing-block">
                                        <div>
                                            <p class="sectionHeadingSubPage text-left checkout-header-style">Billing Information</p>
                                            <asp:FormView ID="ctlEditBillingInfo" DataKeyNames="id" AllowPaging="false" RenderOuterTable="False" runat="server" DefaultMode="Edit" OnItemUpdating="ctlEditBillingInfo_ItemUpdating">
                                                <EditItemTemplate>

                                                    <div class="form-group" style="margin-top: 72px;">
                                                        <label>Billing First Name</label>
                                                        <asp:TextBox ID="ctlBillingFirstName" CssClass="form-control" AutoCompleteType="None" Text='<%# Bind("billing_firstname") %>' placeholder="Billing First Name" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Billing Last Name</label>
                                                        <asp:TextBox ID="ctlBillingLastName" CssClass="form-control" AutoCompleteType="None" Text='<%# Bind("billing_lastname") %>' placeholder="Billing Last Name" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Billing Phone</label>
                                                        <asp:TextBox ID="ctlBillingPhone" CssClass="form-control" AutoCompleteType="None" Text='<%# Bind("billing_phone") %>' placeholder="Billing Phone" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Billing Company</label>
                                                        <asp:TextBox ID="ctlBillingCompany" CssClass="form-control" AutoCompleteType="None" Text='<%# Bind("billing_company") %>' placeholder="Billing Company" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Billing Address</label>
                                                        <asp:TextBox ID="ctlBillingAddress" CssClass="form-control" AutoCompleteType="None" Text='<%# Bind("billing_address") %>' placeholder="Billing Address" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Billing City</label>
                                                        <asp:TextBox ID="ctlBillingCity" CssClass="form-control" AutoCompleteType="None" Text='<%# Bind("billing_city") %>' placeholder="Billing City" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Billing Country</label>
                                                        <asp:DropDownList ID="ctlBillingCountry" CssClass="form-control" SelectedValue='<%# Bind("billing_country") %>' runat="server">
                                                            <asp:ListItem Value="" Selected="True">Billing Country</asp:ListItem>
                                                            <asp:ListItem Value="AF">Afghanistan</asp:ListItem>
                                                            <asp:ListItem Value="AL">Albania</asp:ListItem>
                                                            <asp:ListItem Value="DZ">Algeria</asp:ListItem>
                                                            <asp:ListItem Value="AS">American Samoa</asp:ListItem>
                                                            <asp:ListItem Value="AD">Andorra</asp:ListItem>
                                                            <asp:ListItem Value="AO">Angola</asp:ListItem>
                                                            <asp:ListItem Value="AI">Anguilla</asp:ListItem>
                                                            <asp:ListItem Value="AQ">Antarctica</asp:ListItem>
                                                            <asp:ListItem Value="AG">Antigua And Barbuda</asp:ListItem>
                                                            <asp:ListItem Value="AR">Argentina</asp:ListItem>
                                                            <asp:ListItem Value="AM">Armenia</asp:ListItem>
                                                            <asp:ListItem Value="AW">Aruba</asp:ListItem>
                                                            <asp:ListItem Value="AU">Australia</asp:ListItem>
                                                            <asp:ListItem Value="AT">Austria</asp:ListItem>
                                                            <asp:ListItem Value="AZ">Azerbaijan</asp:ListItem>
                                                            <asp:ListItem Value="BS">Bahamas</asp:ListItem>
                                                            <asp:ListItem Value="BH">Bahrain</asp:ListItem>
                                                            <asp:ListItem Value="BD">Bangladesh</asp:ListItem>
                                                            <asp:ListItem Value="BB">Barbados</asp:ListItem>
                                                            <asp:ListItem Value="BY">Belarus</asp:ListItem>
                                                            <asp:ListItem Value="BE">Belgium</asp:ListItem>
                                                            <asp:ListItem Value="BZ">Belize</asp:ListItem>
                                                            <asp:ListItem Value="BJ">Benin</asp:ListItem>
                                                            <asp:ListItem Value="BM">Bermuda</asp:ListItem>
                                                            <asp:ListItem Value="BT">Bhutan</asp:ListItem>
                                                            <asp:ListItem Value="BO">Bolivia</asp:ListItem>
                                                            <asp:ListItem Value="BA">Bosnia And Herzegowina</asp:ListItem>
                                                            <asp:ListItem Value="BW">Botswana</asp:ListItem>
                                                            <asp:ListItem Value="BV">Bouvet Island</asp:ListItem>
                                                            <asp:ListItem Value="BR">Brazil</asp:ListItem>
                                                            <asp:ListItem Value="IO">British Indian Ocean Territory</asp:ListItem>
                                                            <asp:ListItem Value="BN">Brunei Darussalam</asp:ListItem>
                                                            <asp:ListItem Value="BG">Bulgaria</asp:ListItem>
                                                            <asp:ListItem Value="BF">Burkina Faso</asp:ListItem>
                                                            <asp:ListItem Value="BI">Burundi</asp:ListItem>
                                                            <asp:ListItem Value="KH">Cambodia</asp:ListItem>
                                                            <asp:ListItem Value="CM">Cameroon</asp:ListItem>
                                                            <asp:ListItem Value="CA">Canada</asp:ListItem>
                                                            <asp:ListItem Value="CV">Cape Verde</asp:ListItem>
                                                            <asp:ListItem Value="KY">Cayman Islands</asp:ListItem>
                                                            <asp:ListItem Value="CF">Central African Republic</asp:ListItem>
                                                            <asp:ListItem Value="TD">Chad</asp:ListItem>
                                                            <asp:ListItem Value="CL">Chile</asp:ListItem>
                                                            <asp:ListItem Value="CN">China</asp:ListItem>
                                                            <asp:ListItem Value="CX">Christmas Island</asp:ListItem>
                                                            <asp:ListItem Value="CC">Cocos (Keeling) Islands</asp:ListItem>
                                                            <asp:ListItem Value="CO">Colombia</asp:ListItem>
                                                            <asp:ListItem Value="KM">Comoros</asp:ListItem>
                                                            <asp:ListItem Value="CG">Congo</asp:ListItem>
                                                            <asp:ListItem Value="CK">Cook Islands</asp:ListItem>
                                                            <asp:ListItem Value="CR">Costa Rica</asp:ListItem>
                                                            <asp:ListItem Value="CI">Cote D'Ivoire</asp:ListItem>
                                                            <asp:ListItem Value="HR">Croatia (Local Name: Hrvatska)</asp:ListItem>
                                                            <asp:ListItem Value="CU">Cuba</asp:ListItem>
                                                            <asp:ListItem Value="CY">Cyprus</asp:ListItem>
                                                            <asp:ListItem Value="CZ">Czech Republic</asp:ListItem>
                                                            <asp:ListItem Value="DK">Denmark</asp:ListItem>
                                                            <asp:ListItem Value="DJ">Djibouti</asp:ListItem>
                                                            <asp:ListItem Value="DM">Dominica</asp:ListItem>
                                                            <asp:ListItem Value="DO">Dominican Republic</asp:ListItem>
                                                            <asp:ListItem Value="TP">East Timor</asp:ListItem>
                                                            <asp:ListItem Value="EC">Ecuador</asp:ListItem>
                                                            <asp:ListItem Value="EG">Egypt</asp:ListItem>
                                                            <asp:ListItem Value="SV">El Salvador</asp:ListItem>
                                                            <asp:ListItem Value="GQ">Equatorial Guinea</asp:ListItem>
                                                            <asp:ListItem Value="ER">Eritrea</asp:ListItem>
                                                            <asp:ListItem Value="EE">Estonia</asp:ListItem>
                                                            <asp:ListItem Value="ET">Ethiopia</asp:ListItem>
                                                            <asp:ListItem Value="FK">Falkland Islands (Malvinas)</asp:ListItem>
                                                            <asp:ListItem Value="FO">Faroe Islands</asp:ListItem>
                                                            <asp:ListItem Value="FJ">Fiji</asp:ListItem>
                                                            <asp:ListItem Value="FI">Finland</asp:ListItem>
                                                            <asp:ListItem Value="FR">France</asp:ListItem>
                                                            <asp:ListItem Value="GF">French Guiana</asp:ListItem>
                                                            <asp:ListItem Value="PF">French Polynesia</asp:ListItem>
                                                            <asp:ListItem Value="TF">French Southern Territories</asp:ListItem>
                                                            <asp:ListItem Value="GA">Gabon</asp:ListItem>
                                                            <asp:ListItem Value="GM">Gambia</asp:ListItem>
                                                            <asp:ListItem Value="GE">Georgia</asp:ListItem>
                                                            <asp:ListItem Value="DE">Germany</asp:ListItem>
                                                            <asp:ListItem Value="GH">Ghana</asp:ListItem>
                                                            <asp:ListItem Value="GI">Gibraltar</asp:ListItem>
                                                            <asp:ListItem Value="GR">Greece</asp:ListItem>
                                                            <asp:ListItem Value="GL">Greenland</asp:ListItem>
                                                            <asp:ListItem Value="GD">Grenada</asp:ListItem>
                                                            <asp:ListItem Value="GP">Guadeloupe</asp:ListItem>
                                                            <asp:ListItem Value="GU">Guam</asp:ListItem>
                                                            <asp:ListItem Value="GT">Guatemala</asp:ListItem>
                                                            <asp:ListItem Value="GN">Guinea</asp:ListItem>
                                                            <asp:ListItem Value="GW">Guinea-Bissau</asp:ListItem>
                                                            <asp:ListItem Value="GY">Guyana</asp:ListItem>
                                                            <asp:ListItem Value="HT">Haiti</asp:ListItem>
                                                            <asp:ListItem Value="HM">Heard And Mc Donald Islands</asp:ListItem>
                                                            <asp:ListItem Value="VA">Holy See (Vatican City State)</asp:ListItem>
                                                            <asp:ListItem Value="HN">Honduras</asp:ListItem>
                                                            <asp:ListItem Value="HK">Hong Kong</asp:ListItem>
                                                            <asp:ListItem Value="HU">Hungary</asp:ListItem>
                                                            <asp:ListItem Value="IS">Icel And</asp:ListItem>
                                                            <asp:ListItem Value="IN">India</asp:ListItem>
                                                            <asp:ListItem Value="ID">Indonesia</asp:ListItem>
                                                            <asp:ListItem Value="IR">Iran (Islamic Republic Of)</asp:ListItem>
                                                            <asp:ListItem Value="IQ">Iraq</asp:ListItem>
                                                            <asp:ListItem Value="IE">Ireland</asp:ListItem>
                                                            <asp:ListItem Value="IL">Israel</asp:ListItem>
                                                            <asp:ListItem Value="IT">Italy</asp:ListItem>
                                                            <asp:ListItem Value="JM">Jamaica</asp:ListItem>
                                                            <asp:ListItem Value="JP">Japan</asp:ListItem>
                                                            <asp:ListItem Value="JO">Jordan</asp:ListItem>
                                                            <asp:ListItem Value="KZ">Kazakhstan</asp:ListItem>
                                                            <asp:ListItem Value="KE">Kenya</asp:ListItem>
                                                            <asp:ListItem Value="KI">Kiribati</asp:ListItem>
                                                            <asp:ListItem Value="KP">Korea, Dem People'S Republic</asp:ListItem>
                                                            <asp:ListItem Value="KR">Korea, Republic Of</asp:ListItem>
                                                            <asp:ListItem Value="KW">Kuwait</asp:ListItem>
                                                            <asp:ListItem Value="KG">Kyrgyzstan</asp:ListItem>
                                                            <asp:ListItem Value="LA">Lao People'S Dem Republic</asp:ListItem>
                                                            <asp:ListItem Value="LV">Latvia</asp:ListItem>
                                                            <asp:ListItem Value="LB">Lebanon</asp:ListItem>
                                                            <asp:ListItem Value="LS">Lesotho</asp:ListItem>
                                                            <asp:ListItem Value="LR">Liberia</asp:ListItem>
                                                            <asp:ListItem Value="LY">Libyan Arab Jamahiriya</asp:ListItem>
                                                            <asp:ListItem Value="LI">Liechtenstein</asp:ListItem>
                                                            <asp:ListItem Value="LT">Lithuania</asp:ListItem>
                                                            <asp:ListItem Value="LU">Luxembourg</asp:ListItem>
                                                            <asp:ListItem Value="MO">Macau</asp:ListItem>
                                                            <asp:ListItem Value="MK">Macedonia</asp:ListItem>
                                                            <asp:ListItem Value="MG">Madagascar</asp:ListItem>
                                                            <asp:ListItem Value="MW">Malawi</asp:ListItem>
                                                            <asp:ListItem Value="MY">Malaysia</asp:ListItem>
                                                            <asp:ListItem Value="MV">Maldives</asp:ListItem>
                                                            <asp:ListItem Value="ML">Mali</asp:ListItem>
                                                            <asp:ListItem Value="MT">Malta</asp:ListItem>
                                                            <asp:ListItem Value="MH">Marshall Islands</asp:ListItem>
                                                            <asp:ListItem Value="MQ">Martinique</asp:ListItem>
                                                            <asp:ListItem Value="MR">Mauritania</asp:ListItem>
                                                            <asp:ListItem Value="MU">Mauritius</asp:ListItem>
                                                            <asp:ListItem Value="YT">Mayotte</asp:ListItem>
                                                            <asp:ListItem Value="MX">Mexico</asp:ListItem>
                                                            <asp:ListItem Value="FM">Micronesia, Federated States</asp:ListItem>
                                                            <asp:ListItem Value="MD">Moldova, Republic Of</asp:ListItem>
                                                            <asp:ListItem Value="MC">Monaco</asp:ListItem>
                                                            <asp:ListItem Value="MN">Mongolia</asp:ListItem>
                                                            <asp:ListItem Value="MS">Montserrat</asp:ListItem>
                                                            <asp:ListItem Value="MA">Morocco</asp:ListItem>
                                                            <asp:ListItem Value="MZ">Mozambique</asp:ListItem>
                                                            <asp:ListItem Value="MM">Myanmar</asp:ListItem>
                                                            <asp:ListItem Value="NA">Namibia</asp:ListItem>
                                                            <asp:ListItem Value="NR">Nauru</asp:ListItem>
                                                            <asp:ListItem Value="NP">Nepal</asp:ListItem>
                                                            <asp:ListItem Value="NL">Netherlands</asp:ListItem>
                                                            <asp:ListItem Value="AN">Netherlands Ant Illes</asp:ListItem>
                                                            <asp:ListItem Value="NC">New Caledonia</asp:ListItem>
                                                            <asp:ListItem Value="NZ">New Zealand</asp:ListItem>
                                                            <asp:ListItem Value="NI">Nicaragua</asp:ListItem>
                                                            <asp:ListItem Value="NE">Niger</asp:ListItem>
                                                            <asp:ListItem Value="NG">Nigeria</asp:ListItem>
                                                            <asp:ListItem Value="NU">Niue</asp:ListItem>
                                                            <asp:ListItem Value="NF">Norfolk Island</asp:ListItem>
                                                            <asp:ListItem Value="MP">Northern Mariana Islands</asp:ListItem>
                                                            <asp:ListItem Value="NO">Norway</asp:ListItem>
                                                            <asp:ListItem Value="OM">Oman</asp:ListItem>
                                                            <asp:ListItem Value="PK">Pakistan</asp:ListItem>
                                                            <asp:ListItem Value="PW">Palau</asp:ListItem>
                                                            <asp:ListItem Value="PA">Panama</asp:ListItem>
                                                            <asp:ListItem Value="PG">Papua New Guinea</asp:ListItem>
                                                            <asp:ListItem Value="PY">Paraguay</asp:ListItem>
                                                            <asp:ListItem Value="PE">Peru</asp:ListItem>
                                                            <asp:ListItem Value="PH">Philippines</asp:ListItem>
                                                            <asp:ListItem Value="PN">Pitcairn</asp:ListItem>
                                                            <asp:ListItem Value="PL">Poland</asp:ListItem>
                                                            <asp:ListItem Value="PT">Portugal</asp:ListItem>
                                                            <asp:ListItem Value="PR">Puerto Rico</asp:ListItem>
                                                            <asp:ListItem Value="QA">Qatar</asp:ListItem>
                                                            <asp:ListItem Value="RE">Reunion</asp:ListItem>
                                                            <asp:ListItem Value="RO">Romania</asp:ListItem>
                                                            <asp:ListItem Value="RU">Russian Federation</asp:ListItem>
                                                            <asp:ListItem Value="RW">Rwanda</asp:ListItem>
                                                            <asp:ListItem Value="KN">Saint K Itts And Nevis</asp:ListItem>
                                                            <asp:ListItem Value="LC">Saint Lucia</asp:ListItem>
                                                            <asp:ListItem Value="VC">Saint Vincent, The Grenadines</asp:ListItem>
                                                            <asp:ListItem Value="WS">Samoa</asp:ListItem>
                                                            <asp:ListItem Value="SM">San Marino</asp:ListItem>
                                                            <asp:ListItem Value="ST">Sao Tome And Principe</asp:ListItem>
                                                            <asp:ListItem Value="SA">Saudi Arabia</asp:ListItem>
                                                            <asp:ListItem Value="SN">Senegal</asp:ListItem>
                                                            <asp:ListItem Value="SC">Seychelles</asp:ListItem>
                                                            <asp:ListItem Value="SL">Sierra Leone</asp:ListItem>
                                                            <asp:ListItem Value="SG">Singapore</asp:ListItem>
                                                            <asp:ListItem Value="SK">Slovakia (Slovak Republic)</asp:ListItem>
                                                            <asp:ListItem Value="SI">Slovenia</asp:ListItem>
                                                            <asp:ListItem Value="SB">Solomon Islands</asp:ListItem>
                                                            <asp:ListItem Value="SO">Somalia</asp:ListItem>
                                                            <asp:ListItem Value="ZA">South Africa</asp:ListItem>
                                                            <asp:ListItem Value="GS">South Georgia , S Sandwich Is.</asp:ListItem>
                                                            <asp:ListItem Value="ES">Spain</asp:ListItem>
                                                            <asp:ListItem Value="LK">Sri Lanka</asp:ListItem>
                                                            <asp:ListItem Value="SH">St. Helena</asp:ListItem>
                                                            <asp:ListItem Value="PM">St. Pierre And Miquelon</asp:ListItem>
                                                            <asp:ListItem Value="SD">Sudan</asp:ListItem>
                                                            <asp:ListItem Value="SR">Suriname</asp:ListItem>
                                                            <asp:ListItem Value="SJ">Svalbard, Jan Mayen Islands</asp:ListItem>
                                                            <asp:ListItem Value="SZ">Sw Aziland</asp:ListItem>
                                                            <asp:ListItem Value="SE">Sweden</asp:ListItem>
                                                            <asp:ListItem Value="CH">Switzerland</asp:ListItem>
                                                            <asp:ListItem Value="SY">Syrian Arab Republic</asp:ListItem>
                                                            <asp:ListItem Value="TW">Taiwan</asp:ListItem>
                                                            <asp:ListItem Value="TJ">Tajikistan</asp:ListItem>
                                                            <asp:ListItem Value="TZ">Tanzania, United Republic Of</asp:ListItem>
                                                            <asp:ListItem Value="TH">Thailand</asp:ListItem>
                                                            <asp:ListItem Value="TG">Togo</asp:ListItem>
                                                            <asp:ListItem Value="TK">Tokelau</asp:ListItem>
                                                            <asp:ListItem Value="TO">Tonga</asp:ListItem>
                                                            <asp:ListItem Value="TT">Trinidad And Tobago</asp:ListItem>
                                                            <asp:ListItem Value="TN">Tunisia</asp:ListItem>
                                                            <asp:ListItem Value="TR">Turkey</asp:ListItem>
                                                            <asp:ListItem Value="TM">Turkmenistan</asp:ListItem>
                                                            <asp:ListItem Value="TC">Turks And Caicos Islands</asp:ListItem>
                                                            <asp:ListItem Value="TV">Tuvalu</asp:ListItem>
                                                            <asp:ListItem Value="UG">Uganda</asp:ListItem>
                                                            <asp:ListItem Value="UA">Ukraine</asp:ListItem>
                                                            <asp:ListItem Value="AE">United Arab Emirates</asp:ListItem>
                                                            <asp:ListItem Value="GB">United Kingdom</asp:ListItem>
                                                            <asp:ListItem Value="US">United States</asp:ListItem>
                                                            <asp:ListItem Value="UM">United States Minor Is.</asp:ListItem>
                                                            <asp:ListItem Value="UY">Uruguay</asp:ListItem>
                                                            <asp:ListItem Value="UZ">Uzbekistan</asp:ListItem>
                                                            <asp:ListItem Value="VU">Vanuatu</asp:ListItem>
                                                            <asp:ListItem Value="VE">Venezuela</asp:ListItem>
                                                            <asp:ListItem Value="VN">Viet Nam</asp:ListItem>
                                                            <asp:ListItem Value="VG">Virgin Islands (British)</asp:ListItem>
                                                            <asp:ListItem Value="VI">Virgin Islands (U.S.)</asp:ListItem>
                                                            <asp:ListItem Value="WF">Wallis And Futuna Islands</asp:ListItem>
                                                            <asp:ListItem Value="EH">Western Sahara</asp:ListItem>
                                                            <asp:ListItem Value="YE">Yemen</asp:ListItem>
                                                            <asp:ListItem Value="YU">Yugoslavia</asp:ListItem>
                                                            <asp:ListItem Value="ZR">Zaire</asp:ListItem>
                                                            <asp:ListItem Value="ZM">Zambia</asp:ListItem>
                                                            <asp:ListItem Value="ZW">Zimbabwe</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>

                                                    <div class="form-group">
                                                        <label>Billing State</label>
                                                        <asp:TextBox ID="ctlBillingState" CssClass="form-control" AutoCompleteType="None" Text='<%# Bind("billing_state") %>' placeholder="Billing State" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Billing Zip Code</label>
                                                        <asp:TextBox ID="ctlBillingZipCode" CssClass="form-control" AutoCompleteType="None" Text='<%# Bind("billing_zipcode") %>' placeholder="Billing Zip Code" runat="server" />
                                                    </div>
                                                </EditItemTemplate>
                                            </asp:FormView>
                                            <asp:PlaceHolder runat="server" Visible="false">
                                                <a href="#" name="linkStudInfo">
                                                    <p class="sectionHeadingSubPage text-left subSectionPadding">&nbsp;</p>
                                                </a>
                                            </asp:PlaceHolder>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <asp:UpdatePanel runat="server" UpdateMode="Always">
                            <ContentTemplate>
                                <div class="row" style="margin-top: 20px;">
                                    <div class="col-md-10">
                                        <a type="button" class="btn btn-default" href="/cart/cart2.aspx"><i class="fa fa-arrow-left"></i>Back to Cart </a>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group text-right">
                                            <asp:Button ID="ctlPlaceOrder" runat="server" BackColor="#e85c24" CssClass="btn btn-success fa-button-right" OnClick="ctlPlaceOrder_Click" Text="Next →" />
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <style>
        @media screen and (max-width: 600px) {
            table {
                width: 100%;
            }

            thead {
                display: none;
            }

            tbody td {
                display: block;
                text-align: left;
            }

                tbody td:before {
                    content: attr(data-th);
                    display: block;
                    text-align: left;
                }
        }
    </style>
    <script>
        window.onload = function () {
            // Get the ASP.NET button element by its client ID
            var btn = document.getElementById('<%= ctlPlaceOrder.ClientID %>');

            // Add the FontAwesome icon and the text to the button's innerHTML
            btn.innerHTML = '<i class="fa fa-arrow-right"></i> ' + btn.innerHTML.trim();
        };
    </script>
</asp:Content>
