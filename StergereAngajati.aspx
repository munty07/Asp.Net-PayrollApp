<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StergereAngajati.aspx.cs" Inherits="StergereAngajati" UnobtrusiveValidationMode="None"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Stergere Angajati</title>
    <link href="css/style.css" rel="stylesheet" /> 
    <link rel="stylesheet" type="text/css" href="style.css"/> 
    <style type="text/css">

        .auto-style2 {
            width: 56%;
        }
        .auto-style1 {
            width: 162px;
        }
        .auto-style8 {
            width: 396px;
        }
        .auto-style5 {
            width: 162px;
            height: 5px;
        }
        .auto-style6 {
            height: 5px;
            width: 396px;
        }
        .auto-style7 {
            height: 38px;
        }
        .auto-style9 {
            height: 38px;
            width: 396px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header id="header"> 
             <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
                  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick">
                    </asp:Timer>
            <asp:Label ID="lblTitlu" runat ="server" ForeColor="#3275a8"><h1>APLICATIE SALARIZARE&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblData" runat="server" Text=""></asp:Label></h1></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </header>

        <nav id="nav" style ="background-color: #3275a8;"> 
            <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" BackColor="#3275a8" Font-Size="X-Large" ForeColor="White">
                <DynamicHoverStyle BackColor="#3275a8" ForeColor="#000066" />
                <DynamicMenuItemStyle BackColor="#3275a8" ForeColor="White" />
                <DynamicMenuStyle BackColor="#3275a8" />
                <DynamicSelectedStyle BackColor="#3275a8" ForeColor="White" />
                <Items>
                    <asp:MenuItem Text="Acasa" Value="Acasa" NavigateUrl="~/Acasa.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Introducere Date" Value="Introducere Date">
                        <asp:MenuItem Text="Actualizare Date" Value="Actualizare Date" NavigateUrl="~/ActualizareDate.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Adaugare Angajati" Value="Adaugare Angajati" NavigateUrl="~/AdaugareAngajati.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Stergere Angajati" Value="Stergere Angajati" NavigateUrl="~/StergereAngajati.aspx"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Rapoarte" Value="Rapoarte">
                        <asp:MenuItem Text="Stat Plata" Value="Stat Plata" NavigateUrl="~/StatPlata.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Fluturasi" Value="Fluturasi" NavigateUrl="~/Fluturasi.aspx"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Procente" Value="Procente" NavigateUrl="~/ModificareProcente.aspx"></asp:MenuItem>
                </Items>
                <StaticHoverStyle BackColor="#3275a8" ForeColor="#000066" />
            </asp:Menu>
        </nav>
        <br />
        <asp:Label ID="lblError" runat="server" Font-Size="Large" ForeColor="#CC0000"></asp:Label>
        <br />
        <table class="auto-style2">
            <tr>
                <td colspan="2"><strong>Angajatul Cautat</strong></td>
            </tr>
            <tr>
                <td class="auto-style1">Nume</td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtNume" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNume" ErrorMessage="Numele trebuie sa contina doar litere" ForeColor="#CC0000" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="lblID" runat="server" Text="ID"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtID" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7"><asp:Button ID="btnCauta" runat="server" OnClick="btnCauta_Click" Text="Cauta Angajat" Width="165px" />
&nbsp;<br />
                    <asp:Button ID="btnSterge1" runat="server" OnClick="btnSterge1_Click" Text="Sterge Angajat" Width="165px" />
                </td>
                <td class="auto-style9">
                    <asp:Button ID="btnStergere" runat="server" Text="Sterge Angajat" Width="165px" OnClick="btnStergere_Click" />
                    <br />
                    <asp:Button ID="btnRenuntare" runat="server" OnClick="btnRenuntare_Click" Text="Renuntare Stergere" Width="165px" />
                </td>
            </tr>
        </table>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        </asp:GridView>
    </form>
</body>
</html>
