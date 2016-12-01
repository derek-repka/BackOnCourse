<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CourseListing.aspx.vb" Inherits="CourseListing" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        Please select a topic, enter in a city name, or choose a date from the calendar, and click search to view safety training workshops open to registration. </p>
    <p>
        Click select to see more information a specific workshop.</p>
    <p>
        <br />
    </p>
      <div><div style="float:left;width:209px; height: 50px;">
          Course Topic: 
       <asp:DropDownList ID="topicslist" runat="server" DataSourceID="sqltopics" 
              DataTextField="Topic" DataValueField="Topic" AutoPostBack="True">
       </asp:DropDownList>
          </div>
          <div style="float:left;width:221px; height: 50px;"> City: <asp:TextBox ID="cityBox" runat="server" 
                  style="margin-top: 0" AutoPostBack="True"></asp:TextBox>
        </div>
          <div style="float:left;width:289px; height: 50px;">Workshop Date: 
              <asp:TextBox id="courseDate" runat="server" AutoPostBack="True" Width="120px"></asp:TextBox>&nbsp; <button type="button" class="btn btn-info bth-lg" data-toggle="modal" data-target="#myModal" style="background-image: url('images/calendar.png');">
                  &nbsp;&nbsp; </button>
          </div>
          <div style="float:left;width:243px; height: 50px;"><asp:Button CssClass="btn btn-primary" ID="searchButton" runat="server" Text="Search" />
        </div>
          <br />
      </div>
    <p>
        <asp:SqlDataSource ID="sqltopics" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT topicCode AS Topic FROM platformTopic"></asp:SqlDataSource>
    </p>
    <p>
        </p>
    <p>
        </p>
    <p>
        <asp:GridView ID="Courses" CssClass="table table-striped table-bordered table-hover" runat="server" Width="811px" AutoGenerateColumns="False" DataSourceID="sqlCourses" AllowSorting="True" Height="82px" DataKeyNames="Workshop Number">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                    <asp:BoundField DataField="Date &amp; Time" HeaderText="Date &amp; Time" SortExpression="Date &amp; Time" />
                    <asp:BoundField DataField="Topic" HeaderText="Topic" SortExpression="Topic" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Hosting Firm" HeaderText="Hosting Firm" SortExpression="Hosting Firm" />
                    <asp:BoundField DataField="Workshop Number" HeaderText="Workshop Number" InsertVisible="False" ReadOnly="True" SortExpression="Workshop Number" />
                </Columns>
        </asp:GridView>
            </p>

        <asp:SqlDataSource ID="sqlCourses" runat="server" 
        ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" 
        SelectCommand="SELECT platformWorkshop.city AS City, platformWorkshop.location AS Location, platformWorkshop.dateTime AS [Date &amp; Time], platformTopic.topicCode AS Topic, platformWorkshop.price AS Price, platformFirm.firmName AS [Hosting Firm], platformWorkshop.workshopID AS [Workshop Number] FROM platformWorkshop INNER JOIN platformTopic ON platformWorkshop.topicID = platformTopic.topicID INNER JOIN platformFirm ON platformWorkshop.firmID = platformFirm.firmID WHERE (platformTopic.topicCode = @topic) AND (@city is null or platformWorkshop.city LIKE @city) AND (@date is null or platformWorkshop.dateTime &gt;= @date)" 
        CancelSelectOnNullParameter="False">
                <SelectParameters>
                    <asp:ControlParameter ControlID="topicslist" Name="topic" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="cityBox" Name="city" PropertyName="Text" />
                    <asp:ControlParameter ControlID="courseDate" Name="date" PropertyName="Text" />
                </SelectParameters>
        </asp:SqlDataSource>

    <br />
    <span style="color: rgb(102, 106, 115); font-family: &quot;Benton Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-size: x-large; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: bold; letter-spacing: 0.5px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Attendance Guidelines </span>
    <span style="color: rgb(102, 106, 115); font-family: &quot;Benton Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-size: large; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: bold; letter-spacing: 0.5px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">
    <br />
    Be prepared for the event! 
    <br />
    <br />
    </span>
    <p>
        <span style="font-family: 'Benton Sans', 'Helvetica Neue', Helvetica, Roboto, Arial, sans-serif; font-size: 15px; color: #666A73; background-color: #FFFFFF">&nbsp;<img alt="" src="images/AttendanceListBullet.JPG" style="width: 18px; height: 24px" /> Please arrive 15 minutes early for registration on the first day. </span>
    </p>
    <p>
        <span style="font-family: 'Benton Sans', 'Helvetica Neue', Helvetica, Roboto, Arial, sans-serif; font-size: 15px; color: #666A73; background-color: #FFFFFF">&nbsp;<img alt="" src="images/AttendanceListBullet.JPG" style="width: 18px; height: 24px" /> Be present for the whole workshop. Full attendance is manditory and admittance is refused to anyone who arrives late.</span></p>
    <p>
        <span style="font-family: 'Benton Sans', 'Helvetica Neue', Helvetica, Roboto, Arial, sans-serif; font-size: 15px; color: #666A73; background-color: #FFFFFF">&nbsp;<img alt="" src="images/AttendanceListBullet.JPG" style="width: 18px; height: 24px" /> No outside food allowed as refreshments will be provided throughout the course.</span></p>
    <p>
        <span style="font-family: 'Benton Sans', 'Helvetica Neue', Helvetica, Roboto, Arial, sans-serif; font-size: 15px; color: #666A73; background-color: #FFFFFF">&nbsp;<img alt="" src="images/AttendanceListBullet.JPG" style="width: 18px; height: 24px" /> Dress business casual.</span></p>
    <p>
        <span style="font-family: 'Benton Sans', 'Helvetica Neue', Helvetica, Roboto, Arial, sans-serif; font-size: 15px; color: #666A73; background-color: #FFFFFF">&nbsp;<img alt="" src="images/AttendanceListBullet.JPG" style="width: 18px; height: 24px" /> Stationary will be provided.</span></p>
    <p>
        <span style="font-family: 'Benton Sans', 'Helvetica Neue', Helvetica, Roboto, Arial, sans-serif; font-size: 15px; color: #666A73; background-color: #FFFFFF">&nbsp;<img alt="" src="images/AttendanceListBullet.JPG" style="width: 18px; height: 24px" /> Remember to turn cell phones to silent during the workshop.</span></p>
    <p>
        <span style="font-family: 'Benton Sans', 'Helvetica Neue', Helvetica, Roboto, Arial, sans-serif; font-size: 15px; color: #666A73; background-color: #FFFFFF">&nbsp;<img alt="" src="images/AttendanceListBullet.JPG" style="width: 18px; height: 24px" /> The use of all recording devices are prohibited unless permission has been granted under special circumstances.</span></p>
    <p>
        <span style="font-family: 'Benton Sans', 'Helvetica Neue', Helvetica, Roboto, Arial, sans-serif; font-size: 15px; color: #666A73; background-color: #FFFFFF">&nbsp;<img alt="" src="images/AttendanceListBullet.JPG" style="width: 18px; height: 24px" /> Courses are occasionally photographed for publicity purposes; participants must notify staff if they do not consent to being photographed.</span></p>
    <p>
    <span style="font-family: 'Benton Sans', 'Helvetica Neue', Helvetica, Roboto, Arial, sans-serif; font-size: 15px; color: #666A73; background-color: #FFFFFF">&nbsp;<img alt="" src="images/AttendanceListBullet.JPG" style="width: 18px; height: 24px" /> Participants will not receive a full refund for withdrawals done less than 24 hours before an event.</span></p>
    <p>
        &nbsp;</p>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
      
    <!-- Modal content-->
    <div class="modal-content">
        
      <div class="modal-body">
        <p>
            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
            <TodayDayStyle BackColor="#CCCCCC" /></asp:Calendar>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="test">Close</button>
      </div>
    </div>

  </div>
</div>
</asp:Content>