
Partial Class Admin_ManageProduct
    Inherits System.Web.UI.Page

    Protected Sub CreateButton_Click(sender As Object, e As EventArgs) Handles CreateButton.Click
        sqldsProducts.InsertParameters("firmID").DefaultValue = FirmID.Text
        sqldsProducts.InsertParameters("productName").DefaultValue = productName.Text
        sqldsProducts.InsertParameters("topicID").DefaultValue = TopicID.Text
        sqldsProducts.InsertParameters("categoryID").DefaultValue = 1
        sqldsProducts.InsertParameters("styleID").DefaultValue = styleID.Text
        sqldsProducts.InsertParameters("quantityPerUnit").DefaultValue = Quantity.Text
        sqldsProducts.InsertParameters("price").DefaultValue = Price.Text
        sqldsProducts.InsertParameters("description").DefaultValue = description.Text
        sqldsProducts.InsertParameters("unitsInStock").DefaultValue = Unitsinstock.Text
        sqldsProducts.InsertParameters("unitsOnOrder").DefaultValue = Unitsonorder.Text
        sqldsProducts.InsertParameters("reorderLevel").DefaultValue = reorderLevel.Text
        sqldsProducts.InsertParameters("discontinued").DefaultValue = "N"
        sqldsProducts.Insert()
        Created.Text = "Product created sucessfully."
    End Sub

End Class
