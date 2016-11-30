<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Purchase.aspx.vb" Inherits="Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

<div class="container">
    <!-- this is start of the order list -->
    <div class="container" style="margin-top: 20px">
      <div class="col-md-10 col-md-offset-1">
        <div class="row">
            <div class="col-md-8">
                <div class="panel panel-default">
                <!-- Default panel contents -->
                    <div class="panel-heading">Your Shopping Cart</div>
                    <!-- start of cartProdcutDataSource -->
                    <asp:SqlDataSource ID="cartProductDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformOrderLine.quantity, platformProduct.productName, platformProduct.price AS productPrice, platformStyle.styleDescription, platformOrderLine.orderLineID FROM platformUser INNER JOIN platformOrder ON platformUser.userID = platformOrder.userID INNER JOIN platformOrderLine ON platformOrder.orderID = platformOrderLine.orderID INNER JOIN platformProduct ON platformOrderLine.productID = platformProduct.productID LEFT OUTER JOIN platformStyle ON platformProduct.styleID = platformStyle.styleID WHERE (platformOrder.orderStatusID = 1) AND (platformUser.userID = @userID)">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="-1" Name="userID" SessionField="id" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                
                    <!-- start of cartWorkshopDataSource -->
                    <asp:SqlDataSource ID="cartWorkshopDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformWorkshop.city, platformWorkshop.location, platformWorkshop.dateTime, platformWorkshop.price, platformOrderLine.quantity, platformTopic.topicCode, platformOrderLine.orderLineID FROM platformUser INNER JOIN platformOrder ON platformUser.userID = platformOrder.userID INNER JOIN platformOrderLine ON platformOrder.orderID = platformOrderLine.orderID INNER JOIN platformWorkshop ON platformOrderLine.workshopID = platformWorkshop.workshopID LEFT OUTER JOIN platformTopic ON platformWorkshop.topicID = platformTopic.topicID WHERE (platformUser.userID = @userID) AND (platformOrder.orderStatusID = 1)">                                  
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="-1" Name="userID" SessionField="id" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                    <!-- this is the data source for  pay button which update the order from pending to complete -->
                    <asp:SqlDataSource ID="paymentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformOrderLine.orderLineID FROM platformUser INNER JOIN platformOrder ON platformUser.userID = platformOrder.userID INNER JOIN platformOrderLine ON platformOrder.orderID = platformOrderLine.orderID WHERE (platformOrder.orderStatusID = 1) AND (platformUser.userID = @userID)" UpdateCommand="UPDATE platformOrder SET orderStatusID = 3">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="-1" Name="userID" SessionField="id" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <br />
                    <asp:GridView ID="CartProductGridView" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="orderLineID" DataSourceID="cartProductDataSource" EmptyDataText="No Ecourse and Physical Product in Your Cart">
                        <Columns>
                            <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                            <asp:BoundField DataField="productName" HeaderText="productName" SortExpression="productName" />
                            <asp:BoundField DataField="productPrice" HeaderText="productPrice" SortExpression="productPrice" />
                            <asp:BoundField DataField="styleDescription" HeaderText="styleDescription" SortExpression="styleDescription" />
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
                        </Columns>
                    </asp:GridView>

                    </div>
                </div>
            <!-- this is the start of payment details col -->
            <div class="col-md-4">
            <div class="row">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            Payment Details
                        </h3>
                    <div class="checkbox pull-right">
                        <label>
                            <input type="checkbox" />
                            Remember
                        </label>
                    </div>
                </div>
                <div class="panel-body">
                    <div role="form">
                        <div class="form-group">
                            <label for="cardNumber">
                                CARD NUMBER</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="cardNumber" placeholder="Valid Card Number"
                                    required autofocus />
                                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-7 col-md-7">
                                <div class="form-group">
                                    <label for="expityMonth">
                                        EXPIRY DATE</label>
                                    <div class="col-xs-6 col-lg-6 pl-ziro">
                                        <input type="text" class="form-control" id="expityMonth" placeholder="MM" required />
                                    </div>
                                    <div class="col-xs-6 col-lg-6 pl-ziro">
                                        <input type="text" class="form-control" id="expityYear" placeholder="YY" required /></div>
                                </div>
                            </div>
                            <div class="col-xs-5 col-md-5 pull-right">
                                <div class="form-group">
                                    <label for="cvCode">
                                        CV CODE</label>
                                    <input type="password" class="form-control" id="cvCode" placeholder="CV" required />
                                </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
                <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#"><span class="badge pull-right"><span class="glyphicon glyphicon-usd"></span>4200</span> Final Payment</a>
                </li>
            </ul>
            <br/>
                <a href="Confirmation.aspx" class="btn btn-success btn-lg btn-block" role="button">Pay</a>  
            </div>
            </div>
            </div>
            </div>
         </div>
      </div>
    <!-- the end of the order list -->

</asp:Content>

