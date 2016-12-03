<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ManageWorkshop.aspx.vb" Inherits="ContentManager_ManageWorkshop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li><a href="Dashboard.aspx">Dashboard <span class="sr-only">(current)</span></a></li>
            <li><a href="ManageProduct.aspx">Manage Products</a></li>
            <li class ="active"><a href="ManageWorkshop.aspx">Manage Workshops</a></li>
            <li><a href="ManageCourse.aspx">Manage eCourses</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="Settings.aspx">Settings</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="col-md-5">
                <asp:GridView ID="gvWorkshops" runat="server" CssClass="table table-striped table-bordered table-hover" AllowPaging="True" AllowSorting="True" DataSourceID="sqldsWorkshop" AutoGenerateColumns="False" Width="750px" DataKeyNames="WorkshopID">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="WorkshopID" HeaderText="WorkshopID" SortExpression="WorkshopID" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="Cirt" HeaderText="Cirt" SortExpression="Cirt" />
                        <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                        <asp:BoundField DataField="Date &amp; Time" HeaderText="Date &amp; Time" SortExpression="Date &amp; Time" />
<asp:BoundField DataField="TopicID" HeaderText="TopicID" SortExpression="TopicID"></asp:BoundField>
                        <asp:BoundField DataField="FirmID" HeaderText="FirmID" SortExpression="FirmID" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        <asp:BoundField DataField="InstructorID" HeaderText="InstructorID" SortExpression="InstructorID" />
                    </Columns>
                <PagerSettings Position="Top" />
            </asp:GridView>
            <asp:SqlDataSource ID="sqldsWorkshop" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" InsertCommand="INSERT INTO [platformWorkshop] ([city], [location], [dateTime], [topicID], [firmID], [price], [quantity], [instructorID]) VALUES (@city, @location, @dateTime, @topicID, @firmID, @price, @quantity, @instructorID)" SelectCommand="SELECT workshopID AS WorkshopID, city AS Cirt, location AS Location, dateTime AS [Date &amp; Time], topicID AS TopicID, firmID AS FirmID, price AS Price, quantity AS Quantity, instructorID AS InstructorID FROM platformWorkshop" DeleteCommand="DELETE FROM [platformWorkshop] WHERE [workshopID] = @workshopID" UpdateCommand="UPDATE [platformWorkshop] SET [city] = @city, [location] = @location, [dateTime] = @dateTime, [topicID] = @topicID, [firmID] = @firmID, [price] = @price, [quantity] = @quantity, [instructorID] = @instructorID WHERE [workshopID] = @workshopID">
                <DeleteParameters>
                    <asp:Parameter Name="workshopID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="city" Type="String" />
                    <asp:Parameter Name="location" Type="String" />
                    <asp:Parameter Name="dateTime" Type="DateTime" />
                    <asp:Parameter Name="topicID" Type="Int32" />
                    <asp:Parameter Name="firmID" Type="Int32" />
                    <asp:Parameter Name="price" Type="Decimal" />
                    <asp:Parameter Name="quantity" Type="Int32" />
                    <asp:Parameter Name="instructorID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="city" Type="String" />
                    <asp:Parameter Name="location" Type="String" />
                    <asp:Parameter Name="dateTime" Type="DateTime" />
                    <asp:Parameter Name="topicID" Type="Int32" />
                    <asp:Parameter Name="firmID" Type="Int32" />
                    <asp:Parameter Name="price" Type="Decimal" />
                    <asp:Parameter Name="quantity" Type="Int32" />
                    <asp:Parameter Name="instructorID" Type="Int32" />
                    <asp:Parameter Name="workshopID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
                <div class="panel-group">
                 <div class="panel panel-default">
                  <div class="panel-heading">
                   <h4 class="panel-title">
                    <a data-toggle="collapse" href="#collapse1">Add Workshops</a>
                   </h4>
                 </div>
                 <div id="collapse1" class="panel-collapse collapse">
                    City: <asp:TextBox ID="City" runat="server"></asp:TextBox>
                      <br />
                    Location: <asp:TextBox ID="Location" runat="server"></asp:TextBox>
                      <br />
                    Date&amp;Time: <asp:TextBox ID="Date" runat="server"></asp:TextBox>
                      <br />
                    TopicID: <asp:TextBox ID="TopicID" runat="server"></asp:TextBox>
                      <br />
                    Price: <asp:TextBox ID="Price" runat="server"></asp:TextBox>
                      <br />
                    Quantity: <asp:TextBox ID="Quantity" runat="server"></asp:TextBox>
                      <br />
                    InstructorID: <asp:TextBox ID="InstructorID" runat="server"></asp:TextBox>
                      <br />
                    <asp:Button ID="CreateButton" runat="server" style="width: 63px" Text="Create" />
                      <br />
                    <asp:Label ID="Created" runat="server"></asp:Label>
                </div>
               </div>
              </div>
               
                <br />

            <br />
            <asp:DetailsView ID="dvInstructor" runat="server" AutoGenerateRows="False" DataSourceID="sqldsInstructors" Height="50px" Width="125px" DataKeyNames="instructorID" AllowPaging="True">
                <Fields>
                    <asp:BoundField DataField="instructorID" HeaderText="instructorID" SortExpression="instructorID" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                    <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                    <asp:BoundField DataField="hireDate" HeaderText="hireDate" SortExpression="hireDate" />
                    <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
                <br />
&nbsp;<asp:DetailsView ID="dvFirm" runat="server" AutoGenerateRows="False" DataSourceID="sqldsFirm" Height="50px" Width="125px" DataKeyNames="firmID" AllowPaging="True">
                <Fields>
                    <asp:BoundField DataField="firmID" HeaderText="firmID" InsertVisible="False" ReadOnly="True" SortExpression="firmID" />
                    <asp:BoundField DataField="firmName" HeaderText="firmName" SortExpression="firmName" />
                    <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
                <br />
&nbsp;<asp:DetailsView ID="dvTopic" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="topicID" DataSourceID="sqldsTopic" Height="50px" Width="125px">
                    <Fields>
                        <asp:BoundField DataField="topicID" HeaderText="topicID" InsertVisible="False" ReadOnly="True" SortExpression="topicID" />
                        <asp:BoundField DataField="topicCode" HeaderText="topicCode" SortExpression="topicCode" />
                        <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
                    </Fields>
            </asp:DetailsView>

            <asp:SqlDataSource ID="sqldsInstructors" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" DeleteCommand="DELETE FROM [platformInstructor] WHERE [instructorID] = @instructorID" InsertCommand="INSERT INTO platformInstructor(lastName, firstName) VALUES (@lastName, @firstName)" SelectCommand="SELECT platformInstructor.* FROM platformInstructor" UpdateCommand="UPDATE platformInstructor SET lastName = @lastName, firstName = @firstName, hireDate = @hireDate WHERE (instructorID = @instructorID)">
                <DeleteParameters>
                    <asp:Parameter Name="instructorID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="lastName" Type="String" />
                    <asp:Parameter Name="firstName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="lastName" Type="String" />
                    <asp:Parameter Name="firstName" Type="String" />
                    <asp:Parameter Name="hireDate" Type="DateTime" />
                    <asp:Parameter Name="instructorID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sqldsFirm" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" DeleteCommand="DELETE FROM [platformFirm] WHERE [firmID] = @firmID" InsertCommand="INSERT INTO [platformFirm] ([firmName]) VALUES (@firmName)" SelectCommand="SELECT * FROM [platformFirm]" UpdateCommand="UPDATE [platformFirm] SET [firmName] = @firmName WHERE [firmID] = @firmID">
                <DeleteParameters>
                    <asp:Parameter Name="firmID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="firmName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="firmName" Type="String" />
                    <asp:Parameter Name="firmID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sqldsTopic" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" DeleteCommand="DELETE FROM [platformTopic] WHERE [topicID] = @topicID" InsertCommand="INSERT INTO [platformTopic] ([topicCode]) VALUES (@topicCode)" SelectCommand="SELECT * FROM [platformTopic]" UpdateCommand="UPDATE [platformTopic] SET [topicCode] = @topicCode WHERE [topicID] = @topicID">
                    <DeleteParameters>
                        <asp:Parameter Name="topicID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="topicCode" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="topicCode" Type="String" />
                        <asp:Parameter Name="topicID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            <br />
        </div>
      </div>
    </div>
   </div>
</asp:Content>

