  <%@ include file="uHeader.jsp"%>
  <br><br><br><br>
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
String filename=null,unm=null,fid=null,fnm=null,aces,d,sd;
int i=0;

%>

<% 

unm=(String)session.getAttribute("unm");
	 String fid=request.getParameter("fid");
	 String sno=request.getParameter("sno");
	Connection con=databasecon.getconnection();
	Statement st=con.createStatement();
Statement st1=con.createStatement();
int no=0;


ResultSet r=st.executeQuery("select  fname,reencrypt from proxyreencrypt where fid='"+fid+"' and sno="+sno+" ");

if(r.next())
	{%>
<body>
  <div class="container">
    <section class="register">
      <center><h3><font size="" color="">FileDownloading</font></h3>
	  <br><br>
      <form method="post" action="getSK.jsp">
 <b><table>
    
<tr><td>
	  FileName:</td><td><input type="text" name="" value=<%=r.getString(1)%>><br></td></tr>  <tr></tr><tr></tr>
    <tr><td> ReEncryptionData:</td><td><textarea name="file"rows="5" cols="40" ><%=new String(r.getBytes(2))%></textarea></td></tr><tr></tr><tr></tr>
     
	 <tr><td></table><br><table>

	 </td><td><input type="hidden" name="fid" value=<%=fid%>></td><td><input type="submit" class="btn btn-success btn-lg" value="Get SecretKey"></button></td></tr>  <tr></tr><tr></tr>
	 
	   <table>
      </form>
	<%}


%>

    </section>
  </div><br><br><br><br><br><br><br><br><br><br><br>
</body><%@ include file="footer.jsp"%>