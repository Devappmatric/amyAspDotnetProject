<%@ Page Title="" Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeBehind="policies.aspx.cs" Inherits="ProductivityPointGlobal.Policies" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid view subPage">
        <div class="row">
            <div class="container">
                <div class="row padding20T">
                    <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                        <div class="section1RowSubpage">
                            <h1 class="white fontShadow">Policies</h1>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-5 col-sm-6 col-xs-12 margin20T responsiveCol">
                        <%--<uc:ContactForm runat="server" />--%>
                    </div>
                </div>
            </div>
        </div>
    </div>    
    
    <uc:Search ID="ucSearch" runat="server" />

    <div class="container-fluid bgWhite subPage padding75B">
        <div class="row">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-6 col-sm-6 col-xs-12">                        
                        <p class="sectionHeadingSubPage text-left subSectionPadding">Productivity Point Learning Solutions offers a 100% Satisfaction Guarantee.</p>
                        <br/>
                        <h3>Class Registration Information</h3>
                        <p><strong>Class Tuition</strong>
                            <br />
                            Tuition covers all course materials, refreshments, and your Certificate of Completion. Parking expenses you may incur are not included.</p>
            
                        <h3>Attendance Policy</h3>            
                        <p><strong>Productivity Point Learning Solutions Class Registrations</strong> 
                            <br/>            
                            If you are unable to attend your scheduled training class, please contact 1-844-238-8607.  Cancellation policies are stated below.
                            <br /><br />
                            <strong>Late Arrivals</strong>
                            <br />
                            In fairness to all participants, anyone arriving more than 30 minutes late will be rescheduled for another class date.</p>
            
                        <h3>Student Cancellations</h3>            
                        <p><strong>Class No Shows</strong><br />
                            If you are registered for a class and do not attend and fail to contact our office to cancel or reschedule, a fee equivalent to your daily rate will be applied. In the event of cancellation by the student, Productivity Point will invoice the Client directly for any charges due to no-show or late cancellations according to the cancellation policy set forth above. If a student does not attend a scheduled course without prior notification it will result in full forfeiture of the funds and no reschedule will be allowed. Within the required notification period, only student substitutions will be permitted.
                            <br /><br />
                            <strong>Class Reschedules</strong><br />
                            Productivity Point Learning Solutions reserves the right to cancel or reschedule any training class. Should Productivity Point Learning Solutions reschedule a class, a full credit will be applied to the rescheduled class. Productivity Point Learning Solutions cannot assume responsibility for any other costs to the student (i.e. non-refundable airline tickets). Class credits are redeemable for up to one year.
                            <br /><br />
                            <strong>Class Cancellations</strong><br />
                            Standard and Professional Desktop Application and Professional Development classes may be cancelled or rescheduled by the client at least four (4) business days in advance without charge. A full credit (no refunds) will be applied to future training on all cancelled classes that meet the above-stated criteria. There is a $75.00 per class-day fee if a student cancels or reschedules the above mentioned classes within three-business days. A cancellation fee equal to the class fee will be incurred if a student fails to provide any notice for a class cancellation. Technical courses or Private classes may be cancelled or rescheduled greater than two weeks in advance without charge. The client is responsible for 50% of the class fee if a technical or private class is canceled or rescheduled within two weeks of the class date, and full price if the class is canceled or rescheduled within one week of the class date.
                            <br /><br />
                            <strong>Class Substitutions</strong><br />
                            Student substitutions are allowed, but we must be notified ahead of time (no less than 2 full business days prior to the start of the class).
                            <br /><br />
                            <strong>Class Refunds</strong><br />
                            Class refunds can be issued only in the event that Productivity Point cannot deliver the class that was originally confirmed.</p>
            
                        <h3>Microsoft Software Assurance Training Vouchers (SATVs)</h3>            
                        <p>The company participating in the Software Assurance Enrollment under which the vouchers were created, has the ability to revoke or un-reserve this benefit before the cancellation date. 
                            <br /><br />
                            Any course days not covered by the voucher will need to be paid by the person receiving the training. Any voucher days in excess of the amount of the course, will be returned to the pool of benefit days available to be assigned by the benefit administrator. 
                            <br /><br />
                            The voucher is only redeemable for days of instructor-led training at Microsoft® Certified Partner for Learning Solutions and only for courses within the list available within the Software Assurance Training Voucher program.
                            <br /><br />
                            These vouchers are non transferable - vouchers may only be redeemed by the individual they have been assigned to (Authentication of the training recipient is accomplished by providing the e-mail address of the individual to whom this e-mail is addressed). Vouchers may not be exchanged for cash, monies or other valuable considerations.
                            <br /><br />
                            The voucher will expire 6 months (180 days) from issue date. Vouchers may be used to reserve training at only one Microsoft® Certified Partner for Learning Solutions at a time.</p>
            
                        <h3>Event Hosting Cancellations</h3>            
                        <p>Event Hosting reservations may be canceled or rescheduled greater than 14 calendar days in advance without penalty.  The client is responsible for the full price if canceled or rescheduled 14 calendar days or less from the first date of the scheduled event.  No refunds will be issued, however reservations can be rescheduled up to one year from the first day of the original event at no additional charge.</p>                        
                    </div>

                    <uc:Partners runat="server" />
                    
                </div>                    
            </div>
        </div>
    </div>	             	                       
</asp:Content>
