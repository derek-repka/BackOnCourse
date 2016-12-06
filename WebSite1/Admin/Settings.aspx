<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Settings.aspx.vb" Inherits="Admin_Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li><a href="Dashboard.aspx">Dashboard <span class="sr-only">(current)</span></a></li>
            <li><a href="ManageProduct.aspx">Manage Products</a></li>
            <li><a href="ManageWorkshop.aspx">Manage Workshops</a></li>
            <li><a href="ManageCourse.aspx">Manage eCourses</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li class="active"><a href="Settings.aspx">Settings</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="col-md-5">
            <asp:GridView ID="gvUsers" runat="server" OnRowCommand="gvUsers_RowCommand" CssClass="table table-striped table-bordered table-hover" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="userID" DataSourceID="sqldsUsers">
                <Columns>
                    <asp:BoundField DataField="userID" HeaderText="userID" InsertVisible="False" ReadOnly="True" SortExpression="userID" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                    <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                    <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                    <asp:ButtonField CommandName="increaseQuantity" ControlStyle-CssClass="btn btn-info" ButtonType="Button" Text="select" HeaderStyle-Width="5%">
<ControlStyle CssClass="btn btn-info"></ControlStyle>

<HeaderStyle Width="5%"></HeaderStyle>
                    </asp:ButtonField>
                </Columns>
                <PagerSettings Position="TopAndBottom" />
            </asp:GridView>
            <asp:SqlDataSource ID="sqldsUsers" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT userID, email, firstName, lastName, type FROM platformUser" UpdateCommand="UPDATE platformUser SET password = @pass WHERE (userID = @userID)">
                <UpdateParameters>
                    <asp:Parameter Name="pass" />
                    <asp:Parameter Name="userID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Label ID="adminPass" runat="server" Text="Admin Password: "></asp:Label>
            <asp:TextBox ID="adminPassText" runat="server"></asp:TextBox>
            <br />
            Enter a new password:
            <asp:TextBox ID="newPass" runat="server"></asp:TextBox>
            <br />
            Confirm new password:
            <asp:TextBox ID="newPassConfirm" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="passChange" runat="server" Text="Confirm password change" />
            <br />
            <asp:Label ID="wronglength" runat="server"></asp:Label>
            <br />
            <asp:Label ID="mismatch" runat="server"></asp:Label>
            <br />
            <asp:Label ID="adminPassWrong" runat="server"></asp:Label>
            <br />
            <asp:Label ID="PassChanged" runat="server"></asp:Label>
            <br />
            <br />
            <asp:DropDownList ID="ddlRoles" runat="server" DataSourceID="sqldsTypes" DataTextField="type" DataValueField="type">
            </asp:DropDownList>
            <br />
            <asp:Label ID="roleChanged" runat="server"></asp:Label>
            <br />
            <asp:SqlDataSource ID="sqldsTypes" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT DISTINCT type FROM platformUser"></asp:SqlDataSource>
            <br />
            <asp:Button ID="roleButton" runat="server" Text="Change Selected User Role" />
            <asp:SqlDataSource ID="sqlAdminPass" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT password FROM platformUser WHERE (userID = @userID)">
                <SelectParameters>
                    <asp:SessionParameter Name="userID" SessionField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sqldsRoles" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" DeleteCommand="DELETE FROM [platformUser] WHERE [userID] = @userID" InsertCommand="INSERT INTO [platformUser] ([companyName], [email], [password], [firstName], [lastName], [type], [firmID]) VALUES (@companyName, @email, @password, @firstName, @lastName, @type, @firmID)" SelectCommand="SELECT * FROM [platformUser]" UpdateCommand="UPDATE platformUser SET type = @type WHERE (userID = @userID)">
                <DeleteParameters>
                    <asp:Parameter Name="userID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="companyName" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="firstName" Type="String" />
                    <asp:Parameter Name="lastName" Type="String" />
                    <asp:Parameter Name="type" Type="String" />
                    <asp:Parameter Name="firmID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="type" Type="String" />
                    <asp:Parameter Name="userID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </div>
      </div>
    </div>
   </div>
</asp:Content>

