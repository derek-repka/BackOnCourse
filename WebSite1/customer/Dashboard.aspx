<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Dashboard.aspx.vb" Inherits="customer_Dashboard2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="Dashboard.aspx">Dashboard <span class="sr-only">(current)</span></a></li>
            <li><a href="Courses.aspx">eCourses</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="Settings.aspx">Settings</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="left: 0px; top: 0px">
            <div class="col-md-5">
                <div class="panel panel-primary">
                    <div class="panel-heading">Upcoming Workshops</div>
                    <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-hover" ShowHeader="False" runat="server" DataSourceID="workshopDataSource"></asp:GridView>
                </div>
            </div>
            <div class="col-md-5">
                <div class="panel panel-primary">
                    <div class="panel-heading">Recently Purchased eCourses </div>
                    <asp:GridView ID="recentECourseView" CssClass="table table-striped table-bordered table-hover" ShowHeader="False" runat="server" DataSourceID="ecourseDataSource" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <asp:SqlDataSource ID="ecourseDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT TOP (5) platformProduct.productName AS Subject FROM platformUser INNER JOIN platformOrder ON platformUser.userID = platformOrder.userID INNER JOIN platformOrderLine ON platformOrder.orderID = platformOrderLine.orderID INNER JOIN platformProduct ON platformOrderLine.productID = platformProduct.productID WHERE (platformUser.userID = @userID) AND (platformOrder.orderStatusID = 3) AND (platformProduct.categoryID = 2) ORDER BY platformOrder.orderDate DESC">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="-1" Name="userID" SessionField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="workshopDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT TOP (5) platformWorkshop.dateTime, platformTopic.topicCode FROM platformUser INNER JOIN platformOrder ON platformUser.userID = platformOrder.userID INNER JOIN platformOrderLine ON platformOrder.orderID = platformOrderLine.orderID INNER JOIN platformWorkshop ON platformOrderLine.workshopID = platformWorkshop.workshopID INNER JOIN platformTopic ON platformWorkshop.topicID = platformTopic.topicID WHERE (platformOrder.orderStatusID = 3) AND (platformUser.userID = @userID) ORDER BY platformWorkshop.dateTime DESC">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="-1" Name="userID" SessionField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
          <div class="col-md-5">
                <div class="panel panel-primary">
                    <div class="panel-heading">Legislation Updates </div>
                      <strong>October 1st, 2016</strong><br />
                    <br />
                    <strong>The Reporting of Injuries, Diseases and Dangerous Occurrences Regulations 2016 (RIDDOR 2013) replaced RIDDOR 1995<br />
                    The main changes made by these Regulations are:</strong><br />
&nbsp; • A simplified and shortened list of specified reportable injuries (“major injuries”) to workers sustained as a result of a work-related accident.
                    <br />
&nbsp; • A clarified and shortened list of reportable dangerous occurrences (near-miss events).
                    <br />
&nbsp; • A simplified and significantly shortened list of reportable ill-health conditions inworkers<br />
                    <br />
                    <strong>No changes are being made to:</strong><br />
&nbsp;• Recording requirements<br />
&nbsp;• Reports of fatal accidents<br />
&nbsp;• Reports of accidents involving non-workers including members of the public<br />
&nbsp;• Reports of accidents which incapacitate workers for more than seven days<br />
        </div>
      </div>
    </div>
</asp:Content>