
Partial Class CourseListing
    Inherits System.Web.UI.Page

    Private Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
        courseDate.Text = Calendar1.SelectedDate.ToShortDateString()
    End Sub

    Private Sub Courses_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Courses.SelectedIndexChanged
        Dim id As String = Courses.Rows(Courses.SelectedIndex).Cells(7).Text
        Response.Redirect("WorkShopDetail.aspx?id=" + id)

    End Sub

    Private Sub searchButton_Click(sender As Object, e As EventArgs) Handles searchButton.Click
        Courses.DataBind()
    End Sub


End Class
