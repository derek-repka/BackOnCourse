
Imports System.Data

Partial Class WorkshopDetail
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(sender As Object, e As EventArgs)
        Dim id As Integer = Request.QueryString("id")
        Dim workshopSqlDataSource As Object = Nothing
        workshopSqlDataSource.SelectParameters("workshopID").DefaultValue = id
        Dim dv As DataView = CType(workshopSqlDataSource.Select(DataSourceSelectArguments.Empty), DataView)
        If dv.Count > 0 Then
            Topic.Text = dv(0)(4)
            Location.Text = dv(0)(2)
            Instructor.Text = dv(0)(6)
            City.Text = dv(0)(1)
            Schedule.Text = dv(0)(3)
            Price.Text = dv(0)(7)
        End If
    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub


    Protected Sub workshopCartButton_Click(sender As Object, e As EventArgs) Handles workshopCartButton.Click
        Dim workshopid As Integer = Request.QueryString("id")
        Dim userid As Integer = Session("id")
        Dim userDV As DataView = CType(userSqlDataSource2.Select(DataSourceSelectArguments.Empty), DataView)

        If userDV.Count = 0 Then
            Dim curDate As String = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")
            userSqlDataSource2.InsertParameters("orderDate").DefaultValue = curDate
            userSqlDataSource2.InsertParameters("userID").DefaultValue = userid
            userSqlDataSource2.InsertParameters("orderStatusId").DefaultValue = 1
            userSqlDataSource2.Insert()

        End If
        userDV = CType(workshopSqlDataSource.Select(DataSourceSelectArguments.Empty), DataView)
        workshopSqlDataSource.InsertParameters("orderID").DefaultValue = userDV(0)(0)
        workshopSqlDataSource.InsertParameters("productID").DefaultValue = Nothing
        workshopSqlDataSource.InsertParameters("workshopID").DefaultValue = workshopid
        workshopSqlDataSource.InsertParameters("quantity").DefaultValue = 1

        Dim count As Integer = workshopSqlDataSource.Insert()
    End Sub

End Class
