<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Schedule.aspx.vb" Inherits="Admin_Schedule" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <br /><br /><br />
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <label>Start Date:</label>
                <div class="input-group date">
                    <asp:TextBox AutoPostBack="true" ClientIDMode="Static" CssClass="form-control" ID="tbDatepickerStart" runat="server"></asp:TextBox><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                </div>
                  
            </div>
      
        </div>
        <DayPilot:DayPilotScheduler ID="DayPilotScheduler1" runat="server" Days="3" BackColor="#FFFFD5" BorderColor="#000000" CssClassPrefix="scheduler_default"  DurationBarColor="Blue" EventBackColor="#FFFFFF" EventBorderColor="#000000" EventHeight="25" HeaderFontColor="0, 0, 0" HeaderHeight="17" HourBorderColor="#EAD098" HourNameBackColor="#ECE9D8" HourNameBorderColor="#ACA899"  HoverColor="#FFED95" DataStartField="StartTime" Width="100%" CellGroupBy="Day"
        CellDuration="30" DataResourceField="LocationID" DataValueField="EventID" DataEndField="EndTime" DataTextField="PersonName" NonBusinessBackColor="#FFF4BC"></DayPilot:DayPilotScheduler>
    </div>
     <script>
         $(document).ready(function () {
             var dp = $('.input-group.date');
            dp.datepicker({
                changeMonth: true,
                changeYear: true,
                autoclose: true,
                format: "mm/dd/yyyy"
            }).on('changeDate', function (ev) {
                $(this).blur();
                $(this).datepicker('hide');
            });
        });
    </script>
</asp:Content>

