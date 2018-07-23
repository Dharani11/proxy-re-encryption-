<%@ include file="cHeader.jsp"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<body>
    <div><br><br>
<center><h3 STYLE="COLOR:RED"><strong>Storage Files</strong></h3>


<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane"%>




<%! String name,username,pasword,gen,doj,branch,dept,subdept,eid,cno,adrs;
	int i=0,exp=0;
%>  

<%
try{
Connection con = databasecon.getconnection();
Statement st=con.createStatement();Statement st1=con.createStatement();
%>
<table cellspacing="15" cellpadding="8" align="center">
<tr><th></th><th width="5%"><strong>File Id </th><th></th><th width="10%"><strong>FileName</th><th></th><th width="10%"><strong>Owner</th><th></th><th width="20%"><strong>EncryptionData</th>
<tr></tr>
<%



ResultSet r=st.executeQuery("select *from cloud ");
while(r.next()){%>
<tr height="10"><td></td><td><br><%=r.getInt(1)%></strong></td><td></td><td><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=r.getString(2)%></td><td></td><td><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=r.getString(4)%></td><td></td>

<td><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="view.jsp?fid=<%=r.getInt(1)%>"><font size="" color="#3366ff"><b>VIEW</font></a></td></tr>
<%}%>
<%}catch(Exception e){e.printStackTrace();}%>
</div ></table><br><br>
<%@ include file="footer.jsp"%>
