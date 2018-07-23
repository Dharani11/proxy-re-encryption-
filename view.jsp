  <%@ include file="cHeader.jsp"%>
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


	 String fid=request.getParameter("fid");

	Connection con=databasecon.getconnection();
	Statement st=con.createStatement();
Statement st1=con.createStatement();
int no=0;


ResultSet r=st.executeQuery("select  fname,filedata from cloud where fid='"+fid+"'  ");
if(r.next())
	{%>
<body>
  <div class="container">
    <section class="register">
      <center><h3><font size="" color="">File Data</font></h3>
	  <br><br>
   
 <b><table>
    
<tr><td>
	  FileName:</td><td><input type="text" name="" value=<%=r.getString(1)%>><br></td></tr>  <tr></tr><tr></tr>
    <tr><td> EncryptionData:</td><td><textarea name="file"rows="5" cols="40" readonly><%=new String(r.getBytes(2))%></textarea></td></tr><tr></tr><tr></tr>
     
	 <tr><td></table><br><table>

	
	 
	   <table>
      </form>
	<%}


%>

    </section>
  </div><br><br><br><br><br><br><br><br><br>
</body><%@ include file="footer.jsp"%>