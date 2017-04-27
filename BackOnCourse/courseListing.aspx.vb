
Partial Class CourseListing
    Inherits System.Web.UI.Page

    Private Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
        Dim curDate As String = DateTime.Now.ToString("yyyy-MM-dd")
        wrongDate.Visible = False
        If Calendar1.SelectedDate < curDate Then
            courseDate.Text = curDate
            wrongDate.Visible = True
        Else
            courseDate.Text = Calendar1.SelectedDate.ToShortDateString()
        End If
    End Sub

    Private Sub courseDate_TextChanged(sender As Object, e As EventArgs) Handles courseDate.TextChanged
        Dim curDate As String = DateTime.Now.ToString("yyyy-MM-dd")
        wrongDate.Visible = False
        If courseDate.Text < curDate Then
            courseDate.Text = curDate
            wrongDate.Visible = True
        End If

    End Sub

    Private Sub Courses_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Courses.SelectedIndexChanged
        Dim id As String = Courses.Rows(Courses.SelectedIndex).Cells(7).Text
        Response.Redirect("WorkShopDetail.aspx?id=" + id)

    End Sub

    Private Sub searchButton_Click(sender As Object, e As EventArgs) Handles searchButton.Click
        Courses.DataBind()
    End Sub


End Class
