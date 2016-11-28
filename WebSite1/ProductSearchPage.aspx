<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ProductSearchPage.aspx.vb" Inherits="ProductSearchPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    Please select a product type to pull up a list of products. Once you select a product from the list then the details will appear below.<br />
    <br />
    <div><div style="float:left;width:209px">
        <asp:Label ID="TopicLabel" runat="server" Text="Topic: "></asp:Label>
        <asp:DropDownList ID="TopicList" runat="server" DataSourceID="TopicNames" DataTextField="topicCode" DataValueField="topicCode">
        </asp:DropDownList>
    </div>
    <div style="float:left;width:209px">
        <asp:Label ID="TypeLabel" runat="server" Text="Product Type: "></asp:Label>
        <asp:DropDownList ID="ProductTypeList" runat="server" DataSourceID="ProductType" DataTextField="Product Type" DataValueField="Product Type">
        </asp:DropDownList>
    </div>
    </div>

    <div><div style="float:left;width:209px">


    </div>
    </div>
    <br />
    <br />
<asp:SqlDataSource ID="TopicNames" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT topicCode FROM platformTopic"></asp:SqlDataSource>
<asp:SqlDataSource ID="ProductType" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT styleDescription AS 'Product Type' FROM platformStyle WHERE (NOT (styleDescription = N'OnlineCourse'))"></asp:SqlDataSource>
    <br />
    <asp:Button ID="SearchButton" runat="server" Text="Search" />
<br />
<br />
<asp:GridView ID="ProductDescriptionGrid" runat="server" AutoGenerateColumns="False" DataSourceID="sqlProductListing" AllowSorting="True" DataKeyNames="productID" Visible="False" Width="648px">
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="Product" HeaderText="Product" SortExpression="Product" />
        <asp:BoundField DataField="Topic" HeaderText="Topic" SortExpression="Topic" />
        <asp:BoundField DataField="Style" HeaderText="Style" SortExpression="Style" />
        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
        <asp:BoundField DataField="Quantity Per Unit" HeaderText="Quantity Per Unit" SortExpression="Quantity Per Unit" />
        <asp:BoundField DataField="productID" HeaderText="productID" ReadOnly="True" SortExpression="productID" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="sqlProductListing" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformProduct.productName AS Product, platformTopic.topicCode AS Topic, platformStyle.styleDescription AS Style, platformProduct.price AS Price, platformProduct.quantityPerUnit AS [Quantity Per Unit], platformProduct.productID FROM platformProduct INNER JOIN platformFirm ON platformProduct.firmID = platformFirm.firmID INNER JOIN platformStyle ON platformProduct.styleID = platformStyle.styleID INNER JOIN platformTopic ON platformProduct.topicID = platformTopic.topicID WHERE (platformTopic.topicCode = @topic) AND (platformStyle.styleDescription = @style)">
    <SelectParameters>
        <asp:ControlParameter ControlID="TopicList" Name="topic" PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="ProductTypeList" Name="style" PropertyName="SelectedValue" />
    </SelectParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlECourseListing" runat="server"></asp:SqlDataSource>
    <asp:Label ID="NoResult" runat="server"></asp:Label>
    <br />
    <br />
</asp:Content>



