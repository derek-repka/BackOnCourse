<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Cart.aspx.vb" Inherits="CartPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container" style="margin-top: 20px">
      <div class="col-md-10 col-md-offset-1">
        <div class="panel panel-default">
          <!-- Default panel contents -->
          <div class="panel-heading">Your Shopping Cart</div>
                 <!-- start of cartProdcutDataSource -->
                <asp:SqlDataSource ID="cartProductDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformOrderLine.quantity , platformProduct.productName, platformProduct.price AS productPrice, platformStyle.styleDescription, platformOrderLine.orderLineID FROM platformUser INNER JOIN platformOrder ON platformUser.userID = platformOrder.userID INNER JOIN platformOrderLine ON platformOrder.orderID = platformOrderLine.orderID INNER JOIN platformProduct ON platformOrderLine.productID = platformProduct.productID LEFT OUTER JOIN platformStyle ON platformProduct.styleID = platformStyle.styleID WHERE (platformOrder.orderStatusID = 1) AND (platformUser.userID = @userID)" DeleteCommand="DELETE FROM platformOrderLine WHERE (orderLineID = @orderLineID)">
                    <DeleteParameters>
                        <asp:Parameter Name="orderLineID" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="-1" Name="userID" SessionField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
                <!-- start of cartWorkshopDataSource -->
                <asp:SqlDataSource ID="cartWorkshopDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformWorkshop.city, platformWorkshop.location, platformWorkshop.dateTime, platformWorkshop.price AS workshopPrice, platformOrderLine.quantity, platformTopic.topicCode, platformOrderLine.orderLineID FROM platformUser INNER JOIN platformOrder ON platformUser.userID = platformOrder.userID INNER JOIN platformOrderLine ON platformOrder.orderID = platformOrderLine.orderID INNER JOIN platformWorkshop ON platformOrderLine.workshopID = platformWorkshop.workshopID LEFT OUTER JOIN platformTopic ON platformWorkshop.topicID = platformTopic.topicID WHERE (platformUser.userID = @userID) AND (platformOrder.orderStatusID = 1)" DeleteCommand="DELETE FROM platformOrderLine WHERE (orderLineID = @orderLineID)">                                  
                    <DeleteParameters>
                        <asp:Parameter Name="orderLineID" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="-1" Name="userID" SessionField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <br />
                <div class="container">
                <div class="col-md-9">
                <div class="panel panel-default">
                <!-- gridview for cartProductGridView -->
                <asp:GridView ID="CartProductGridView"  CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="orderLineID" DataSourceID="cartProductDataSource" EmptyDataText="No Ecourse and Physical Product in Your Cart" ShowFooter="true">
                      <Columns>
                          <asp:BoundField DataField="productName" HeaderText="ProductName" SortExpression="productName"  FooterText="Subtotal"/>
                          <asp:BoundField DataField="styleDescription" HeaderText="Description" SortExpression="styleDescription" />
                          <asp:BoundField DataField="productPrice" HeaderText="Price" SortExpression="productPrice" />
                          <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
                          <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="btn btn-danger"  ButtonType="Button"/>
                      </Columns>
                </asp:GridView>
                </div>
                </div>
                </div>

                <div class="container">
                <div class="col-md-9">
                <div class="panel panel-default">
                <!-- gridview for cartWorkshopGridview -->
                <asp:GridView ID="CartWorkshopGridView" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="orderLineID" DataSourceID="cartWorkshopDataSource" EmptyDataText="No Workshop in Your Cart" ShowFooter="true">
                    <Columns>
                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" FooterText="Subtotal" />
                        <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
                        <asp:BoundField DataField="topicCode" HeaderText="TopicCode" SortExpression="topicCode" />
                        <asp:BoundField DataField="dateTime" HeaderText="DateTime" SortExpression="dateTime" />
                        <asp:BoundField DataField="workshopPrice" HeaderText="Price" SortExpression="workshopPrice" />
                        <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
                        <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="btn btn-danger"  ButtonType="Button">
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
                </div>
                </div>
                </div>

              </div>
              <div class="panel-footer">
                  <div class="text-right">
                      <h4>Total Price:&nbsp;&nbsp;
                          <asp:Label ID="TotalPrice" runat="server" Text="totalprice"></asp:Label>
                      </h4>
                      <asp:SqlDataSource ID="totalPriceDataSource" runat="server"></asp:SqlDataSource>
                      <a href="Purchase.aspx" class="btn btn-primary" id="btnCheckout">Checkout</a>
                  </div>
              </div>
      </div>
    </div>
</asp:Content>

