<%@ include file="header.jsp" %>


<%
String msg=request.getParameter("mm");

if(msg!=null){

out.println("<script>alert('Enter Valid Customer Id')</script>");
}
%>
<br><br><br>
<div class="signup" align="">
  <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h3>Data Owner Login</h3>
                    
                </div>
            </div>
            	
					<form method="post" action="ownerloginCheck.jsp">
                        
						<div class="row">
						<br>
                            <div class="col-md-4">
                               
                                <input type="text" class="form-control" name="unm" placeholder="Enter Name" id="name" required data-validation-required-message="Please enter your name.">
                                
                            </div>
                        </div>
						<div class="row">
						<br>
                            <div class="col-md-4">
                               
                                <input type="password" class="form-control" name="pwd" placeholder="Password" id="name" required data-validation-required-message="Please enter your name.">
                                
                            </div>
                        </div>
                       <br>
                        
                       <br>
						 <div class="row">
                                <input type="submit" class="btn btn-success btn-lg" value="Login">
                            </div>
                       
                        <br>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>
	<br><br><br><br><br><br><br><br><br><br>

		    <%@ include file="footer.jsp" %> 