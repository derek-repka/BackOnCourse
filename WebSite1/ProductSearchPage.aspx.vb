Imports System.Data
Partial Class ProductSearchPage
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim type As String = Request.QueryString("type")
        If type = "courses" Then
            eCourseDescriptionGrid.Visible = True
            TypeLabel.Visible = False
            ProductTypeList.Visible = False


        ElseIf type = "products" Then
            ProductDescriptionGrid.Visible = True

        End If

    End Sub
    Protected Sub searchButton_Click(sender As Object, e As EventArgs) Handles searchButton.Click
        Dim type As String = Request.QueryString("type")
        If type = "products" Then
            ProductDescriptionGrid.DataBind()
        ElseIf type = "courses" Then
            eCourseDescriptionGrid.DataBind()
        End If


    End Sub

    Private Sub eCourseDescriptionGrid_SelectedIndexChanged(sender As Object, e As EventArgs) Handles eCourseDescriptionGrid.SelectedIndexChanged
        Dim id As String = eCourseDescriptionGrid.Rows(eCourseDescriptionGrid.SelectedIndex).Cells(6).Text
        Response.Redirect("CourseDetail.aspx?id=" + id)
    End Sub

    Private Sub ProductDescriptionGrid_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ProductDescriptionGrid.SelectedIndexChanged
        Dim id As String = ProductDescriptionGrid.Rows(ProductDescriptionGrid.SelectedIndex).Cells(6).Text
        Response.Redirect("ProductDetail.aspx?id=" + id)
    End Sub


End Class
