<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="NewLocation.aspx.vb" Inherits="Admin_NewLocation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
            
        <br /><br /><br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" DeleteCommand="DELETE FROM [Location] WHERE [LocationID] = @LocationID" InsertCommand="INSERT INTO [Location] ([Name], [Category]) VALUES (@Name, @Category)" SelectCommand="SELECT * FROM [Location]" UpdateCommand="UPDATE [Location] SET [Name] = @Name, [Category] = @Category WHERE [LocationID] = @LocationID">
                <DeleteParameters>
                    <asp:Parameter Name="LocationID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Category" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Category" Type="String" />
                    <asp:Parameter Name="LocationID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="table-responsive">
                        <asp:DetailsView ID="DetailsView1" runat="server" Height="75px" Width="150px" DataSourceID="SqlDataSource1" DefaultMode="Insert">
                            <Fields>
                                <asp:CommandField ShowInsertButton="True" />
                            </Fields>
                        </asp:DetailsView>
                        
                    </div>
                </div>
            </div>
            <a class="btn btn-primary" href="NewLocation.aspx" role="button">Back</a>
    </div>
</asp:Content>

