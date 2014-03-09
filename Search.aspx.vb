﻿Imports System.Data.SqlClient
Imports System.Data

Partial Class Search
    Inherits System.Web.UI.Page

    Protected Sub SetDataList()
        Dim myconn As SqlConnection
        Dim mycomm As SqlDataAdapter
        Dim search As String = String.Empty
        search = "SELECT Events.EventID, Events.FestivalID, Events.PersonID, Events.LocationID, Events.Time, Events.Date, Festival.festivalID AS Expr1, Festival.name, Festival.year, Location.LocationID AS Expr2, Location.Name AS Expr3, Person.PersonID AS Expr4, Person.Name AS Expr5, Person.Description, Person.imagename, Person.imagepath, Person.Type FROM Events INNER JOIN Festival ON Events.FestivalID = Festival.festivalID INNER JOIN Location ON Events.LocationID = Location.LocationID INNER JOIN Person ON Events.PersonID = Person.PersonID"
        myconn = New SqlConnection(ConfigurationManager.ConnectionStrings("6k185Arts4ConnectionString").ConnectionString.ToString)

        If dropdownlistFestival.SelectedIndex <> 0 Or dropdownlistFestival.SelectedIndex <> 0 Then
            search += " Where "
        End If
        If dropdownlistFestival.SelectedIndex <> 0 Then
            search += "Events.FestivalID = " + dropdownlistFestival.SelectedValue
            search += " AND Festival.year = " + dropdownlistFestival.SelectedItem.Text.Remove(0, 15)
        End If

        If dropdownlistPerson.SelectedIndex <> 0 Then
            search += " AND Person.Type LIKE '%" + dropdownlistPerson.SelectedItem.Text + "%'"
        End If


        mycomm = New SqlDataAdapter(search, myconn)
        Dim ds As DataSet = New DataSet

        mycomm.Fill(ds)

        DataList1.DataSource = ds
        DataList1.DataBind()
    End Sub

    Protected Sub dropdownlistFestival_DataBound(sender As Object, e As EventArgs) Handles dropdownlistFestival.DataBound
        SetDataList()
    End Sub

    Protected Sub dropdownlistPerson_DataBound(sender As Object, e As EventArgs) Handles dropdownlistPerson.DataBound
        SetDataList()
    End Sub

    Protected Sub dropdownlistFestival_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dropdownlistFestival.SelectedIndexChanged
        SetDataList()
    End Sub

    Protected Sub dropdownlistPerson_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dropdownlistPerson.SelectedIndexChanged
        SetDataList()
    End Sub
End Class
