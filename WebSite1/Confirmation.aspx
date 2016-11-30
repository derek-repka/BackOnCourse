<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Confirmation.aspx.vb" Inherits="Confirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <!-- this is start of the order list -->
    <div class="container" style="margin-top: 20px">
      <div class="col-md-10 col-md-offset-1">
        <div class="row">
            <div class="col-md-15">
                <div class="panel panel-default">
                <!-- Default panel contents -->
                    <div class="panel-heading">Here is your order</div>
                <!-- start of cartProdcutDataSource -->
                <asp:SqlDataSource ID="cartProductDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformOrderLine.quantity, platformProduct.productName, platformProduct.price AS productPrice, platformStyle.styleDescription, platformOrderLine.orderLineID, platformOrder.orderID FROM platformUser INNER JOIN platformOrder ON platformUser.userID = platformOrder.userID INNER JOIN platformOrderLine ON platformOrder.orderID = platformOrderLine.orderID INNER JOIN platformProduct ON platformOrderLine.productID = platformProduct.productID LEFT OUTER JOIN platformStyle ON platformProduct.styleID = platformStyle.styleID WHERE (platformOrder.orderStatusID = 3) AND (platformUser.userID = @userID) AND (platformOrder.orderID = @orderID)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="-1" Name="userID" SessionField="id" />
                        <asp:Parameter Name="orderID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
                <asp:SqlDataSource ID="cartWorkshopDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformWorkshop.city, platformWorkshop.location, platformWorkshop.dateTime, platformWorkshop.price, platformOrderLine.quantity, platformTopic.topicCode, platformOrderLine.orderLineID, platformOrder.orderID FROM platformUser INNER JOIN platformOrder ON platformUser.userID = platformOrder.userID INNER JOIN platformOrderLine ON platformOrder.orderID = platformOrderLine.orderID INNER JOIN platformWorkshop ON platformOrderLine.workshopID = platformWorkshop.workshopID LEFT OUTER JOIN platformTopic ON platformWorkshop.topicID = platformTopic.topicID WHERE (platformUser.userID = @userID) AND (platformOrder.orderStatusID = 3) AND (platformOrder.orderID = @orderID)">                                  
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="-1" Name="userID" SessionField="id" />
                        <asp:Parameter Name="orderID" />
                    </SelectParameters>
                </asp:SqlDataSource>

                    <br />

                <div class="container">
                <div class="col-md-9">
                <div class="panel panel-default">
                <!-- gridview for cartProductGridView -->
                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="orderLineID" DataSourceID="cartProductDataSource" EmptyDataText="No Ecourse and Physical Product in Your Cart">
                      <Columns>
                          <asp:BoundField DataField="productName" HeaderText="ProductName" SortExpression="productName" />
                          <asp:BoundField DataField="styleDescription" HeaderText="Description" SortExpression="styleDescription" />
                          <asp:BoundField DataField="productPrice" HeaderText="Price" SortExpression="productPrice" />
                          <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
                      </Columns>
                </asp:GridView>
                </div>
                </div>
                </div>

                <div class="container">
                <div class="col-md-9">
                <div class="panel panel-default">
                <!-- gridview for cartWorkshopGridview -->
                <asp:GridView ID="GridView2" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="orderLineID" DataSourceID="cartWorkshopDataSource" EmptyDataText="No Workshop in Your Cart">
                    <Columns>
                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                        <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
                        <asp:BoundField DataField="topicCode" HeaderText="TopicCode" SortExpression="topicCode" />
                        <asp:BoundField DataField="dateTime" HeaderText="DateTime" SortExpression="dateTime" />
                        <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                        <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
                    </Columns>
                </asp:GridView>
                </div>
                </div>
                </div>
                    <div class="panel-footer">Order confirmed, thank you!</div>
                </div>
            </div>
            </div>
          </div>
        </div>

</asp:Content>