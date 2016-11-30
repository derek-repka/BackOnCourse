<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Dashboard.aspx.vb" Inherits="customer_Dashboard2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="Dashboard.aspx">Dashboard <span class="sr-only">(current)</span></a></li>
            <li><a href="Courses.aspx">Courses</a></li>
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
                    <div class="panel-heading">Recently Purchased Courses </div>
                    <asp:GridView ID="recentECourseView" CssClass="table table-striped table-bordered table-hover" ShowHeader="false" runat="server" DataSourceID="ecourseDataSource" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <asp:SqlDataSource ID="ecourseDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT TOP (5) platformEcourse.ecourseSubject AS Subject FROM platformUser INNER JOIN platformOrder ON platformUser.userID = platformOrder.userID INNER JOIN platformOrderLine ON platformOrder.orderID = platformOrderLine.orderID INNER JOIN platformProduct ON platformOrderLine.productID = platformProduct.productID INNER JOIN platformEcourse ON platformProduct.productID = platformEcourse.productID WHERE (platformUser.userID = @userID) AND (platformOrder.orderStatusID = 3) ORDER BY platformOrder.orderDate DESC">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="-1" Name="userID" SessionField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="workshopDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT TOP (5) platformWorkshop.dateTime, platformTopic.topicCode FROM platformUser INNER JOIN platformOrder ON platformUser.userID = platformOrder.userID INNER JOIN platformOrderLine ON platformOrder.orderID = platformOrderLine.orderID INNER JOIN platformWorkshop ON platformOrderLine.workshopID = platformWorkshop.workshopID INNER JOIN platformTopic ON platformWorkshop.topicID = platformTopic.topicID WHERE (platformOrder.orderStatusID = 3) AND (platformUser.userID = @userID) ORDER BY platformWorkshop.dateTime DESC">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="-1" Name="userID" SessionField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
      </div>
    </div>
</asp:Content>