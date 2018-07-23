  <%@ include file="OwnerHeader.jsp"%>
  <br><br><br>
<%@ include file="ex1.jsp"%>
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
String s=null,fname,ID=null;StringBuffer filedata=null;
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

ResultSet rr2=st.executeQuery("select filedata,fname from cloud where fid='"+request.getParameter("fid")+"'");
if(rr2.next()){

encdata=rr2.getBytes(1);
fname=rr2.getString(2);
}

// Generating ReEncryption Data

IBProxyReencryptionModule pe = new IBProxyReencryptionModule("curve.p
roperties");

IBPEPublicParameters p=pe.setup();

Identity sender_ID = new Identity(ID);
Identity receiver_ID = new Identity(rid);
 Element sender_sk= pe.generateSecretKey(sender_ID.getIdentityBytes());


IBPEEncryptionTask encrypter = pe.createEncryptor();

IBPECiphertextLayerOne[] ct1 = encrypter.encrypt(p,sender_ID.getIdentityBytes(),encdata);

	IBPERKGenTask rkGenerator = pe.createKeyGenerator();

IBPEConversionKey rk=rkGenerator.rkGen(p, sender_sk ,sender_ID.getIdentityBytes(),receiver_ID.getIdentityBytes());
	IBPEReencryptionTask reencrypter = pe.createReEncryptor();

	IBPECiphertextLayerN[] ReEncrypteddata = reencrypter.reencrypt(p,sender_ID.getIdentityBytes(), rk, ct1);


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
      <center><b><font size="5em" color="">Proxy Reencryption</font></h3>
	  <br> <br>
      <form method="post" action="senddata.jsp">
 <b><table>
    
<tr><td>
	 </td><td><input type="hidden" name="sid" value=<%=ID%> placeholder="" required><input type="hidden" name="fname" value=<%=fname%>><input type="hidden" name="fid" value=<%=request.getParameter("fid")%>></td></tr>  <tr></tr><tr></tr>
    
     <tr><td>
	  </td><td><input type="hidden" name="rid" value=<%=rid%> placeholder="" required></td></tr>  <tr></tr><tr></tr>
    
<tr><td>
	  Re-EncryptionData:</td><td><textarea name="encdata" rows="5" cols="40"><%=new String(ReEncrpteddata)%></textarea>
	 </td></tr>  <tr></tr><tr></tr>

 	<tr></tr><tr></tr><tr><td><label></label><div class="row">
						<div class="col-md-4">

		<input type="submit" class="btn btn-success btn-lg" value="Send"></tr>  <tr></tr><tr></tr>
	 
	   <table>
      </form>
    </section>
  </div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

</body>

<script>
function myFunction() {
    var x = document.getElementById("mySelect").value;
	var sp=x.split(",");
		var s=document.getElementById("ids").value;
		var s1=document.getElementById("idss").value;
	//var s1=document.getElementById("idss").value;
document.getElementById("ids").innerHTML = s+sp[0];
document.getElementById("idss").innerHTML = s1+sp[1];
	 
//	document.getElementById("demo").innerHTML = "You selected: " + x;
}
</script>
<script>
function myFunction2() {
    var x2 = document.getElementById("mySelect2").value;
	var sp1=x2.split(",");
	  var xx=document.getElementById("ids").value;
	   var xx1=document.getElementById("idss").value;
	document.getElementById("ids").innerHTML =xx+sp1[0];
document.getElementById("idss").innerHTML =xx1+sp1[1];
	//document.getElementById("demo").innerHTML = "You selected: " + x2;
}
</script>
<script>
function myFunction3() {
    var x3 = document.getElementById("mySelect3").value;
		var sp2=x3.split(",");
	 var xxx=document.getElementById("ids").value;
	  var xxx1=document.getElementById("idss").value;
    //document.getElementById("ids").innerHTML =xxx+x3;
	document.getElementById("ids").innerHTML =xxx+sp2[0];
document.getElementById("idss").innerHTML =xxx1+sp2[1];
	//document.getElementById("demo").innerHTML = "You selected: " + x3;
}
</script>

<script>
function myFunction4() {
    var x4 = document.getElementById("mySelect4").value;
	 var xxxx=document.getElementById("ids").value;
	 	 var xxxx1=document.getElementById("idss").value;
    //document.getElementById("ids").innerHTML =xxxx+x4;
		document.getElementById("ids").innerHTML =xxxx+x4;
document.getElementById("idss").innerHTML =xxxx1+x4;
	//document.getElementById("demo").innerHTML = "You selected: " + x3;
}
</script>
<script>
function myFunction5() {
    var x5 = document.getElementById("mySelect5").value;
	 var xxxxx=document.getElementById("ids").value;
	  var xxxxx1=document.getElementById("idss").value;
   // document.getElementById("ids").innerHTML =xxxxx+x5;
	document.getElementById("ids").innerHTML =xxxxx+x5;
document.getElementById("idss").innerHTML =xxxxx1+x5;
   // document.getElementById("ids").innerHTML =xxxxx+x5;
	//document.getElementById("demo").innerHTML = "You selected: " + x3;
}
</script>


<%@ include file="footer.jsp"%>