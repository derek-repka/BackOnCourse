
Partial Class Admin_ManageCourse
    Inherits System.Web.UI.Page

    Protected Sub CreateButton_Click(sender As Object, e As EventArgs) Handles CreateButton.Click
        sqldseCourse.InsertParameters("firmID").DefaultValue = FirmID.Text
        sqldseCourse.InsertParameters("productName").DefaultValue = productName.Text
        sqldseCourse.InsertParameters("TopicID").DefaultValue = TopicID.Text
        sqldseCourse.InsertParameters("categoryID").DefaultValue = 2
        sqldseCourse.InsertParameters("quantityPerUnit").DefaultValue = Quantity.Text
        sqldseCourse.InsertParameters("price").DefaultValue = Price.Text
        sqldseCourse.InsertParameters("description").DefaultValue = description.Text
        sqldseCourse.InsertParameters("instructorID").DefaultValue = instructorID.Text
        sqldseCourse.InsertParameters("discontinued").DefaultValue = "N"
        sqldseCourse.InsertParameters("styleID").DefaultValue = 2
        sqldseCourse.Insert()
        Created.Text = "eCourse created sucessfully."
    End Sub
End Class
