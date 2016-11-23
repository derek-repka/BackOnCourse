
Imports System.Data

Partial Class CourseDetail
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(sender As Object, e As EventArgs)
        Dim id As Integer = Request.QueryString("id")
        productSqlDataSource.SelectParameters("productID").DefaultValue = id
        Dim dv As DataView = CType(productSqlDataSource.Select(DataSourceSelectArguments.Empty), DataView)
        If dv.Count > 0 Then
            TopicHolder.Text = dv(0)(1)
        End If
    End Sub
End Class
