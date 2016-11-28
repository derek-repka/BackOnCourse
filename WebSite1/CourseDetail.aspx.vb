
Imports System.Data

Partial Class CourseDetail
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(sender As Object, e As EventArgs)
        Dim id As Integer = Request.QueryString("id")
        productSqlDataSource.SelectParameters("productID").DefaultValue = id
        Dim dv As DataView = CType(productSqlDataSource.Select(DataSourceSelectArguments.Empty), DataView)
        If dv.Count > 0 Then
            TopicHolder.Text = dv(0)(8)
            Firm.Text = dv(0)(2)
            Instructor.Text = dv(0)(4) + " " + dv(0)(3)
            If DBNull.Value.Equals(dv(0)(11)) Then
                Description.Text = ""
            Else
                Description.Text = dv(0)(11)
            End If
            Status.Text = dv(0)(12)
            Price.Text = dv(0)(10)
            If Status.Text = "N" Then
                Status.Text = "No"
                CartCourseButton.Text = "Not available"
                CartCourseButton.Enabled = False

            ElseIf Status.Text = "Y" Then
                Status.Text = "Yes"
                End If


        End If
    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
    Protected Sub CartCourse_Click(sender As Object, e As EventArgs) Handles CartCourseButton.Click
        Dim productid As Integer = Request.QueryString("id")
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
        productSqlDataSource.InsertParameters("orderID").DefaultValue = userDV(0)(0)
        productSqlDataSource.InsertParameters("productID").DefaultValue = productid
        productSqlDataSource.InsertParameters("workshopID").DefaultValue = Nothing
        productSqlDataSource.InsertParameters("quantity").DefaultValue = 1

        Dim count As Integer = productSqlDataSource.Insert()
    End Sub
End Class
