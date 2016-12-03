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
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="True" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                    <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                    <asp:BoundField DataField="Topic Code" HeaderText="Topic Code" SortExpression="Topic Code" />
                    <asp:BoundField DataField="Firm" HeaderText="Firm" SortExpression="Firm" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="workshopDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformInstructor.firstName + ' ' + platformInstructor.lastName AS Name, platformWorkshop.city AS City, platformWorkshop.location AS Location, platformWorkshop.dateTime AS Time, platformTopic.topicCode AS [Topic Code], platformFirm.firmName AS Firm, platformWorkshop.price AS Price, platformOrderLine.quantity AS Quantity FROM platformOrderLine INNER JOIN platformWorkshop ON platformOrderLine.workshopID = platformWorkshop.workshopID INNER JOIN platformInstructor ON platformWorkshop.instructorID = platformInstructor.instructorID INNER JOIN platformTopic ON platformWorkshop.topicID = platformTopic.topicID INNER JOIN platformFirm ON platformWorkshop.firmID = platformFirm.firmID CROSS JOIN platformUser WHERE (platformUser.userID = @userID)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="-1" Name="userID" SessionField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
            </div>
        </div>
      </div>
    </div>
</asp:Content>

