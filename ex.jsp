<%@ page import="java.io.*,crypto.*"%>

<% 
byte[] Ciphrtext=null;

byte b[]=ex.getRawKey("secretkey".getBytes());
Ciphrtext=ex.encrypt(b,request.getParameter("file").getBytes());


%>