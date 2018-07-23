ooooooooooooo99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999  <%@ include file="OwnerHeader.jsp"%>
<br><br><br>
<%@ page import ="java.sql.*"%>
  <%@ include file="ex.jsp"%>
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
String s=null;StringBuffer filedata=null;
byte m[]=null;%>
<%

	 unm=(String)session.getAttribute("unm");
 s= String.valueOf(rno);String fid1=request.getParameter("fid");
 	 String fnm1=request.getParameter("fname");
 String ck=request.getParameter("sk");
 String file=request.getParameter("file");
 m=file.getBytes();
 String ID=request.getParameter("id");
 Connection con1=databasecon.getconnection();


/*PKG pkg = new PKG();

		BigInteger Public_key = pkg.get_public_key(ID);

		BigInteger n = pkg.getn();
		
Encrypt encrypt1 = new Encrypt(ID,file,n,Public_key); 
		
		byte[] encryptedData=encrypt1.encrypt();

		String filedata=new String(encryptedData);*/




// IBE ENCRYPTION


IBProxyReencryptionModule pe = new IBProxyReencryptionModule("curve.properties");

IBPEPublicParameters params=pe.setup();

Identity sender_ID = new Identity(ID);

IBPEEncryptionTask encrypter = pe.createEncryptor();

IBPECiphertextLayerOne[] Ciphertext = encrypter.encrypt(params, sender_ID.getIdentityBytes(),m);


/* ------------------- IBE ENCRYPTION --------------------------*/







 PreparedStatement p=con1.prepareStatement("insert into cloud(fid,fname,filedata,owner) values(?,?,?,?)");
p.setInt(1,Integer.parseInt(fid1));
p.setString(2,fnm1);
p.setBytes(3,Ciphrtext);
p.setString(4,unm);
p.executeUpdate();
 %>
<%!String  thisLine = null;
StringBuffer sb1=null;
String filename=null,unm=null,fid=null,fnm=null,pkey=null;
int i=0;
byte data[]=null;
%>
<% 
	 unm=(String)session.getAttribute("unm");
	 String fid=request.getParameter("fid");
	 String fnm=request.getParameter("fname");
	 Connection con=databasecon.getconnection();
Statement st=con.createStatement();Statement st1=con.createStatement();

%>

  <div class="container">
    <section class="register">
      <center><h3><font size="" color="">FileUploading</font></h1>
	  <br>
      <form method="post" action="fileupload.jsp?msg=Uploaded">
 <b><table>
    <tr>
	<td>File ID:</td> <td><input type="text" name="fid" value=<%=fid%> placeholder="" required></td>
</tr>   <tr></tr><tr></tr>
<tr><td>
	 FileName:</td><td><input type="text" name="fnm" value=<%=fnm%> placeholder="" required></td></tr>  <tr></tr><tr></tr>
    <tr><td>EncryptedData:&nbsp;</td><td><textarea name="file" cols=30 rows=10><%=new String(Ciphrtext)%></textarea></td></tr><tr></tr><tr></tr>
     
	<tr></tr><tr></tr><tr><td>
	  <tr><td>
	  <br><br><input type="submit" class="btn btn-success btn-lg" value="Upload"></tr>  <tr></tr><tr></tr>
	 
	   <table>
      </form>
    </section>
  </div><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<%@ include file="footer.jsp"%>