<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ProductSearchPage.aspx.vb" Inherits="ProductSearchPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    Please select a product type to pull up a list of products. Once you select a product from the list then the details will appear below.<br />
    <br />
    <div><div style="float:left;width:209px">
        <asp:Label ID="TopicLabel" runat="server" Text="Topic: "></asp:Label>
        <asp:DropDownList ID="TopicList" runat="server" DataSourceID="TopicNames" DataTextField="topicCode" DataValueField="topicCode" AutoPostBack="True">
        </asp:DropDownList>
    </div>
    <div style="float:left;width:209px">
        <asp:Label ID="TypeLabel" runat="server" Text="Product Type: "></asp:Label>
        <asp:DropDownList ID="ProductTypeList" runat="server" DataSourceID="ProductType" DataTextField="Product Type" DataValueField="Product Type" AutoPostBack="True">
        </asp:DropDownList>
    </div>
    <asp:Button CssClass="btn btn-primary" ID="searchButton" runat="server" Text="Search" />
    </div>
    <br />
    <br />
<asp:SqlDataSource ID="TopicNames" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT topicCode FROM platformTopic"></asp:SqlDataSource>
<asp:SqlDataSource ID="ProductType" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT styleDescription AS 'Product Type' FROM platformStyle WHERE (NOT (styleDescription = N'OnlineCourse'))"></asp:SqlDataSource>
    <br />
<br />
<br />
<asp:GridView ID="ProductDescriptionGrid" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="sqlProductListing" AllowSorting="True" DataKeyNames="productID" Visible="False" Width="648px" EmptyDataText="No results. Please change your search parameters.">
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
    <br />
    <asp:GridView ID="eCourseDescriptionGrid" CssClass="table table-striped table-bordered table-hover" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="sqlECourseListing" Visible="False" Width="644px" DataKeyNames="ecourseID" EmptyDataText="No results. Please change your search parameters.">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Topic" HeaderText="Topic" SortExpression="Topic" />
            <asp:BoundField DataField="Hosting Firm" HeaderText="Hosting Firm" SortExpression="Hosting Firm" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="Instructor" HeaderText="Instructor" ReadOnly="True" SortExpression="Instructor" />
            <asp:BoundField DataField="ecourseID" HeaderText="ecourseID" SortExpression="ecourseID" InsertVisible="False" ReadOnly="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sqlECourseListing" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformProduct.productName AS Name, platformTopic.topicCode AS Topic, platformFirm.firmName AS [Hosting Firm], platformEcourse.price, platformInstructor.firstName + ' ' + platformInstructor.lastName AS Instructor, platformEcourse.ecourseID FROM platformEcourse INNER JOIN platformProduct ON platformEcourse.productID = platformProduct.productID INNER JOIN platformTopic ON platformProduct.topicID = platformTopic.topicID INNER JOIN platformCategory ON platformProduct.categoryID = platformCategory.categoryID INNER JOIN platformFirm ON platformEcourse.firmID = platformFirm.firmID AND platformProduct.firmID = platformFirm.firmID INNER JOIN platformInstructor ON platformEcourse.instructorID = platformInstructor.instructorID WHERE (platformTopic.topicCode = @topic) AND (platformCategory.description = N'OnlineCourse')">
        <SelectParameters>
            <asp:ControlParameter ControlID="TopicList" Name="topic" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>



