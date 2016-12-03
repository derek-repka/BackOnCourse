<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Purchase.aspx.vb" Inherits="Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

<div class="container">
        <!-- separate the whole page into two part, left part would display the order, while the right part would display the payment panel -->
        <div class="row">
            <!-- start of the left part -->
            <div class="col-md-8">
                <!-- start of cart Workshop Data Source -->
                <asp:SqlDataSource ID="cartWorkshopDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformWorkshop.city, platformWorkshop.location, platformWorkshop.dateTime, platformWorkshop.price, platformOrderLine.quantity, platformTopic.topicCode, platformOrderLine.orderLineID FROM platformUser INNER JOIN platformOrder ON platformUser.userID = platformOrder.userID INNER JOIN platformOrderLine ON platformOrder.orderID = platformOrderLine.orderID INNER JOIN platformWorkshop ON platformOrderLine.workshopID = platformWorkshop.workshopID LEFT OUTER JOIN platformTopic ON platformWorkshop.topicID = platformTopic.topicID WHERE (platformUser.userID = @userID) AND (platformOrder.orderStatusID = 1)">                                  
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="-1" Name="userID" SessionField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>
                    
                <!-- start of cart eCourse Data Source -->
                <asp:SqlDataSource ID="carteCourseDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformOrderLine.quantity, platformProduct.productName, platformProduct.price AS productPrice, platformStyle.styleDescription, platformOrderLine.orderLineID FROM platformUser INNER JOIN platformOrder ON platformUser.userID = platformOrder.userID INNER JOIN platformOrderLine ON platformOrder.orderID = platformOrderLine.orderID INNER JOIN platformProduct ON platformOrderLine.productID = platformProduct.productID LEFT OUTER JOIN platformStyle ON platformProduct.styleID = platformStyle.styleID WHERE (platformOrder.orderStatusID = 1) AND (platformUser.userID = @userID) AND (platformProduct.styleID = 2)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="-1" Name="userID" SessionField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>
                    
                <!-- start of cart Prodcut Data Source -->
                <asp:SqlDataSource ID="cartProductDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformOrderLine.quantity, platformProduct.productName, platformProduct.price AS productPrice, platformStyle.styleDescription, platformOrderLine.orderLineID FROM platformUser INNER JOIN platformOrder ON platformUser.userID = platformOrder.userID INNER JOIN platformOrderLine ON platformOrder.orderID = platformOrderLine.orderID INNER JOIN platformProduct ON platformOrderLine.productID = platformProduct.productID LEFT OUTER JOIN platformStyle ON platformProduct.styleID = platformStyle.styleID WHERE (platformOrder.orderStatusID = 1) AND (platformUser.userID = @userID) AND (platformProduct.styleID &lt;&gt; 2)">
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

                <!-- gdv for Workshop -->
                <div class="container">
                    <div class="col-md-8">
                        <div class="panel panel-default">
                            <div class="panel-heading">Workshops</div>
                            <asp:GridView ID="CartWorkshopGridView" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="cartWorkshopDataSource" EmptyDataText="No Workshop in Your Cart">
                                <Columns>
                                    <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                                    <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
                                    <asp:BoundField DataField="dateTime" HeaderText="Date Time" SortExpression="dateTime" />
                                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                                    <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
                                    <asp:BoundField DataField="topicCode" HeaderText="Topic Code" SortExpression="topicCode" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <br />

                <!-- gdv for eCourse -->
                <div class=" container">
                    <div class="col-md-8">
                        <div class="panel panel-default">
                            <div class="panel-heading">eCourse</div>
                            <asp:GridView ID="CarteCourseGridView" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="orderLineID" DataSourceID="carteCourseDataSource" EmptyDataText="No eCourse and in Your Cart">
                                <Columns>
                                    <asp:BoundField DataField="productName" HeaderText="Product Name" SortExpression="productName" HeaderStyle-Width="50%"/>
                                    <asp:BoundField DataField="productPrice" HeaderText="Price" SortExpression="productPrice" HeaderStyle-Width="10%"/>
                                    <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" HeaderStyle-Width="15%"/>
                                    <asp:BoundField DataField="styleDescription" HeaderText="Style Description" SortExpression="styleDescription" HeaderStyle-Width="25%"/>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <br />

                <!-- gdv for Product -->
                <div class="container">
                    <div class="col-md-8">
                        <div class="panel panel-default">
                            <div class="panel-heading">Product</div>
                            <asp:GridView ID="CartProductGridView" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="orderLineID" DataSourceID="cartProductDataSource" EmptyDataText="No Product in Your Cart">
                                <Columns>
                                    <asp:BoundField DataField="productName" HeaderText="Product Name" SortExpression="productName" HeaderStyle-Width="50%"/>
                                    <asp:BoundField DataField="productPrice" HeaderText="Price" SortExpression="productPrice" HeaderStyle-Width="10%"/>
                                    <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" HeaderStyle-Width="15%"/>
                                    <asp:BoundField DataField="styleDescription" HeaderText="Style Description" SortExpression="styleDescription" HeaderStyle-Width="25%"/>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
            <style>
                .checkbox.pull-right { margin: 0; }
                .pl-ziro { padding-left: 0px; }
            </style>
            <!-- start of the right panel -->
            <div class="col-md-4">
                <br />        
                <div class="row">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                Payment Details
                            </h3>
                        </div>
                        <div class="panel-body">
                            <div role="form"> 
                                <div class="form-group">
                                    <label for="BAddress">
                                        BILLING ADDRESS</label>
                                    <input type="text" class="form-control" id="BAddress" placeholder="Billing Address"
                                        required autofocus />
                                </div>

                                <div class="form-group">
                                    <label for="SAddress">
                                        SHIPPING ADDRESS</label>
                                    <input type="text" class="form-control" id="SAddress" placeholder="Shipping Address"
                                        required autofocus />
                                </div>

                                <div class="form-group">
                                    <label for="cardNumber">
                                        CARD NUMBER</label>
                                    <input type="text" class="form-control" id="cardNumber" placeholder="Valid Card Number"
                                        required autofocus />
                                </div>
                                <div class="row">
                                    <div class="col-xs-7 col-md-6">
                                        <div class="form-group">
                                            <label for="expityMonth">
                                                EXPIRY DATE</label>
                                            <div class="col-xs-6 col-lg-6 pl-ziro">
                                                <input type="text" class="form-control" id="expityMonth" placeholder="MM" required />
                                            </div>
                                            <div class="col-xs-6 col-lg-6 pl-ziro">
                                                <input type="text" class="form-control" id="expityYear" placeholder="YY" required />
                                            </div>
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
                            <li class="active"><a href="#"><span class="badge pull-right">
                                $<asp:Label ID="finalPaymentLal" runat="server" Text="0.00"></asp:Label>
                                </span>&nbsp;Final Payment</a></li>
                        </ul>
                        <!-- this Data Source is used to display the total price -->
                        <asp:SqlDataSource ID="finalPaymentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT COALESCE (SUM(total), 0) AS total FROM (SELECT SUM(platformOrderLine.quantity * platformProduct.price) AS total FROM platformUser INNER JOIN platformOrder ON platformUser.userID = platformOrder.userID INNER JOIN platformOrderLine ON platformOrder.orderID = platformOrderLine.orderID INNER JOIN platformProduct ON platformOrderLine.productID = platformProduct.productID WHERE (platformUser.userID = @userID) AND (platformOrder.orderStatusID = 1) UNION ALL SELECT SUM(platformOrderLine_1.quantity * platformWorkshop.price) AS total FROM platformUser AS platformUser_1 INNER JOIN platformOrder AS platformOrder_1 ON platformUser_1.userID = platformOrder_1.userID INNER JOIN platformOrderLine AS platformOrderLine_1 ON platformOrder_1.orderID = platformOrderLine_1.orderID INNER JOIN platformWorkshop ON platformOrderLine_1.workshopID = platformWorkshop.workshopID WHERE (platformUser_1.userID = @userID) AND (platformOrder_1.orderStatusID = 1)) AS derivedtbl_1">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="-1" Name="userID" SessionField="id" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br/>
                        <a ID="payButton" runat="server" href="#" onserverclick="Pay" class="btn btn-success btn-lg btn-block" role="button">Pay</a>    
                        <br />                      
                        <a ID="backButton" runat="server" href="/Cart.aspx" class="btn btn-success btn-lg btn-block" role="button">Change your order</a>
                        <br />
                                                
                </div>
            </div>
        </div>
    </div>
</asp:Content>

