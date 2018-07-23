<%@ include file="uHeader.jsp"%>
<br><br><br><br><br>
<%@ page import="java.sql.*,databaseconnection.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<body>
    <div>
<center><h3 style="color:red"><strong>Sharing Files</strong></h3>

<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane"%>

<%

if(request.getParameter("msg")!=null){


out.println("<script>alert('Your not Authorized to Access this File')</script>");
}


%>

<%! String name,username,pasword,gen,doj,branch,dept,subdept,eid,cno,adrs;
	int i=0,exp=0;
%>  

<%
try{
Connection con = databasecon.getconnection();
Statement st=con.createStatement();Statement st1=con.createStatement();
%>
<table cellspacing="15" cellpadding="10" align="center">
<tr><th></th><th width="5%"><strong>Sno.</th><th width="10%"><strong>FileName</th><th></th><th width="20%"><strong>Sender_ID</th><th></th><th width="20%"><strong>Receiver_ID</th><th width="20%"><strong>ReencryptionData</th></tr>
<%

ResultSet rst=st1.executeQuery("select eid from register where unm='"+unm+"'");
if(rst.next()){

eid=rst.getString(1);
}


ResultSet r=st.executeQuery("select *from proxyreencrypt ");
while(r.next()){%>
<tr height="10"><td></td><td><br>&nbsp;&nbsp;<%=r.getInt(1)%></strong></td><td><br><%=r.getString(6)%></td><td></td><td><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=r.getString(3)%></td><td></td><td><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=r.getString(4)%></td>

<td><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="openenc.jsp?sno=<%=r.getInt(1)%>&fid=<%=r.getString(2)%>"><font size="" color="#3366ff"><b>OPEN</font></a></td></tr>
<%}%>
<%}catch(Exception e){e.printStackTrace();}%>
</div ></table>
<br><br><br><br><br><br><br><br>
<%@ include file="footer.jsp"%>