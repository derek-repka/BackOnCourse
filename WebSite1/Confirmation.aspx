<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Confirmation.aspx.vb" Inherits="Confirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


    <p class="text-center">
        <br />
        <strong><span style="font-size: x-large">Thank you for your order</span></strong></p>
    <p class="text-center">
        <strong>We really appreciate your time and doing business with you!</strong></p>
    <p class="text-center">
        <asp:SqlDataSource ID="orderNumDataSource" runat="server"></asp:SqlDataSource>
    </p>
    <p class="text-center">
        You will receive an email confirmation shortly</p>
    <p class="text-center">
        <asp:Image ID="CheckMark" runat="server" ImageUrl="~/images/checkmark.png" />
    </p>
    <p>
    </p>


</asp:Content>