<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="NewFest.aspx.vb" Inherits="Admin_NewFest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
            
        <br /><br /><br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" DeleteCommand="DELETE FROM [Festival] WHERE [festivalID] = @festivalID" InsertCommand="INSERT INTO [Festival] ([name], [current], [year]) VALUES (@name, @current, @year)" SelectCommand="SELECT * FROM [Festival]" UpdateCommand="UPDATE [Festival] SET [name] = @name, [current] = @current, [year] = @year WHERE [festivalID] = @festivalID">
                <DeleteParameters>
                    <asp:Parameter Name="festivalID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="current" Type="Boolean" />
                    <asp:Parameter Name="year" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="current" Type="Boolean" />
                    <asp:Parameter Name="year" Type="Int32" />
                    <asp:Parameter Name="festivalID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="table-responsive">
                        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" DataSourceID="SqlDataSource1" DefaultMode="Insert">
                            <Fields>
                                <asp:CommandField ShowInsertButton="True" />
                            </Fields>
                        </asp:DetailsView>
                        
                    </div>
                </div>
            </div>
        <a class="btn btn-primary" href="Festivals.aspx" role="button">Back</a>
    </div>
</asp:Content>

