Imports System.Data.SqlClient
Imports System.Data
Imports System.Globalization

Partial Class Admin_Schedule
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If (Not IsPostBack) Then
            tbDatepickerStart.Text = Date.Now.ToString("MM/dd/yyyy")
            Dim TodayDate As Date = Date.Now.ToString("MM/dd/yyyy")
            tbDatepickerEnd.Text = TodayDate.AddDays(3).ToString("MM/dd/yyyy")
            updateSchedule()
        Else
            updateSchedule()

        End If
    End Sub

    Private Sub loadResources()
        DayPilotScheduler1.Resources.Clear()
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

    Private Sub updateSchedule()
        loadResources()
        Dim Start As Date = DateTime.ParseExact(tbDatepickerStart.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture)

        DayPilotScheduler1.StartDate = Start

        Dim StartDate As Date = DateTime.ParseExact(tbDatepickerStart.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture)
        Dim EndDate As Date = DateTime.ParseExact(tbDatePickerEnd.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture)

        Dim days As Integer = EndDate.Subtract(StartDate).TotalDays

        days.ToString()

        DayPilotScheduler1.Days = days
        DayPilotScheduler1.DataSource = dbGetEvents(Start, days)
        DayPilotScheduler1.DataBind()
    End Sub

    Protected Sub tbDatepickerStart_TextChanged(sender As Object, e As EventArgs) Handles tbDatepickerStart.TextChanged
        Dim StartDate As Date = DateTime.ParseExact(tbDatepickerStart.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture)
        tbDatepickerEnd.Text = StartDate.AddDays(3).ToString("MM/dd/yyyy")
        updateSchedule()
    End Sub

    Protected Sub tbDatepickerEnd_TextChanged(sender As Object, e As EventArgs) Handles tbDatepickerEnd.TextChanged
        updateSchedule()
    End Sub

    Protected Sub DayPilotScheduler1_EventClick(sender As Object, e As DayPilot.Web.Ui.Events.EventClickEventArgs) Handles DayPilotScheduler1.EventClick
        Dim da As New SqlDataAdapter("SELECT [EventID], Events.LocationID AS LocationID, [StartTime], [EndTime], Events.PersonID AS PersonID, Person.Name AS PersonName FROM [Events], [Location], [Person] WHERE (EventID = @eventid) AND (Events.PersonID = Person.PersonID) AND (Events.LocationID = Location.LocationID)", ConfigurationManager.ConnectionStrings("6k185Arts4ConnectionString").ConnectionString)
        da.SelectCommand.Parameters.AddWithValue("eventid", e.Value)
        Dim dt As New DataTable()
        da.Fill(dt)
        ' 0 EventID, 1 LocationID, 2 Start Time, 3 EndTime, 4 PersonID, 5 Name

        lblEvent.Text = dt.Rows(0).Item(5).ToString()
        tbStart.Text = dt.Rows(0).Item(2).ToString()
        tbEnd.Text = dt.Rows(0).Item(3).ToString()
        lblEventID.Text = dt.Rows(0).Item(0).ToString()

        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "modal", "openModal()", True)
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        Using conn As New SqlConnection(ConfigurationManager.ConnectionStrings("6k185Arts4ConnectionString").ConnectionString)
            Dim cmd As New SqlCommand("UPDATE Events SET StartTime = @starttime, EndTime = @endtime WHERE EventID = @eventid", conn)

            Dim StartDate As Date = DateTime.ParseExact(tbStart.Text(), "M/d/yyyy h:mm:ss tt", CultureInfo.InvariantCulture)
            Dim EndDate As Date = DateTime.ParseExact(tbEnd.Text(), "M/d/yyyy h:mm:ss tt", CultureInfo.InvariantCulture)

            cmd.Parameters.AddWithValue("eventid", lblEventID.Text)
            cmd.Parameters.AddWithValue("starttime", StartDate)
            cmd.Parameters.AddWithValue("endtime", EndDate)

            conn.Open()
            cmd.ExecuteNonQuery()
            conn.Close()
        End Using
        updateSchedule()
    End Sub
End Class
