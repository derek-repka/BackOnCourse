<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Workshops.aspx.vb" Inherits="customer_Workshops" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li><a href="Dashboard.aspx">Dashboard <span class="sr-only">(current)</span></a></li>
            <li><a href="Courses.aspx">eCourses</a></li>
            <li><a href="Products.aspx">Products</a></li>
            <li class="active"><a href="Workshops.aspx">Workshops</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="Settings.aspx">Settings</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="col-md-10">
            <asp:GridView ID="GridView1" runat="server"  CssClass="table table-striped table-bordered table-hover" DataSourceID="workshopDataSource" Height="127px" Width="922px" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="DateTime" HeaderText="DateTime" SortExpression="DateTime" />
                    <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="topicCode" HeaderText="topicCode" SortExpression="topicCode" />
                    <asp:BoundField DataField=" Instructor Name" HeaderText=" Instructor Name" SortExpression=" Instructor Name" ReadOnly="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="workshopDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformWorkshop.dateTime AS DateTime, platformWorkshop.location AS Location, platformWorkshop.city AS City, platformWorkshop.price AS Price, platformTopic.topicCode, platformInstructor.firstName + ' ' + platformInstructor.lastName AS [ Instructor Name] FROM platformUser INNER JOIN platformOrder ON platformUser.userID = platformOrder.userID INNER JOIN platformOrderLine ON platformOrder.orderID = platformOrderLine.orderID INNER JOIN platformWorkshop ON platformOrderLine.workshopID = platformWorkshop.workshopID INNER JOIN platformTopic ON platformWorkshop.topicID = platformTopic.topicID INNER JOIN platformInstructor ON platformWorkshop.instructorID = platformInstructor.instructorID WHERE (platformUser.userID = @userID) AND (platformOrder.orderStatusID = 3)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="-1" Name="userID" SessionField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
            </div>
        </div>
      </div>
    </div>
</asp:Content>

