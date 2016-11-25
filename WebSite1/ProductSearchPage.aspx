<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ProductSearchPage.aspx.vb" Inherits="CourseAttendencePolicy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    Product Type
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ProductName" DataTextField="Product" DataValueField="Product">
    </asp:DropDownList>
    <asp:SqlDataSource ID="ProductName" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT styleDescription AS 'Product Type' FROM platformStyle"></asp:SqlDataSource>
    <br />
    Product List
    <asp:DropDownList ID="DropDownList2" runat="server">
    </asp:DropDownList>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ProductInfo">
        <Columns>
            <asp:BoundField DataField="productName" HeaderText="productName" SortExpression="productName" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
            <asp:BoundField DataField="unitsInStock" HeaderText="unitsInStock" SortExpression="unitsInStock" />
            <asp:BoundField DataField="discontinued" HeaderText="discontinued" SortExpression="discontinued" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ProductInfo" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformProduct.productName, platformProduct.price, platformProduct.description, platformProduct.unitsInStock, platformProduct.discontinued FROM platformProduct INNER JOIN platformStyle ON platformProduct.styleID = platformStyle.styleID WHERE (platformStyle.styleDescription = @styleDescription)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="styleDescription" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ProductDisplay" runat="server"></asp:SqlDataSource>
    <br />
</asp:Content>

