<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ActualizareDate.aspx.cs" Inherits="AdaugareAngajati" UnobtrusiveValidationMode="None"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Actualizare Date</title>
    <link href="css/style.css" rel="stylesheet" /> 
    <link rel="stylesheet" type="text/css" href="style.css"/> 
    <style type="text/css">
        .auto-style4 {
            height: 1012px;
        }
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 128px;
        }
    </style>
</head>
<body style="height: 1143px">
    <form id="form1" runat="server" class="auto-style4">
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
        Introduceti Numele Angajatului<br />
        <asp:TextBox ID="txtNumeCautat" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCauta" runat="server" OnClick="btnCauta_Click" Text="Cauta Angajat" />
        <br />
        <br />
        <asp:Label ID="lblError" runat="server" Font-Size="Large" ForeColor="#CC0000"></asp:Label>
        <br />
        <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateSelectButton="True">
        </asp:GridView>
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="394px">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblID" runat="server" Text="ID"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblNume" runat="server" Text="Nume"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNume" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNume" ErrorMessage="Numele trebuie sa contina doar litere" ForeColor="#CC0000" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblPrenume" runat="server" Text="Prenume"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPrenume" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPrenume" ErrorMessage="Prenumele trebuie sa contina doar litere" ForeColor="#CC0000" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblFunctie" runat="server" Text="Functie"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFunctie" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtFunctie" ErrorMessage="Functia trebuie sa contina doar litere" ForeColor="#CC0000" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblSalarBaza" runat="server" Text="Salar Baza"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSalar" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtSalar" ErrorMessage="Salariul trebuie sa fie un numar &gt;= 0" ForeColor="#CC0000" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblSpor" runat="server" Text="Spor"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSpor" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtSpor" ErrorMessage="Sporul trebuie sa fie &gt;=0" ForeColor="#CC0000" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblPremii" runat="server" Text="Premii Brute"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPremii" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtPremii" ErrorMessage="Premiile trebuie sa fie &gt;=0" ForeColor="#CC0000" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblRetineri" runat="server" Text="Retineri"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRetineri" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtRetineri" ErrorMessage="Retinerile trebuie sa fie &gt;=0" ForeColor="#CC0000" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Actualizare Date" Width="155px" />
                        <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Renuntare" Width="151px" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
    </form>
</body>
</html>

