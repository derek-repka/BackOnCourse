
Partial Class ContentManager_ManageWorkshop
    Inherits System.Web.UI.Page

    Protected Sub CreateButton_Click(sender As Object, e As EventArgs) Handles CreateButton.Click
        sqldsWorkshop.InsertParameters("city").DefaultValue = City.Text
        sqldsWorkshop.InsertParameters("location").DefaultValue = Location.Text
        sqldsWorkshop.InsertParameters("dateTime").DefaultValue = [Date].Text
        sqldsWorkshop.InsertParameters("topicID").DefaultValue = TopicID.Text
        sqldsWorkshop.InsertParameters("firmID").DefaultValue = Session("firmID")
        sqldsWorkshop.InsertParameters("price").DefaultValue = Price.Text
        sqldsWorkshop.InsertParameters("quantity").DefaultValue = Quantity.Text
        sqldsWorkshop.InsertParameters("instructorID").DefaultValue = InstructorID.Text
        sqldsWorkshop.Insert()
        Created.Text = "Product created sucessfully."
    End Sub

End Class
