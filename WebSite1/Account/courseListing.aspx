<!DOCTYPE html>
<script runat="server">

    Protected Sub Page_Load(sender As Object, e As EventArgs)

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs)

    End Sub
</script>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Back on Course</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
      <style type="text/css">
          .auto-style1 {
              left: 0px;
              top: 0px;
              width: 1188px;
          }
          .auto-style2 {
              position: relative;
              min-height: 1px;
              float: left;
              width: 26%;
              left: -4px;
              top: 1px;
              height: 48px;
              padding-left: 15px;
              padding-right: 15px;
          }
          .auto-style3 {
              position: relative;
              min-height: 1px;
              float: left;
              width: 22%;
              left: 0px;
              top: 0px;
              padding-left: 15px;
              padding-right: 15px;
          }
          .auto-style4 {
              position: relative;
              min-height: 1px;
              float: left;
              width: 25%;
              left: 34px;
              top: 0px;
              padding-left: 15px;
              padding-right: 15px;
          }
      </style>
      </head>
  <body>
      <form id="form1" runat="server">
    <div class="container" style="margin-top: 20px;">
      <div class="col-md-10 col-md-offset-1">
        <div class="panel panel-default">
        <div class="panel-body">
        <div class="search-bar">
          <h4>Search for Courses</h4>
          <hr>
          <div class="form-group">
            <div class="auto-style3">
                Course Topic:&nbsp;<asp:DropDownList ID="Topic" runat="server" DataSourceID="sqltopicsdb" DataTextField="Topic" DataValueField="Topic">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sqltopicsdb" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT topicCode AS Topic FROM platformTopic"></asp:SqlDataSource>
            </div>
            <div class="auto-style2">
             <p>
                 City:
                <asp:TextBox ID="City" Columns="20" runat="server"></asp:TextBox>
             </p>
            </div>
            <div class="auto-style4">
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
            </div>
          </div>
        </div>
        </div>
        </div>
         <div class="auto-style1">
            <asp:GridView ID="Courses" runat="server" Width="920px" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowSorting="True" Height="80px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                <Columns>
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                    <asp:BoundField DataField="Date &amp; Time" HeaderText="Date &amp; Time" SortExpression="Date &amp; Time" />
                    <asp:BoundField DataField="Topic" HeaderText="Topic" SortExpression="Topic" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Hosting Company" HeaderText="Hosting Company" SortExpression="Hosting Company" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformWorkshop.city AS City, platformWorkshop.location AS Location, platformWorkshop.dateTime AS [Date &amp; Time], platformTopic.topicCode AS Topic, platformWorkshop.price AS Price, platformFirm.firmName AS [Hosting Company] FROM platformWorkshop INNER JOIN platformTopic ON platformWorkshop.topicID = platformTopic.topicID INNER JOIN platformFirm ON platformWorkshop.firmID = platformFirm.firmID WHERE (platformTopic.topicCode = @topic) AND (platformWorkshop.city LIKE @city) AND (platformWorkshop.dateTime &gt;= @date)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Topic" Name="topic" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="City" Name="city" PropertyName="Text" />
                    <asp:ControlParameter ControlID="Calendar1" Name="date" PropertyName="SelectedDate" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
      </div>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>
      </form>
  </body>
</html>