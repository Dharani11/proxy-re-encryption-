<%@ page import="java.io.*,crypto.*"%>

<% 
byte[] ReEncrpteddata=null;

byte b[]=ex.getRawKey("secretkey".getBytes());
ReEncrpteddata=ex.encrypt(b,request.getParameter("encdata").getBytes());


%>