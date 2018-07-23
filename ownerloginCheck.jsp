<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane"%>
<% String unm=request.getParameter("unm");
String pwd=request.getParameter("pwd");
System.out.println(unm);
System.out.println(pwd);
try{
Connection con = databasecon.getconnection();

Statement st=con.createStatement();

Statement st2=con.createStatement();
ResultSet r=st.executeQuery("select *from register where unm='"+unm+"' and pwd='"+pwd+"'  ");
if(r.next())
	{


	String sts=r.getString(1);
	session.setAttribute("unm",unm);
	response.sendRedirect("DataOwnerHome.jsp");
	
 	}
	else{
	response.sendRedirect("DataOwner.jsp?msg1=fail");
	}
}catch(Exception e){e.printStackTrace();}




%>