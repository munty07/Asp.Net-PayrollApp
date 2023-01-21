<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fluturasi.aspx.cs" Inherits="Fluturasi" UnobtrusiveValidationMode="None" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fluturasi</title>
    <link href="css/style.css" rel="stylesheet" /> 
    <link rel="stylesheet" type="text/css" href="style.css"/> 
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
        &nbsp;&nbsp;&nbsp;
        Pentru a genera flutarasii tuturor angajatilor apasati pe urmatorul buton!
        <asp:Button ID="btnGenereaza" runat="server" OnClick="btnGenereaza_Click" Text="Genereaza" />
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp; Introduceti numele pentru a genera fluturasul unui anumit angajat<br />
        <br />
        &nbsp; Nume:&nbsp;
        <asp:TextBox ID="txtNume" runat="server"></asp:TextBox>
        <asp:Button ID="btnCauta" runat="server" OnClick="btnCauta_Click" Text="Cauta" />
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblID" runat="server" Text="ID:"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
        <br />
        &nbsp;
        <asp:Button ID="btnRaport" runat="server" OnClick="btnRaport_Click" Text="Generare Raport Individual" Width="280px" />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <asp:Label ID="lblError" runat="server"></asp:Label>
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
