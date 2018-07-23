<%@ include file="header.jsp" %>
<br><br>

<%
String msg=request.getParameter("msg1");

if(msg!=null){

out.println("<script>alert('Incorrect UserName or Password')</script>");
}
%>
<br><br><br>
<div class="signup" align="">
  <section id="contact">
       <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h3>CSP Login</h3>
                    
                </div>
            </div>
            
					<form method="post" action="cscheck.jsp">
                        <label>UserName</label>
						<div class="row">
						
                            <div class="col-md-4">
                               
                                <input type="text" class="form-control" name="unm" placeholder="UserName" id="name" required data-validation-required-message="Please enter your name.">
                                
                            </div>
                        </div><br>
						<label>Password</label>

						<div class="row">
						
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
	<br><br><br><br><br><br><br><br><br>
		    <%@ include file="footer.jsp" %> 