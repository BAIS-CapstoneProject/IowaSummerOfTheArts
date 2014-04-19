<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Admin_Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="../js/oocharts.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container"><br /><br /><br />
        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">Timeline</div>
                    <div class="panel-body">
                        <div id="timeline"></div>
                    </div> 
                </div> 
            </div>
            <div class="col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">Visits by Browser</div>
                    <div class="panel-body">
                        <div id="pie"></div>
                    </div> 
                </div> 
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Visits by Country</div>
                        <div class="panel-body">  
                            <div id="chart"></div>
                        </div> 
                    </div> 
                </div>
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Visits by City</div>
                        <div class="panel-body">  
                            <div id="table"></div>
                        </div> 
                    </div> 
                </div>
            </div>
            
        </div>
    </div>
    <script type="text/javascript">

        window.onload = function () {

            oo.setAPIKey("682e014a8dd8751367c9599dc1fbe6513dab6352");

            oo.load(function () {

                var timeline = new oo.Timeline("85002723", "30d");

                timeline.addMetric("ga:visits", "Visits");

                timeline.addMetric("ga:newVisits", "New Visits");

                timeline.draw('timeline');

                var pie = new oo.Pie("85002723", "30d");

                pie.setMetric("ga:visits", "Visits");
                pie.setDimension("ga:browser");

                pie.draw('pie');

                var bar = new oo.Bar("85002723", "30d");

                bar.addMetric("ga:visits", "Visits");

                bar.addMetric("ga:newVisits", "New Visits");

                bar.setDimension("ga:continent");

                bar.draw('chart');

                var table = new oo.Table("85002723", "30d");

                table.addMetric("ga:visits", "Visits");

                table.addDimension("ga:city", "City");

                table.draw('table');

            });
        };

		</script>
</asp:Content>

