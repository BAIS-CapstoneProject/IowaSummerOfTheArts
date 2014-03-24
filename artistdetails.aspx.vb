
Partial Class artistdetails
    Inherits System.Web.UI.Page

   
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim artimage = From art In Person
                           Where cust.City = "London"
                           Order By cust.Name Ascending
                           Select Name = cust.Name, Phone = cust.Phone
        ArtistImage.ImageUrl=
        SqlDataSource1.
    End Sub
End Class
