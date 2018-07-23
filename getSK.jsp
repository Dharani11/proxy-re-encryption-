  <%@ include file="uHeader.jsp"%>
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
String filename=null,unm=null,fid=null,fnm=null,eid=null;
int i=0;
%>
<%@ page import="app.Identity,it.unisa.dia.gas.plaf.jpbc.pairing.a.TypeACurveGenerator,it.unisa.dia.gas.plaf.jpbc.pairing.PairingFactory,it.unisa.dia.gas.jpbc.Pairing,it.unisa.dia.gas.jpbc.Element,it.unisa.dia.gas.jpbc.Field,crypto.*"%>

<% 

try{
unm=(String)session.getAttribute("unm");
	 String fid=request.getParameter("fid");
	Connection con=databasecon.getconnection();
	Statement st=con.createStatement();Statement st1=con.createStatement();
int no=0;
ResultSet rst=st1.executeQuery("select eid from register where unm='"+unm+"'");
if(rst.next()){

eid=rst.getString(1);
}

IBProxyReencryptionModule pe = new IBProxyReencryptionModule("curve.properties");

IBPEPublicParameters p=pe.setup();

Identity receiver_ID = new Identity(eid);


 Element receiver_sk= pe.generateSecretKey(receiver_ID.getIdentityBytes());


ResultSet r=st.executeQuery("select  fname,reencrypt from proxyreencrypt where fid='"+fid+"' ");
String pkey="";
if(r.next())
	{%>
<body>
  <div class="container">
    <section class="register">
      <center><h3><font size="" color="">FileDownloading</font></h3>
	  <br>
      <form method="post" action="decrypt.jsp">
 <b><table>
    
<tr><td>
	 FileName:</td><td><input type="text" name="fnm" value=<%=r.getString(1)%>><br></td></tr>  <tr></tr><tr></tr>
    <tr><td>  ReEncryptionData ( CT ):</td><td><textarea name="file"rows="5" cols="40" ><%=new String(r.getBytes(2))%></textarea></td></tr><tr></tr><tr></tr>
      <tr>
	<td> Receiver SecretKey (SK):</td> <td><input type="text" name="sk" readonly value=<%=receiver_sk%> placeholder="" required></td>
</tr>   <tr></tr><tr></tr>
	 <tr><td></table><br><table>
	 </td><td><input type="hidden" name="fid" value=<%=fid%>></td><td><input type="submit" class="btn btn-success btn-lg" value="Decrypt"></td></tr>  <tr></tr><tr></tr>
	 
	   <table>
      </form>
	<%}
}
catch(Exception e){
e.printStackTrace();
}
%>

    </section>
  </div><br><br><br><br><br><br><br><br>
</body><%@ include file="footer.jsp"%>