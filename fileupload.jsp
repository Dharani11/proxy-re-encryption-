<%@ include file="OwnerHeader.jsp"%>
<br><br><br><br>
   <%String m1=request.getParameter("id");
                                                       if(m1!=null && m1.equalsIgnoreCase("exp"))
                                                       {
                                                                  out.println("<script type=text/javascript>alert('Sorry, your session expired, login again '); </script>");
                                                       }
     %>

 	 <% if(request.getParameter("atrbt")!=null){
	  out.println("<script>alert('Keys are not  generated  by  Authority')</script>");
}%>


 <% if(request.getParameter("msg1")!=null){
	  out.println("<script>alert('Incorrect Username or Password')</script>");
}%>
<% if(request.getParameter("msg")!=null){
	  out.println("<script>alert('File Uploaded Successfully')</script>");
}%>
 
	 <div class="6u  6u(narrower) important(narrower)">
								<div id="content">

	 <h2></h2><br>

<center><section class="6u 12u(narrower)">
								<h3>FIle Upload</h3>
								<br><br><br>
							<center><form action="upload1.jsp" enctype="multipart/form-data" method="post">
									<div class="row 50%">
										<div class="36u 22u(mobilep)">
											<input type="file" name="filename" required />
										</div>
										
									</div>
									<br><br>
									<div class="row 50%">
										<div class="12u">
											<input type="submit" class="btn btn-success btn-lg" value="File Data">
										</div>
									</div>
								</form></center>
							</section>



   </center>   
        </div>        </div>        </div><br><br>
		
<br><br><br><br><br><br><br><br>
<%@ include file="footer.jsp"%>