Imports System.Data.SqlClient
Imports System.Data

Partial Class Admin_Schedule
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If (Not IsPostBack) Then
            loadResources()

            Dim Start = "2014-06-06"
            DayPilotScheduler1.StartDate = Start
            DayPilotScheduler1.DataSource = dbGetEvents(DayPilotScheduler1.StartDate, DayPilotScheduler1.Days)
            DayPilotScheduler1.DataBind()
        End If
    End Sub

    Private Sub loadResources()
        Dim da As New SqlDataAdapter("SELECT LocationID AS LocationID, Name As LocationName FROM [Location]", ConfigurationManager.ConnectionStrings("6k185Arts4ConnectionString").ConnectionString)
        Dim dt As New DataTable()
        da.Fill(dt)

        For Each r As DataRow In dt.Rows
            Dim name As String = DirectCast(r("LocationName"), String)
            Dim id As String = DirectCast(r("LocationID").ToString(), String)

            DayPilotScheduler1.Resources.Add(name, id)
        Next
    End Sub

    Private Function dbGetEvents(start As Date, days As Integer) As Object
        Dim da As New SqlDataAdapter("SELECT [EventID], Events.LocationID AS LocationID, [StartTime], [EndTime], Events.PersonID AS PersonID, Person.Name AS PersonName FROM [Events], [Location], [Person] WHERE (Events.PersonID = Person.PersonID) AND (Events.LocationID = Location.LocationID) AND NOT (([StartTime] <= @start) OR ([EndTime] >= @end)) ", ConfigurationManager.ConnectionStrings("6k185Arts4ConnectionString").ConnectionString)
        da.SelectCommand.Parameters.AddWithValue("start", start)
        da.SelectCommand.Parameters.AddWithValue("end", start.AddDays(days))
        Dim dt As New DataTable()
        da.Fill(dt)
        Return dt
    End Function

End Class
