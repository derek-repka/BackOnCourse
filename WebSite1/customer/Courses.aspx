<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Courses.aspx.vb" Inherits="customer_Courses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li><a href="Dashboard.aspx">Dashboard <span class="sr-only">(current)</span></a></li>
            <li class="active"><a href="Courses.aspx">eCourses</a></li>
            <li><a href="Products.aspx">Products</a></li>
            <li><a href="Workshops.aspx">Workshops</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="Settings.aspx">Settings</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="col-md-10">
            <asp:GridView ID="GridView1" runat="server"  CssClass="table table-striped table-bordered table-hover" DataSourceID="eCourseDataSource" Height="127px" Width="922px" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Topic Code" HeaderText="Topic Code" SortExpression="Topic Code" />
                    <asp:BoundField DataField="Instructor Name" HeaderText="Instructor Name" SortExpression="Instructor Name" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="eCourseDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformTopic.topicCode AS [Topic Code], platformProduct.productName AS [Instructor Name], platformProduct.price AS Price, platformInstructor.firstName + ' ' + platformInstructor.lastName AS Name, platformOrderLine.quantity AS Quantity FROM platformUser INNER JOIN platformOrder ON platformUser.userID = platformOrder.userID INNER JOIN platformOrderLine ON platformOrder.orderID = platformOrderLine.orderID INNER JOIN platformProduct ON platformOrderLine.productID = platformProduct.productID INNER JOIN platformTopic ON platformProduct.topicID = platformTopic.topicID INNER JOIN platformInstructor ON platformProduct.instructorID = platformInstructor.instructorID WHERE (platformUser.userID = @userID) AND (platformProduct.styleID = 2) AND (platformOrder.orderStatusID = 3)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="-1" Name="userID" SessionField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
            </div>
        </div>
      </div>
    </div>
</asp:Content>

