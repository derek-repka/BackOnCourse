<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ProductSearchPage.aspx.vb" Inherits="CourseAttendencePolicy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    Please select a product type to pull up a list of products. Once you select a product from the list then the details will appear below.<br />
    <br />
Product Type
<asp:DropDownList ID="ProductTypeList" runat="server" DataSourceID="ProductType" DataTextField="Product Type" DataValueField="Product Type">
</asp:DropDownList>
<asp:SqlDataSource ID="ProductType" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT styleDescription AS 'Product Type' FROM platformStyle"></asp:SqlDataSource>
<br />
<br />
<br />
Product List
<asp:DropDownList ID="ProductNameList" runat="server" DataSourceID="ProductNames" DataTextField="productName" DataValueField="productName">
</asp:DropDownList>
<asp:SqlDataSource ID="ProductNames" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformProduct.productName FROM platformProduct INNER JOIN platformStyle ON platformProduct.styleID = platformStyle.styleID WHERE (platformStyle.styleDescription = @styleDescription)">
    <SelectParameters>
        <asp:ControlParameter ControlID="ProductTypeList" Name="styleDescription" PropertyName="SelectedValue" />
    </SelectParameters>
</asp:SqlDataSource>
<br />
<br />
<br />
<asp:GridView ID="ProductDescriptionGrid" runat="server" AutoGenerateColumns="False" DataSourceID="ProductDescription">
    <Columns>
        <asp:BoundField DataField="productName" HeaderText="productName" SortExpression="productName" />
        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
        <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
        <asp:BoundField DataField="unitsInStock" HeaderText="unitsInStock" SortExpression="unitsInStock" />
        <asp:BoundField DataField="discontinued" HeaderText="discontinued" SortExpression="discontinued" />
        <asp:BoundField DataField="quantityPerUnit" HeaderText="quantityPerUnit" SortExpression="quantityPerUnit" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="ProductDescription" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT productName, price, description, unitsInStock, discontinued, quantityPerUnit FROM platformProduct WHERE (productName = @productName)">
    <SelectParameters>
        <asp:ControlParameter ControlID="ProductNameList" Name="productName" PropertyName="SelectedValue" />
    </SelectParameters>
</asp:SqlDataSource>
    <br />
</asp:Content>

