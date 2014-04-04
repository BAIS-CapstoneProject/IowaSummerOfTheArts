<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Schedule.aspx.vb" Inherits="Admin_Schedule" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <br /><br /><br /><DayPilot:DayPilotScheduler ID="DayPilotScheduler1" runat="server" BackColor="#FFFFD5" BorderColor="#000000" CssClassPrefix="scheduler_default"  DurationBarColor="Blue" EventBackColor="#FFFFFF" EventBorderColor="#000000" EventHeight="25" HeaderFontColor="0, 0, 0" HeaderHeight="17" HourBorderColor="#EAD098" HourNameBackColor="#ECE9D8" HourNameBorderColor="#ACA899"  HoverColor="#FFED95" DataStartField="StartTime" Days="3" Width="100%" CellGroupBy="Day"
        CellDuration="30" DataResourceField="LocationID" DataValueField="EventID" DataEndField="EndTime" DataTextField="PersonName" NonBusinessBackColor="#FFF4BC"></DayPilot:DayPilotScheduler>
    </div>
    
</asp:Content>

