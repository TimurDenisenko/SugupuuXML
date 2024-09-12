<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SugupuuXML._Default" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>XML</title>
</head>
<body>
    <h1>Sugupuu kuvamine</h1>
    <div style="border:3px solid black;">
        <asp:Xml runat="server" 
            DocumentSource="~/Sugupuu/pyhiandmed.xml"
            TransformSource="~/Sugupuu/pyhiandmeteLisa.xslt" />
    </div>
    <br />
    <br />
    <h1>Auto kuvamine</h1>
    <div style="overflow-y: scroll; height: 500px; border:3px solid black;">
        <asp:Xml runat="server" 
            DocumentSource="~/Auto/autod.xml"
            TransformSource="~/Auto/autodLisa.xslt" />
    </div>
    <br />
    <br />
    <h1>Reisi kuvamine</h1>
    <div style="overflow-y: scroll; height: 500px; border:3px solid black;">
        <asp:Xml runat="server" 
            DocumentSource="~/Reis/reisid.xml"
            TransformSource="~/Reis/reisidLisa.xslt" />
    </div>
</body>
</html>
