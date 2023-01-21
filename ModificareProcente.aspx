<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ModificareProcente.aspx.cs" Inherits="ModificareProcente" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Modificare Procente</title>
    <link href="css/style.css" rel="stylesheet" /> 
    <link rel="stylesheet" type="text/css" href="style.css"/> 
    <style type="text/css">
        .auto-style1 {
            width: 125px;
        }
        .auto-style4 {
            width: 125px;
            height: 25px;
        }
        .auto-style5 {
            height: 25px;
        }
        .auto-style7 {
            width: 55%;
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
        <asp:Label ID="lblPass" runat="server" Text="Introduceti parola"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="txtParola" runat="server" TextMode="Password"></asp:TextBox>
        <asp:Button ID="btnPass" runat="server" OnClick="btnPass_Click" Text="Conectare" />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblEroare" runat="server"></asp:Label>
        <br />
        <table class="auto-style7">
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="lblCAS" runat="server" Text="CAS"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtCAS" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCAS" ErrorMessage="CAS-ul trebuie sa fie un nr: 0-100" ForeColor="#CC0000" ValidationExpression="^([0-9]|[1-9][0-9]|100)$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblCASS" runat="server" Text="CASS"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCASS" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtCASS" ErrorMessage="CASS-ul trebuie sa fie un nr: 0-100" ForeColor="#CC0000" ValidationExpression="^([0-9]|[1-9][0-9]|100)$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblImp" runat="server" Text="Impozit"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtImpozit" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtImpozit" ErrorMessage="Impozitul trebuie sa fie un nr: 0-100" ForeColor="#CC0000" ValidationExpression="^([0-9]|[1-9][0-9]|100)$"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnActualizare" runat="server" Text="Actualizare procente" OnClick="btnActualizare_Click" />
        <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Renuntare" Width="208px" />
        <br />
        <br />
    </form>
</body>
</html>
