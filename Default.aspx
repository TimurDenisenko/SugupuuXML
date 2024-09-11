<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SugupuuXML._Default" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>XML</title>
</head>
<body>
    <h2>Sugupuu kuvamine</h2>
    <div>
        <asp:Xml runat="server" 
            DocumentSource="~/Sugupuu/pyhiandmed.xml"
            TransformSource="~/Sugupuu/pyhiandmeteLisa.xslt" />
    </div>
    <h2>Auto kuvamine</h2>
    <div>
        <asp:Xml runat="server" 
            DocumentSource="~/Auto/autod.xml"
            TransformSource="~/Auto/autodLisa.xslt" />
    </div>
</body>
</html>
