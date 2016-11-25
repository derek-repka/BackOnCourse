
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
End Class
