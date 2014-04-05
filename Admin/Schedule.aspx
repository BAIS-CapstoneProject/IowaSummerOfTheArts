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
                    <asp:TextBox AutoPostBack="true" OnTextChanged="tbDatepickerStart_TextChanged" ClientIDMode="Static" CssClass="form-control" ID="tbDatepickerStart" runat="server"></asp:TextBox><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                </div>
                  
            </div>
            <div class="col-md-4">
                <label>Start Date:</label>
                <div class="input-group date">
                    <asp:TextBox AutoPostBack="true" ClientIDMode="Static" CssClass="form-control" ID="tbDatepickerEnd" runat="server"></asp:TextBox><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                </div>
                  
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <DayPilot:DayPilotScheduler EventClickHandling="PostBack"  OnEventClick="DayPilotScheduler1_EventClick" ID="DayPilotScheduler1" CssClass="table" runat="server"  CssClassPrefix="scheduler_default"  DataStartField="StartTime" Width="100%" CellGroupBy="Day"
        CellDuration="30" DataResourceField="LocationID" DataValueField="EventID" DataEndField="EndTime" DataTextField="PersonName"></DayPilot:DayPilotScheduler>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                  <asp:Label ID="lblEvent" runat="server" Text=""></asp:Label>
              </div>
              <div class="modal-body">
                <div class="form-group">
                    <label>Start Time:</label>
                    <asp:TextBox ID="tbStart" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>End Time:</label>
                    <asp:TextBox ID="tbEnd" runat="server"></asp:TextBox>
                    <asp:Label ID="lblEventID" runat="server" Text="" Visible="false"></asp:Label>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Save" />
              </div>
            </div>
          </div>
        </div>
    </div>
    <script type="text/javascript">
        function openModal() {
            $('#myModal').modal('show')
        }
           
    </script>
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

