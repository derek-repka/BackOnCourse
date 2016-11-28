Imports System.Data
Partial Class ProductSearchPage
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim type As String = Request.QueryString("type")
        If type = "courses" Then
            TypeLabel.Visible = False
            ProductTypeList.Visible = False

        ElseIf type = "products" Then
            TypeLabel.Text = "Products"

        End If

    End Sub
    Protected Sub SearchButton_Click(sender As Object, e As EventArgs) Handles SearchButton.Click
        ProductDescriptionGrid.Visible = True
        ProductDescriptionGrid.DataBind()
        If ProductDescriptionGrid.Rows.Count() = 0 Then
            NoResult.Text = "No results. Please change your search parameters."
        Else
            NoResult.Text = ""
        End If
    End Sub

    Private Sub ProductDescriptionGrid_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ProductDescriptionGrid.SelectedIndexChanged
        Dim id As String = ProductDescriptionGrid.Rows(ProductDescriptionGrid.SelectedIndex).Cells(6).Text
        Response.Redirect("CourseDetail.aspx?id=" + id)
    End Sub
End Class
