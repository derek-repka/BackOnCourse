<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Confirmation.aspx.vb" Inherits="Confirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container">
    <!-- this is start of the order list -->
    <div class="container" style="margin-top: 20px">
      <div class="col-md-10 col-md-offset-1">
        <div class="row">
            <div class="col-md-8">
                <div class="panel panel-default">
                <!-- Default panel contents -->
                    <div class="panel-heading">Here is your order</div>
                                     <!-- start of cartProdcutDataSource -->
                <asp:SqlDataSource ID="cartProductDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformOrderLine.quantity, platformProduct.productName, platformProduct.price AS productPrice, platformStyle.styleDescription, platformOrderLine.orderLineID FROM platformUser INNER JOIN platformOrder ON platformUser.userID = platformOrder.userID INNER JOIN platformOrderLine ON platformOrder.orderID = platformOrderLine.orderID INNER JOIN platformProduct ON platformOrderLine.productID = platformProduct.productID LEFT OUTER JOIN platformStyle ON platformProduct.styleID = platformStyle.styleID WHERE (platformOrder.orderStatusID = 1) AND (platformUser.userID = @userID)" DeleteCommand="DELETE FROM platformOrderLine WHERE (orderLineID = @orderLineID)">
                    <DeleteParameters>
                        <asp:Parameter Name="orderLineID" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="-1" Name="userID" SessionField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
                <!-- start of cartWorkshopDataSource -->
                <asp:SqlDataSource ID="cartWorkshopDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformWorkshop.city, platformWorkshop.location, platformWorkshop.dateTime, platformWorkshop.price, platformOrderLine.quantity, platformTopic.topicCode, platformOrderLine.orderLineID FROM platformUser INNER JOIN platformOrder ON platformUser.userID = platformOrder.userID INNER JOIN platformOrderLine ON platformOrder.orderID = platformOrderLine.orderID INNER JOIN platformWorkshop ON platformOrderLine.workshopID = platformWorkshop.workshopID LEFT OUTER JOIN platformTopic ON platformWorkshop.topicID = platformTopic.topicID WHERE (platformUser.userID = @userID) AND (platformOrder.orderStatusID = 1)" DeleteCommand="DELETE FROM platformOrderLine WHERE (orderLineID = @orderLineID)">                                  
                    <DeleteParameters>
                        <asp:Parameter Name="orderLineID" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="-1" Name="userID" SessionField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <!-- gridview for cartProductGridView -->
                <asp:GridView ID="CartProductGridView" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="orderLineID" DataSourceID="cartProductDataSource" EmptyDataText="No Ecourse and Physical Product in Your Cart">
                      <Columns>
                          <asp:BoundField DataField="productName" HeaderText="productName" SortExpression="productName" />
                          <asp:BoundField DataField="styleDescription" HeaderText="styleDescription" SortExpression="styleDescription" />
                          <asp:BoundField DataField="productPrice" HeaderText="productPrice" SortExpression="productPrice" />
                          <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                          <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="btn btn-danger"  ButtonType="Button"/>
                      </Columns>
                </asp:GridView>
             
                <!-- gridview for cartWorkshopGridview -->
                <asp:GridView ID="CartWorkshopGridView" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="cartWorkshopDataSource" EmptyDataText="No Workshop in Your Cart">
                    <Columns>
                        <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                        <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />
                        <asp:BoundField DataField="dateTime" HeaderText="dateTime" SortExpression="dateTime" />
                        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                        <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                        <asp:BoundField DataField="topicCode" HeaderText="topicCode" SortExpression="topicCode" />
                        <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="btn btn-danger"  ButtonType="Button"/>
                    </Columns>
                </asp:GridView>
                    <div class="panel-footer">Order confirmed, thank you!</div>
                </div>
            </div>

</asp:Content>