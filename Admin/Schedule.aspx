<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Schedule.aspx.vb" Inherits="Admin_Schedule" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br /><br />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Event Schedule</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <label>Date:</label>
                <div class="input-group date">
                    <asp:TextBox AutoPostBack="true" OnTextChanged="tbDatepickerStart_TextChanged" ClientIDMode="Static" CssClass="form-control" ID="tbDatepickerStart" runat="server"></asp:TextBox><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                </div>
                  
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive"><br />
                    <DayPilot:DayPilotScheduler EventClickHandling="PostBack" CellWidth="45"  HeaderHeight="20" Height="500px" OnEventClick="DayPilotScheduler1_EventClick" ID="DayPilotScheduler1" CssClass="table" runat="server"  DataStartField="StartTime" CellGroupBy="Hour"
        CellDuration="60" DataResourceField="LocationID" Days="1" DataValueField="EventID" DataEndField="EndTime" DataTextField="PersonName"></DayPilot:DayPilotScheduler>
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
                  <asp:Label ID="lblEventID" runat="server" Text="" Visible="false"></asp:Label>
                  <asp:Label ID="lblLocationID" runat="server" Text="" Visible="false"></asp:Label>
              </div>
              <div class="modal-body">
                <div class="form-group">
                    <label>Start Time:</label>
                    <asp:TextBox CssClass="form-control" ID="tbStart" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>End Time:</label>
                    <asp:TextBox CssClass="form-control" ID="tbEnd" runat="server"></asp:TextBox>
                    
                </div>
                  <div class="form-group">
                      <label>Location:</label>
                     <asp:DropDownList CssClass="form-control" ID="dlLocation" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="LocationID"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" SelectCommand="SELECT [LocationID], [Name] FROM [Location]"></asp:SqlDataSource>
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

