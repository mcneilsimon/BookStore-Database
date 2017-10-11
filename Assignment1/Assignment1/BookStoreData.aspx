<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookStoreData.aspx.cs" Inherits="Assignment1.BookStoreData" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!DOCTYPE html>

<br />
<br />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Store Data</title>
    <style type="text/css">

        input:focus {outline: none; }

        .grid td, .grid th {
            text-align:center;
        }
        .txtbox
        {
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;

        }
    </style>
</head>
<body>
    <div class="container-fluid">
    <form id="form1" runat="server">
            <asp:GridView ID="GridView1" CssClass="grid" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" ShowFooter="True" Width="1310px" OnRowDeleting="GridView1_RowDeleting" style="margin-right: 2px" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                <Columns>
                    <asp:CommandField ItemStyle-HorizontalAlign="Center" ShowDeleteButton="True"  ShowEditButton="True"  >

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:CommandField>

                    <asp:TemplateField  HeaderText="Id" InsertVisible="False" SortExpression="Id">
                        
                        <ItemStyle HorizontalAlign="center"></ItemStyle>
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                        </ItemTemplate>

                        <FooterTemplate>
                            <asp:LinkButton ValidationGroup="insert" OnClick="BtnInsert_Click" ID="btnInsert" runat="server">Insert</asp:LinkButton>
                        </FooterTemplate>
                        <FooterStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Book Title"  ItemStyle-HorizontalAlign="Center" SortExpression="BookTitle">
                        <ItemStyle HorizontalAlign="center"></ItemStyle>
                        <EditItemTemplate>
                            <asp:TextBox HorizontalAlign="center" Display="Dynamic" ID="TextBox1" runat="server" Text='<%# Bind("BookTitle") %>' width="115px"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvBookTitle" runat="server" ErrorMessage="Book Title is Required" 
                                ControlToValidate="TextBox1" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label Display="Dynamic" ID="Label2" runat="server" Text='<%# Bind("BookTitle") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox width="115px" Display="Dynamic" ID="txtBookTitle" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="insert" ID="rfvInsertBookTitle" runat="server" ErrorMessage="Book Title is Required"  ControlToValidate="txtBookTitle" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </FooterTemplate>
                        <FooterStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Authors" SortExpression="Authors">
                        <ItemStyle HorizontalAlign="center"></ItemStyle>
                        <EditItemTemplate>
                            <asp:TextBox HorizontalAlign="center" Display="Dynamic" ID="TextBox2" runat="server" Text='<%# Bind("Authors") %>' width="115px"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvAuthor" runat="server" ErrorMessage="Author Name is Required"
                                ControlToValidate="TextBox2" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label Display="Dynamic" ID="Label3" runat="server" Text='<%# Bind("Authors") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox Display="Dynamic" ID="txtAuthor" runat="server" width="115px"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="insert" ID="rfvInsertAuthor" runat="server" 
                                ErrorMessage="Author Name is Required" ControlToValidate="txtAuthor" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </FooterTemplate>
                        <FooterStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="ISBN" SortExpression="ISBN">
                        <ItemStyle HorizontalAlign="center"></ItemStyle>
                        <EditItemTemplate>
                            <asp:TextBox HorizontalAlign="center" Display="Dynamic" ID="TextBox3" runat="server" Text='<%# Bind("ISBN") %>' width="115px"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvISBN" runat="server" ErrorMessage="ISBN Number is Required"
                                ControlToValidate="TextBox3" Text="*" ForeColor="Red">
                            </asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator ID="reISBN" ValidationExpression="\d+" runat="server" ErrorMessage="Enter Proper ISBN Value"
                                ControlToValidate="TextBox3" ForeColor="Red" Display="Dynamic">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label Display="Dynamic" ID="Label4" runat="server" Text='<%# Bind("ISBN") %>'></asp:Label>
                        </ItemTemplate>

                        <FooterTemplate>
                            <asp:TextBox ID="txtInsertISBN" runat="server" Display="Dynamic" width="115px"></asp:TextBox>

                            <asp:RequiredFieldValidator  Display="Dynamic" ValidationGroup="insert" ID="rfvInsertISBM" runat="server" ErrorMessage="ISBN Number is Required"
                                ControlToValidate="txtInsertISBN" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="insert" ID="reISBNInsert" ValidationExpression="\d+" runat="server" ErrorMessage="Enter Proper ISBN Value"
                                ControlToValidate="txtInsertISBN" ForeColor="Red">*</asp:RegularExpressionValidator>

                        </FooterTemplate>
                        <FooterStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Date Published" SortExpression="DatePublished">
                        <ItemStyle HorizontalAlign="center"></ItemStyle>
                        <EditItemTemplate>
                            <asp:TextBox HorizontalAlign="center" ID="TextBox4" type="date" runat="server" Text='<%# Bind("DatePublished") %>' Display="Dynamic"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDatePublished" runat="server" ErrorMessage="Date Published is Required"
                                ControlToValidate="TextBox4" Display="Dynamic" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("DatePublished", "{0:d}") %>' Display="Dynamic"></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtDatePublished" type="date" runat="server" width="125px"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="insert" ID="rfvInsertDatePublished" runat="server" ErrorMessage="Date Published is Required"
                                ControlToValidate="txtDatePublished" Display="Dynamic" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </FooterTemplate>
                        <FooterStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField  HeaderText="Publisher" SortExpression="Publisher">
                        <ItemStyle HorizontalAlign="center"></ItemStyle>
                        <EditItemTemplate>
                            <asp:DropDownList HorizontalAlign="center" Display="Dynamic" ID="dropDownListPublisher" runat="server" SelectedValue='<%# Bind("Publisher") %>'>
                                <asp:ListItem>Select Publisher</asp:ListItem>
                                <asp:ListItem>Canada</asp:ListItem>
                                <asp:ListItem>International</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvEditPublisher" runat="server" ErrorMessage="Publisher is Required"
                                ControlToValidate="dropDownListPublisher" Text="*" ForeColor="Red" InitialValue="Select Publisher"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label Display="Dynamic" ID="Label6" runat="server" Text='<%# Bind("Publisher") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList Display="Dynamic" ID="ddlPublisher" runat="server">
                                <asp:ListItem>Select Publisher</asp:ListItem>
                                <asp:ListItem>Canada</asp:ListItem>
                                <asp:ListItem>International</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="insert" ID="rfvInsertEditPublisher" runat="server" ErrorMessage="Publisher is Required"
                                ControlToValidate="ddlPublisher" Text="*" ForeColor="Red" InitialValue="Select Publisher">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                        <FooterStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Category" SortExpression="Category">
                        <ItemStyle HorizontalAlign="center"></ItemStyle>
                        <EditItemTemplate>
                            <asp:DropDownList HorizontalAlign="center" Display="Dynamic" ID="dropDownListCategory" runat="server" SelectedValue='<%# Bind("Category") %>'>
                                <asp:ListItem>Select Category</asp:ListItem>
                                <asp:ListItem>Children&#39;s</asp:ListItem>
                                <asp:ListItem>Comics</asp:ListItem>
                                <asp:ListItem>Drama</asp:ListItem>
                                <asp:ListItem>Games</asp:ListItem>
                                <asp:ListItem>Health</asp:ListItem>
                                <asp:ListItem>Journals</asp:ListItem>
                                <asp:ListItem>Poetry</asp:ListItem>
                                <asp:ListItem>Sci-Fi</asp:ListItem>
                                <asp:ListItem>Travel</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvDropDownListCategory" runat="server" ErrorMessage="Category is Required"
                                ControlToValidate="dropDownListCategory" Text="*" ForeColor="Red" InitialValue="Select Category">
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label Display="Dynamic" ID="Label7" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList Display="Dynamic" ID="ddlCategory" runat="server">
                                <asp:ListItem>Select Category</asp:ListItem>
                                <asp:ListItem>Children&#39;s</asp:ListItem>
                                <asp:ListItem>Comics</asp:ListItem>
                                <asp:ListItem>Drama</asp:ListItem>
                                <asp:ListItem>Games</asp:ListItem>
                                <asp:ListItem>Health</asp:ListItem>
                                <asp:ListItem>Journals</asp:ListItem>
                                <asp:ListItem>Poetry</asp:ListItem>
                                <asp:ListItem>Sci-Fi</asp:ListItem>
                                <asp:ListItem>Travel</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator  ValidationGroup="insert" ID="rfvInsertDropDownListCategory" runat="server"
                                Display="Dynamic"
                                ErrorMessage="Category is Required"
                                ControlToValidate="ddlCategory" Text="*" ForeColor="Red" InitialValue="Select Category">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                        <FooterStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Page Count" SortExpression="PageCount">
                        <ItemStyle HorizontalAlign="center"></ItemStyle>
                        <EditItemTemplate>
                            <asp:TextBox HorizontalAlign="center" ID="TextBox7" runat="server" Text='<%# Bind("PageCount") %>' width="115px" Display="Dynamic"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvPageCount" runat="server" ErrorMessage="Total # of Pages is Required"
                                ControlToValidate="TextBox7" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator ID="rePage" ValidationExpression="\d+" runat="server" ErrorMessage="Enter A Proper Page Number"
                                ControlToValidate="TextBox7" Display="Dynamic" ForeColor="Red">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>

                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("PageCount") %>' Display="Dynamic"></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox Display="Dynamic" ID="txtPageCount" runat="server" width="115px"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="insert" ID="rfvInsertPageCount" 
                                runat="server" ErrorMessage="Total # of Pages is Required"
                                ControlToValidate="txtPageCount" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>

                                <asp:RegularExpressionValidator ValidationGroup="insert" ID="rePageInsert" ValidationExpression="\d+" runat="server" ErrorMessage="Enter A Proper Page Number"
                                ControlToValidate="txtPageCount" Display="Dynamic" ForeColor="Red">*</asp:RegularExpressionValidator>
                        </FooterTemplate>
                        <FooterStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Price" SortExpression="Price" >
                        <ItemStyle HorizontalAlign="center"></ItemStyle>
                        <EditItemTemplate >
                            <asp:TextBox HorizontalAlign="center" Display="Dynamic" ID="TextBox8" runat="server" Text='<%# Bind("Price") %>' width="115px"></asp:TextBox>

                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvPrice" runat="server" ErrorMessage="Price of Book is Required"
                                ControlToValidate="TextBox8" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator ID="rePrice" ValidationExpression="[-+]?[0-9]{0,3}\.?[0-9]{1,2}" runat="server" ErrorMessage="Enter Correct Price"
                                ControlToValidate="TextBox8" Display="Dynamic" ForeColor="Red">*</asp:RegularExpressionValidator>

                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("Price", "{0:c}") %>' Display="Dynamic"></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>

                            <asp:TextBox ID="txtPrice" runat="server" width="115px" Display="Dynamic"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="insert" ID="rfvInsertPrice" runat="server" ErrorMessage="Price of Book is Required"
                                ControlToValidate="txtPrice" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator  ValidationGroup="insert" ID="rePriceInsert" ValidationExpression="[-+]?[0-9]{0,3}\.?[0-9]{1,2}" runat="server" ErrorMessage="Enter Correct Price"
                                ControlToValidate="txtPrice" Display="Dynamic" ForeColor="Red">*</asp:RegularExpressionValidator>

                        </FooterTemplate>
                        <FooterStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
        <br />

            <asp:ValidationSummary ValidationGroup="insert" ID="ValidationSummary1" ForeColor="Red" runat="server" Font-Bold="True" Font-Size="Large" />
            <asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red" runat="server" Font-Bold="True" Font-Size="Large" />
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [BookStore] WHERE [Id] = @Id" 
            InsertCommand="INSERT INTO [BookStore] ([BookTitle], [Authors], [ISBN], [DatePublished], [Publisher], [Category], [PageCount], [Price]) VALUES (@BookTitle, @Authors, @ISBN, @DatePublished, @Publisher, @Category, @PageCount, @Price)" 
            SelectCommand="SELECT * FROM [BookStore]" 
            UpdateCommand="UPDATE [BookStore] SET [BookTitle] = @BookTitle, [Authors] = @Authors, [ISBN] = @ISBN, [DatePublished] = @DatePublished, [Publisher] = @Publisher, [Category] = @Category, [PageCount] = @PageCount, [Price] = @Price WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="BookTitle" Type="String" />
                <asp:Parameter Name="Authors" Type="String" />
                <asp:Parameter Name="ISBN" Type="Int32" />
                <asp:Parameter DbType="Date" Name="DatePublished" />
                <asp:Parameter Name="Publisher" Type="String" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="PageCount" Type="Int32" />
                <asp:Parameter Name="Price" Type="Double" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="BookTitle" Type="String" />
                <asp:Parameter Name="Authors" Type="String" />
                <asp:Parameter Name="ISBN" Type="Int32" />
                <asp:Parameter DbType="Date" Name="DatePublished" />
                <asp:Parameter Name="Publisher" Type="String" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="PageCount" Type="Int32" />
                <asp:Parameter Name="Price" Type="Double" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="btnShowData" class="btn btn-primary" runat="server" Text="Show Data" OnClick="btnShowData_Click" />
            <br />
            <br />
            <div class="dropdown">
                    <asp:DropDownList ID="selectBookDropDown" runat="server" AutoPostBack="True" OnSelectedIndexChanged="selectBookDropDown_SelectedIndexChanged1" >
                        <asp:ListItem Selected = "True" Text = "-----------SELECT BOOK TITLE------------" Value = "0"></asp:ListItem>
                    </asp:DropDownList>
            </div>

            &nbsp;&nbsp;
            <div class="dropdown">
                    <asp:DropDownList ID="selectCategoryDropDown" runat="server" AutoPostBack="True" OnSelectedIndexChanged="selectCategoryDropDown_SelectedIndexChanged" >
                        <asp:ListItem Selected = "True" Text = "-----------SELECT BOOK CATEGORY------------" Value = "0"></asp:ListItem>
                    </asp:DropDownList>
            </div>
        <br />
        <h2>
            <asp:Label ID="priceLbl" class="text-primary" runat="server" Text="Find A Book By Price"></asp:Label>
        </h2>
&nbsp;
        
        <asp:TextBox ID="txtBoxPrice" CssClass="txtbox" runat="server"></asp:TextBox>

    &nbsp;<asp:RequiredFieldValidator ValidationGroup="ValidationPriceFilter" Display="Dynamic"  ID="rfvFilterPrice" runat="server" ErrorMessage="Please Enter A Book Price"
                            ControlToValidate="txtBoxPrice" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>

        <asp:RegularExpressionValidator ValidationGroup="ValidationPriceFilter"  ID="rePriceFilter" ValidationExpression="[-+]?[0-9]{0,3}\.?[0-9]{1,2}" runat="server" ErrorMessage="Enter A Price Numerical Value"
                            ControlToValidate="txtBoxPrice" Display="Dynamic" ForeColor="Red">*
        </asp:RegularExpressionValidator>

        <asp:Button ID="btnFilterPrice" class="btn btn-primary" ValidationGroup="ValidationPriceFilter" runat="server" Text="Show Book Price Selection" OnClick="btnFilterPrice_Click" />
            <br />
            <br />
        <asp:ValidationSummary ValidationGroup="ValidationPriceFilter" ID="PriceFilterValidation" ForeColor="Red" runat="server" Font-Bold="True" Font-Size="Large" />
    </form>
    </div>
</body>
</html>
