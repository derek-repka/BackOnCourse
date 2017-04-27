<%@ Page Title="Register" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.vb" Inherits="Account_Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %></h2>

    <div class="text-center">
        <h4 class="text-center" style="font-size: xx-large">Account Created.</h4>
        <p class="text-center"><strong>Thank you for sign up with us. Click
            <asp:HyperLink ID="signin" runat="server" NavigateUrl="~/Default.aspx">here</asp:HyperLink>
&nbsp;to get back to main page and log in.</strong></p>
        <hr />
        <asp:Image ID="ImageonReg" runat="server" ImageUrl="~/images/checkmark.png" />
        <br />
    </div>
</asp:Content>

