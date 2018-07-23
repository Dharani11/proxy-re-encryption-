  <%@ include file="OwnerHeader.jsp"%>
  <br><br><br><br><br>
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>CP-ABE</title>
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->

</head>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>
<%!String  thisLine = null;
StringBuffer sb1=null;
String filename=null,unm=null,fid=null,fnm=null;
int i=0;
%>
 <% java.util.Enumeration e = request.getParameterNames();
 while(e.hasMoreElements()){
         // String e=names.nextElement();
		   String name = (String)e.nextElement();  
		   System.out.println("nm="+name);  }
  
		  //if(
      


	   String saveFile="";
//String contentType=request.getAttribute("file");
String contentType = request.getContentType();
if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0)){
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while(totalBytesRead < formDataLength){
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
File ff = new File(saveFile);
FileOutputStream fileOut = new FileOutputStream(ff);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();
File f=new File(saveFile);
FileInputStream fis=new FileInputStream(saveFile);
session.setAttribute("fis",fis);
 fnm=f.getName();
         // open input stream test.txt for reading purpose.
		 try{
         BufferedReader br = new BufferedReader(new FileReader(f));
		 StringBuffer sb=new StringBuffer();
         while ((thisLine = br.readLine()) != null) {
          //  System.out.println(thisLine);
			
                sb1=sb.append(thisLine);
				//System.out.println(sb1);
         }} catch(Exception e1){ }
		 unm=(String)session.getAttribute("unm");
		 session.setAttribute("data",sb1);
}
try{
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet r=st.executeQuery("select max(fid) from cloud ");
if(r.next())
	{

 i=r.getInt(1);
 System.out.println("i="+i);
if(i>=0)
	{
i++;
	}
}
}catch(Exception e11)
{
e11.printStackTrace();
}

%>
<body>
  <div class="container">
    <section class="register">
      <center><h3><font size="" color="">FileUploading</font></h3><br><br>
	  
      <form method="post" action="getidd.jsp">
<b><table>
    <tr>
	 <td>File ID:</td> <td><input type="text" name="fid" value=<%=i%> placeholder="" required></td>
</tr>   <tr></tr><tr></tr>
<tr><td>
	 FileName:</td><td><input type="text" name="fname" value=<%=fnm%> placeholder="" required></td></tr>  <tr></tr><tr></tr>
    <tr><td> </h4>FileData:</td><td><textarea name="file" cols=30 rows=6><%=sb1%></textarea></td></tr><tr></tr><tr></tr>
     <tr><td>
	Enter ID:</td><td><input type="text" name="pkey" readonly></td></tr>
	 <tr><td></td><td>
	 <tr><td>
	 <br><br><input type="submit" class="btn btn-success btn-lg" value="Get ID"></tr>  <tr></tr><tr></tr>
	   <table>
      </form>
    </section>
  </div><br><br><br><br><br><br><br><br>
</body>


<%@ include file="footer.jsp"%>