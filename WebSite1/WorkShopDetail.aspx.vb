
Imports System.Data

Partial Class WorkShopDetail
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(sender As Object, e As EventArgs)
        Dim id As Integer = Request.QueryString("id")
        Dim curDate As String = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")
        workshopSqlDataSource.SelectParameters("workshopID").DefaultValue = id
        Dim dv As DataView = CType(workshopSqlDataSource.Select(DataSourceSelectArguments.Empty), DataView)
        If dv.Count > 0 Then
            Topic.Text = dv(0)(5)
            Location.Text = dv(0)(2)
            Instructor.Text = dv(0)(7) + " " + dv(0)(6)
            Firm.Text = dv(0)(8)
            City.Text = dv(0)(1)
            Schedule.Text = dv(0)(3)
            Price.Text = dv(0)(4)
        End If
        If Schedule.Text >= curDate Then
            workshopCartButton.Enabled = False
            workshopCartButton.Text = "Not available"
        End If

        If Session("id") Is Nothing Then
            workshopCartButton.Enabled = False
            Nonmember.Text = "You are not currently signed in. Please sign in to add to your cart."
        End If
    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub


    Protected Sub workshopCartButton_Click(sender As Object, e As EventArgs) Handles workshopCartButton.Click
        Dim workshopid As Integer = Request.QueryString("id")
        Dim userid As Integer = Session("id")
        Dim userDV As DataView = CType(userSqlDataSource.Select(DataSourceSelectArguments.Empty), DataView)

        If userDV.Count = 0 Then
            Dim curDate As String = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")
            userSqlDataSource.InsertParameters("orderDate").DefaultValue = curDate
            userSqlDataSource.InsertParameters("userID").DefaultValue = userid
            userSqlDataSource.InsertParameters("orderStatusId").DefaultValue = 1
            userSqlDataSource.Insert()

        End If
        userDV = CType(userSqlDataSource.Select(DataSourceSelectArguments.Empty), DataView)
        workshopSqlDataSource.InsertParameters("orderID").DefaultValue = userDV(0)(0)
        workshopSqlDataSource.InsertParameters("productID").DefaultValue = Nothing
        workshopSqlDataSource.InsertParameters("workshopID").DefaultValue = workshopid
        workshopSqlDataSource.InsertParameters("quantity").DefaultValue = 1

        Dim count As Integer = workshopSqlDataSource.Insert()
    End Sub

End Class
