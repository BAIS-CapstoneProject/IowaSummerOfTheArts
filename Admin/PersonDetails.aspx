<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="PersonDetails.aspx.vb" Inherits="Admin_Person" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" SelectCommand="SELECT * FROM [Person] WHERE ([PersonID] = @PersonID)" DeleteCommand="DELETE FROM [Person] WHERE [PersonID] = @PersonID" InsertCommand="INSERT INTO [Person] ([Name], [Description], [Hometown], [imagename], [imagepath], [Category], [Type]) VALUES (@Name, @Description, @Hometown, @imagename, @imagepath, @Category, @Type)" UpdateCommand="UPDATE [Person] SET [Name] = @Name, [Description] = @Description, [Hometown] = @Hometown, [imagename] = @imagename, [imagepath] = @imagepath, [Category] = @Category, [Type] = @Type WHERE [PersonID] = @PersonID">
        <DeleteParameters>
            <asp:Parameter Name="PersonID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Hometown" Type="String" />
            <asp:Parameter Name="imagename" Type="String" />
            <asp:Parameter Name="imagepath" Type="String" />
            <asp:Parameter Name="Category" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="PersonID" QueryStringField="personID" Type="Decimal" DefaultValue="0" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Hometown" Type="String" />
            <asp:Parameter Name="imagename" Type="String" />
            <asp:Parameter Name="imagepath" Type="String" />
            <asp:Parameter Name="Category" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="PersonID" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
<br /><br /><br /><br />
    <div class="container">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="PersonID" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            <div class="row">
                <div class="col-md-12">
                    <h1>
                        <asp:TextBox ID="NameTb" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        <span class="badge">
                            <asp:Textbox ID="CatTb" runat="server" Text='<%# Bind("Category") %>' ForeColor="Black" />
                        </span>
                    </h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("ImagePath") %>' AlternateText='<%# Bind("ImageName") %>'></asp:Image>
                </div>
                <div class="col-md-9">
                    <strong>Hometown:</strong> <asp:TextBox ID="HomeTb" runat="server" Text='<%# Bind("Hometown") %>' />
                    <br />
                    <strong>Description:</strong> <br />
                    <asp:TextBox ID="DescTb" runat="server" Text='<%# Bind("Description")%>' TextMode="MultiLine" Width="300px" Height="120px"></asp:TextBox>
                </div>
                <asp:LinkButton ID="UpdateBtn" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                <asp:LinkButton ID="CancelBtn" runat="server" CausesValidation="false" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
            </div>
            <br /><br>
        </EditItemTemplate>
        
        
        
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
                <div class="col-md-3">
                    
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("ImagePath") %>' AlternateText='<%# Bind("ImageName") %>'></asp:Image>
                </div>
                <div class="col-md-9">
                    <strong>Hometown:</strong> <asp:Label ID="HometownLabel" runat="server" Text='<%# Bind("Hometown") %>' />
                    <br />
                    <strong>Description:</strong> <br />
                    <p><%# Container.DataItem("Description") %></p>
                </div>
                <asp:LinkButton ID="EditButton" runat="server"

            CausesValidation="False" CommandName="Edit"

            Text="Edit">
</asp:LinkButton>

            </div>
            <br /><br>
        </ItemTemplate>
    </asp:FormView>
    </div>
</asp:Content>

