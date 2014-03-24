<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="PerformerDetails.aspx.vb" Inherits="Performers_PerformerDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br /><br /><br />
    <div class="container">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="PersonID" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="row">
                <div class="col-md-12">
                    <h1><asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                        <span class="badge">
                            <asp:Label ID="CategoryLabel" runat="server" Text='<%# Bind("Category") %>' />
                        </span>
                    </h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("ImagePath") %>' AlternateText='<%# Bind("ImageName") %>'></asp:Image>
                </div>
                <div class="col-md-10">
                    <strong>Hometown:</strong> <asp:Label ID="HometownLabel" runat="server" Text='<%# Bind("Hometown") %>' />
                    <br />
                    <strong>Description:</strong> <br />
                    <p><%# Container.DataItem("Description") %></p>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>
        <div class="row">
            <div class="col-md-12">
                <h2>Upcoming Events</h2>
            </div>
        </div>
        <div class="row">
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
    </div>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" SelectCommand="SELECT * FROM [Person] WHERE ([PersonID] = @PersonID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="PersonID" QueryStringField="PersonID" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

