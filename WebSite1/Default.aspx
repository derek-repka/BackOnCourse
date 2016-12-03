<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
      <div class="col-md-1"><!--margin to the left--></div>
      <div class="col-md-6">
        <h2>Welcome to Back on Course</h2>
        <p>
            We are the <strong>#1</strong> leading site on safety training emergency preparation!
        </p>
          <p>
            We provide information for in-person safety training workshops. </p>
          <p>
              Please browse our selection of safety and training online course and products available for purchase.</p>
          <p>
              &nbsp;</p>
          <p>
              <strong>Sign up with us and discover how being a client can benefit your company! </strong>
        </p>
      </div>
      
      <div class="col-md-4">
        <h1>Sign Up</h1>
        <asp:Label ID="signUpWarningLabel" runat="server" Visible="false">Please enter correct sign up information</asp:Label>
          <asp:Label ID="Label1" runat="server" Visible="false">Please enter correct sign up information</asp:Label>
        <div class="form-group row">
          <div class="col-xs-5">
            <input id="txtRegFirstName" runat="server" type="text" class="form-control" placeholder="First Name">
          </div>
          <div class="col-xs-5">
            <input id="txtRegLastName"  runat="server" type="text" class="form-control" placeholder="Last Name">
          </div>
        </div>
        <div class="form-horizontal">
          <div class="col-xs-12">
            <div class="form-group"> 
              <input id="txtRegCompany" runat="server" type="text" class="form-control"  placeholder="Company">
            </div>
            <div class="form-group">
                <input id="txtRegEmail" runat="server" type="email" class="form-control" placeholder="Email">
            </div>
            <div class="form-group">
                <input id="txtRegPassword" runat="server" type="password" class="form-control" placeholder="Password">
            </div>
            <div class="form-group">
                <input id="txtRegReEnterPassword" runat="server" type="password" class="form-control" placeholder="Re-enter Password">
            </div>
          </div>
          <h5><small>By clicking Sign Up, you agree to our Terms and that you have read our Data Policy, including our Cookie Use.</small></h5>
          <div class="form-group row">
            <div class="col-xs-6">
              <button type="submit" class="btn btn-primary btn-block" runat="server" onserverclick="Register">Sign Up</button>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-1"><!--margin to the right--></div>
        <asp:SqlDataSource ID="registrationDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" DeleteCommand="DELETE FROM [platformUser] WHERE [userID] = @userID" InsertCommand="INSERT INTO [platformUser] ([companyName], [email], [password], [firstName], [lastName], [type]) VALUES (@companyName, @email, @password, @firstName, @lastName, @type)" SelectCommand="SELECT [userID], [companyName], [email], [password], [firstName], [lastName], [type] FROM [platformUser]" UpdateCommand="UPDATE [platformUser] SET [companyName] = @companyName, [email] = @email, [password] = @password, [firstName] = @firstName, [lastName] = @lastName, [type] = @type WHERE [userID] = @userID">
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
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="companyName" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="firstName" Type="String" />
                <asp:Parameter Name="lastName" Type="String" />
                <asp:Parameter Name="type" Type="String" />
                <asp:Parameter Name="userID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <footer class="footer">
      <div class="container">
        <ul style="list-style-type: none;">
          <li style="display: inline; margin: 10px"><a href="About.aspx">About Us</a></li>
          <li style="display: inline; margin: 10px"><a href="Contact.aspx">Contact Information</a></li>
          <li style="display: inline; margin: 10px"><a href="PressPage.aspx">Press</a></li>
        </ul>
      </div>
    </footer>
</asp:Content>
