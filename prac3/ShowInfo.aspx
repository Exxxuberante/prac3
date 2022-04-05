<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowInfo.aspx.cs" Inherits="prac3.ShowInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataKeyNames="Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Номер" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Firstname" HeaderText="Имя" SortExpression="Firstname" />
                <asp:BoundField DataField="Surname" HeaderText="Фамилия" SortExpression="Surname" />
                <asp:BoundField DataField="BbirthDate" HeaderText="Дата рождения" SortExpression="BbirthDate" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TradeCompanyConnectionString %>" SelectCommand="SELECT * FROM [Customers]" DeleteCommand="Delete from Customers where Id=@Id" InsertCommand="Insert into Customers (Firstname,Surname,BbirthDate) values (@Firstname,@Surname,@BbirthDate) " UpdateCommand="Update Customers set Firstname = @Firstname, Surname = @Surname,  BbirthDate = @BbirthDate where Id = @Id">
            <DeleteParameters>
                <asp:ControlParameter ControlID="GridView1" Name="Id" PropertyName="SelectedValue" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox4" Name="Firstname" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox5" Name="Surname" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox6" Name="BbirthDate" PropertyName="Text" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="GridView1" Name="Surname" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="GridView1" Name="BbirthDate" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="GridView1" Name="Id" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="GridView1" Name="Firstname" PropertyName="SelectedValue" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Номер" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="ProductName" HeaderText="Название товара" SortExpression="ProductName" />
                <asp:BoundField DataField="idCustomers" HeaderText="Номер заказчика" SortExpression="idCustomers" ReadOnly="True" />
                <asp:BoundField DataField="Price" HeaderText="Цена" SortExpression="Price" />
                <asp:BoundField DataField="Quantity" HeaderText="Количество" SortExpression="Quantity" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TradeCompanyConnectionString %>" InsertCommand="Insert into Orders (ProductName,idCustomers,Price,Quantity) values (@ProductName,@idCustomers,@Price,@Quantity) " SelectCommand="SELECT * FROM [Orders] WHERE ([idCustomers] = @idCustomers)" DeleteCommand="Delete from Orders where Id=@Id " UpdateCommand="Update Orders set ProductName = @ProductName, idCustomers = @idCustomers, Price = @Price, Quantity = @Quantity where Id=@Id ">
            <DeleteParameters>
                <asp:ControlParameter ControlID="GridView2" Name="Id" PropertyName="SelectedValue" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="ProductName" PropertyName="Text" />
                <asp:ControlParameter ControlID="GridView1" Name="idCustomers" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TextBox2" Name="Price" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox3" Name="Quantity" PropertyName="Text" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="idCustomers" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="GridView2" Name="ProductName" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="GridView1" Name="idCustomers" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="GridView2" Name="Price" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="GridView2" Name="Quantity" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="GridView2" Name="Id" PropertyName="SelectedValue" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Добавить заказ" />
        &nbsp;
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Редактировать заказы" />
&nbsp;&nbsp;
        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Удалить заказ" />
&nbsp;<br />
        <br />
        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Добавить заказчика" />
&nbsp;&nbsp;
        <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Редактировать заказчика" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="Удалить заказчика" />
&nbsp;<asp:Panel ID="Panel1" runat="server" Visible="False">
            Название товара:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            Цена:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            Количество:<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Добавить" />
            <asp:Button ID="Button3" runat="server" Text="Отменить" />
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" Visible="False">
            Имя заказчика:
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            Фамилия заказчика:
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            Дата рождения заказчика:
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="Добавить" />
            &nbsp;
            <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="Отменить" />
        </asp:Panel>
    </form>
</body>
</html>
