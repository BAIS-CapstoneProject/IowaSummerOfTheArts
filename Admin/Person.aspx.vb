
Partial Class Admin_Person
    Inherits System.Web.UI.Page
    
    Protected Sub tbSearch_TextChanged(sender As Object, e As EventArgs) Handles tbSearch.TextChanged
        Dim search As String = "SELECT [PersonID], [Name], [Description], [Hometown], [imagename], [imagepath], [Category], [Type] FROM [Person] WHERE Name LIKE '%" + tbSearch.Text + "%'"
        SqlDataSource1.SelectCommand = search

    End Sub

    Protected Sub catDrop_DataBound(sender As Object, e As EventArgs) Handles catDrop.DataBound
        catDrop.Items.Insert(0, "All Types")


    End Sub

    
    Protected Sub catDrop_SelectedIndexChanged(sender As Object, e As EventArgs) Handles catDrop.SelectedIndexChanged
        If catDrop.Text = "All Types" Then
            Dim search As String = "SELECT [PersonID], [Name], [Description], [Hometown], [imagename], [imagepath], [Category], [Type] FROM [Person] "
            SqlDataSource1.SelectCommand = search
        Else
            Dim search As String = "SELECT [PersonID], [Name], [Description], [Hometown], [imagename], [imagepath], [Category], [Type] FROM [Person] WHERE Type = '" + catDrop.Text + "'"
            SqlDataSource1.SelectCommand = search
        End If
    End Sub
End Class

