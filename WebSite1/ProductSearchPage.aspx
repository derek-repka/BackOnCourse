<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ProductSearchPage.aspx.vb" Inherits="CourseAttendencePolicy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    Product Search
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ProductName" DataTextField="Product" DataValueField="Product">
    </asp:DropDownList>
    <asp:SqlDataSource ID="ProductName" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="select productName as Product
from platformProduct"></asp:SqlDataSource>
    <br />
</asp:Content>

