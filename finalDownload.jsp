<%@ page import="java.sql.*"%>
<%@ page import="databaseconnection.*,java.io.*"%>

<%
 

	
	
	 
	     try{
		 
		 Connection con=databasecon.getconnection();
		
	
			String filename =request.getParameter("fnm");
System.out.println("slength="+filename);


		
			byte[] ba = request.getParameter("file").getBytes();
		
			if(true)
			 {
			response.setContentType("application/notepad");//image/jpeg,,	image/png
			response.setHeader("Content-Disposition","attachment; filename=\""+filename+"  ");
			OutputStream os = response.getOutputStream();
			os.write(ba);
			os.close();
			ba = null;
		
			//session.removeAttribute("file");
			}

	
			}
			catch(Exception e)
			{
			out.println("Exception :"+e);
			}
		
		
		
%>