
Partial Class corseListing3
    Inherits System.Web.UI.Page

    Private Sub calanderButton_Click(sender As Object, e As EventArgs) Handles calanderButton.Click
        If (Calendar1.Visible = False) Then
            Calendar1.Visible = True
        Else
            Calendar1.Visible = False
        End If
    End Sub

    Private Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
        courseDate.Text = Calendar1.SelectedDate.ToShortDateString()
        Calendar1.Visible = False
    End Sub

    Private Sub Courses_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Courses.SelectedIndexChanged
        Dim id As String = Courses.Rows(Courses.SelectedIndex).Cells(6).Text
        Response.Redirect("CourseDetail.aspx?id=" + id)
    End Sub

    Private Sub searchButton_Click(sender As Object, e As EventArgs) Handles searchButton.Click
        Courses.Visible = True
    End Sub


End Class
