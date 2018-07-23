  <%@ include file="OwnerHeader.jsp"%>
 <br><br><br><br><br><br>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>

<%

if(request.getParameter("msg")!=null){


out.println("<script>alert('ReEncrypted Data Sent Successfully')</script>");
}


%>


<%!String  thisLine = null;
StringBuffer sb1=null;
String filename=null,unm=null,fid=null,fnm=null;
int i=0;
%>
 <% Connection con=databasecon.getconnection();
int no=0;
Statement st=con.createStatement();Statement st1=con.createStatement();
ResultSet rr1=st1.executeQuery("select eid from register where unm!='"+uname+"'");




%>
<body>
  <div class="container">
    <section class="register">
      <center><h3><font size="" color="">Proxy Reencryption</font></h3><br><br>
      <form method="post" action="rkgen.jsp">
 <table>
  
     <tr><td>
	 <b>Select ReceiverID:</td><td><select name="rid">
	 <% while(rr1.next()){%>
	 
	 <option value=<%=rr1.getString(1)%>>&nbsp;&nbsp;&nbsp;<%=rr1.getString(1)%></option>
	 <%}%>
	 </td></tr>  <tr></tr><tr></tr>

	  <tr><td>
	  <br><input type="submit" class="btn btn-success btn-lg" value="Next"></tr>  <tr></tr><tr></tr>
	   <table>
      </form>
    </section>
  </div><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body><%@ include file="footer.jsp"%>