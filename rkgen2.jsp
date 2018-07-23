  <%@ include file="OwnerHeader.jsp"%>
<br><br><br><br><br>
<%@ page import ="java.sql.*"%>

  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>CP-ABE</title>
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->

</head>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>

<%@ page import="app.Identity,it.unisa.dia.gas.plaf.jpbc.pairing.a.TypeACurveGenerator,it.unisa.dia.gas.plaf.jpbc.pairing.PairingFactory,it.unisa.dia.gas.jpbc.Pairing,it.unisa.dia.gas.jpbc.Element,it.unisa.dia.gas.jpbc.Field,crypto.*"%>






<%! int rno=0;
String s=null,ID=null;StringBuffer filedata=null;
byte encdata[]=null;
byte m[]=null;%>
<%

	
 String rid=request.getParameter("rid");
 Connection con1=databasecon.getconnection();



Connection con=databasecon.getconnection();
int no=0;
Statement st=con.createStatement();Statement st1=con.createStatement();
ResultSet rr1=st1.executeQuery("select eid from register where unm='"+uname+"'");
if(rr1.next()){
ID=rr1.getString(1);
}

ResultSet rr2=st.executeQuery("select filedata from cloud where fid='"+request.getParameter("fid")+"'");
if(rr2.next()){

encdata=rr2.getBytes(1);
}

// Generating Proxy ReEncryptionKey

IBProxyReencryptionModule pe = new IBProxyReencryptionModule("curve.properties");

IBPEPublicParameters p=pe.setup();

Identity sender_ID = new Identity(ID);
Identity receiver_ID = new Identity(rid);
 Element sender_sk= pe.generateSecretKey(sender_ID.getIdentityBytes());

	IBPERKGenTask rkGenerator = pe.createKeyGenerator();


IBPEConversionKey rk=rkGenerator.rkGen(p, sender_sk ,sender_ID.getIdentityBytes(),receiver_ID.getIdentityBytes());

	

 %>
<%!String  thisLine = null;
StringBuffer sb1=null;
String filename=null,unm=null,fid=null,fnm=null,pkey=null;
int i=0;
byte data[]=null;
%>

<body>
  <div class="container">
    <section class="register">
      <center> <h3><font size="" color="">Proxy Reencryption</font></h3>
	  <br>
      <form method="post" action="ReEncryption.jsp">
 <b><table>
    <tr>
	<td> ReencryptionKey (rk):</td> <td><input type="text" readonly name="sid" value=<%=rk%> placeholder="" required></td>
</tr>   <tr></tr><tr></tr>
<tr><td>
	 </td><td><input type="hidden" name="sid" value=<%=ID%> placeholder="" required><input type="hidden" name="fid" value=<%=request.getParameter("fid")%>></td></tr>  <tr></tr><tr></tr>
    
     <tr><td>
	  </td><td><input type="hidden" name="rid" value=<%=rid%> placeholder="" required></td></tr>  <tr></tr><tr></tr>
    
<tr><td>
	  EncryptedData:</td><td><textarea name="encdata"  rows="5" cols="40"><%=new String(encdata)%></textarea>
	 </td></tr>  <tr></tr><tr></tr>


	<tr></tr><tr></tr><tr><td>
				  <tr><td>
				  &nbsp;<br><input type="submit" class="btn btn-success btn-lg" value="ReEncryption"></tr>  <tr></tr><tr></tr>
	 
	   <table>
      </form>
    </section>
  </div><br><br><br><br><br><br><br><br><br>

</body><%@ include file="footer.jsp"%>