  <%@ include file="OwnerHeader.jsp"%>
  <br><br><br>
  <%@page import="java.util.*"%>
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>CP-ABE</title>



</head>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>
<%!String  thisLine = null;
StringBuffer sb1=null,filedata;
String filename=null,unm=null,fid=null,fnm=null,id=null;
int i=0;


%>
<% 


unm=(String)session.getAttribute("unm");
	 String fid=request.getParameter("fid");
	 String fnm=request.getParameter("fname");
	 filedata=(StringBuffer)session.getAttribute("data");
Connection con=databasecon.getconnection();
int no=0;
Statement st=con.createStatement();Statement st1=con.createStatement();
ResultSet rr1=st1.executeQuery("select eid from register where unm='"+unm+"'");
if(rr1.next()){
id=rr1.getString(1);
}






%>
<body>
  <div class="container">
    <section class="register">
      <center><h3><font size="" color="">FileUploading</font></h2>
	  <br>
      <form method="post" action="IBEncryption.jsp">
<b> <table>
    <tr>
	<td>File ID:</td> <td><input type="text" name="fid" value=<%=fid%> placeholder="" required></td>
</tr>   <tr></tr><tr></tr>
<tr><td>
	 FileName:</td><td><input type="text" name="fname" value=<%=fnm%> placeholder="" required></td></tr>  <tr></tr><tr></tr>
    <tr><td> FileData:</td><td><textarea name="file" cols=30 rows=10><%=filedata%></textarea></td></tr><tr></tr><tr></tr>
     <tr><td>
	 ID:</td><td><input type="text" name="id" readonly value=<%=id%>></td></tr>  <tr></tr><tr></tr>
	 
	 <tr><td>
	 <tr><td>
	 <br><br><input type="submit" class="btn btn-success btn-lg" value="Encrypt"></tr>  <tr></tr><tr></tr>
	 
	   <table>
      </form>
    </section>
  </div><br><br><br><br><br><br><br>
</body><%@ include file="footer.jsp"%>