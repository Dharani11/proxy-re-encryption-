<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane"%>
<%!int count=0;%>
<% String unm=request.getParameter("unm");
String pwd=request.getParameter("pwd");
try{

if(unm.equals("CSP")&& pwd.equals("CSP"))
	{
	response.sendRedirect("CSPHome.jsp");
	}else{
	response.sendRedirect("login.jsp?msg1=fail");
	}
}catch(Exception e){e.printStackTrace();}

%>