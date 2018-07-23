  <%@ include file="OwnerHeader.jsp"%>
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
String s=null,ID=null;StringBuffer filedata=null;
byte encdata[]=null;
byte m[]=null;%>
<%

	
 String rid=request.getParameter("rid");
 byte[] reencdata=request.getParameter("encdata").getBytes();
 Connection con1=databasecon.getconnection();

String ids=request.getParameter("idss");

Connection con=databasecon.getconnection();
int no=0;
Statement st=con.createStatement();Statement st1=con.createStatement();
ResultSet rr1=st1.executeQuery("select eid from register where unm='"+uname+"'");
if(rr1.next()){
ID=rr1.getString(1);
}

 PreparedStatement p=con1.prepareStatement("insert into proxyreencrypt(fid,sender_id,receiver_id,reencrypt,fname) values(?,?,?,?,?)");
 p.setString(1,request.getParameter("fid"));
p.setString(2,ID);
p.setString(3,rid);
p.setBytes(4,reencdata);
p.setString(5,request.getParameter("fname"));
int i=p.executeUpdate();
if(i>0){

response.sendRedirect("pren.jsp?msg=Sent");
}


 %>

</body><%@ include file="footer.jsp"%>