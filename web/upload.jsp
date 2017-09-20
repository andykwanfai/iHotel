<%-- 
    Document   : upload
    Created on : 31-Mar-2016, 16:53:45
    Author     : WCW055
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Upload</title>
</head>
<body>
<form method="post" action="UploadServlet.do" enctype="multipart/form-data">
<input type="text" name="fname" id="fname"/><br/><br/>
Select file to upload:
<input type="file" name="dataFile" id="fileChooser"/><br/><br/>
<input type="submit" value="Upload" />
</form>
</body>
</html>