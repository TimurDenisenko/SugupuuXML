<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SugupuuXML._Default" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Sugupuu</title>
</head>
<body>
    <h1>Sugupuu kuvamine</h1>
    <div>
        <asp:Xml runat="server" 
            DocumentSource="~/pyhiandmed.xml"
            TransformSource="~/pyhiandmeteLisa.xslt" />
    </div>
</body>
</html>
