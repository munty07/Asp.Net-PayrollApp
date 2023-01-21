<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Acasa.aspx.cs" Inherits="Home" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Acasa</title>
    <link href="css/style.css" rel="stylesheet" /> 
    <link rel="stylesheet" type="text/css" href="style.css"/> 
</head>
<body style="height: 912px">
    <form id="form1" runat="server">
        <header id="header"> 
             <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
              <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick">
                    </asp:Timer>
            <asp:Label ID="lblTitlu" runat ="server" ForeColor="#3275a8"><h1>APLICATIE SALARIZARE&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblData" runat="server" Text=""></asp:Label></h1></asp:Label>
                    <asp:Image ID="Image1" runat="server" Width="200px" Height="50px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Image ID="Image2" runat="server" Width="200px"  Height = "50px"/>
                    <br />
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
        <br />
        <br />
        <strong>&nbsp;&nbsp;&nbsp; Nume:</strong> Muntyan Mihaela<br />
        <strong>&nbsp;&nbsp;&nbsp; Facultate:</strong> Automatica si Calculatoare<br />
        <strong>&nbsp;&nbsp;&nbsp; Ciclu de Studiu:</strong> Masterat<br />
        <strong>&nbsp;&nbsp;&nbsp; Specializarea:</strong> SIAPS<br />
        <strong>&nbsp;&nbsp;&nbsp; An Studiu:</strong> I<br />
        <br />
        <br />
    </form>
</body>
</html>
