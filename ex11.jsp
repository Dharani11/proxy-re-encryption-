<%@ page import="java.io.*,crypto.*"%>

<% 
String fnm1=request.getParameter("fnm");
    File file = new File(fnm1);
	FileInputStream  fin = new FileInputStream(file);
    byte decrpteddata[] = new byte[(int)file.length()];
	fin.read(decrpteddata);


%>