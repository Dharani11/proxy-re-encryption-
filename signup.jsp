<%@include file="header.jsp"%>
<%
String msg = request.getParameter("msgg");
if(msg != null){
out.println("<script>alert('Product Details Added.........')</script>");
}
%>

			<div class="signup" align="">
             <br><br><br><br>
		<section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                   <h2>Registration</h2>
                    
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
				
					<form action="register1.jsp" method="post" id="demoForm" class="demoForm" class="form-group" id="contact-form">
						
						<br>
						<label>	Name</label><div class="row">
							<div class="col-md-4">
								<input type="text" name="nm" pattern="[A-Za-z]+"  class="form-control"></div>
						</div><br>
						<label>Username</label><div class="row">
							<div class="col-md-4">
								<input type="text" name="unm" class="form-control"></div>
						</div><br>
						
						
						<label>	Password</label><div class="row">
						<div class="col-md-4">
								<input type="password" name="pwd"    class="form-control" required></div>
						</div><br>
						
						<label>Email</label><div class="row">
						<div class="col-md-4">
								<input type="email" name="eid"   class="form-control"  required></div>
						</div><br>
						<label>Gender</label><div class="row">
						<div class="col-md-4">
								<input type="radio" name="gen" value="male">Male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gen"   value="female">FeMale</div>
						</div><br>
						
						<label>Contact N0</label><div class="row">
						<div class="col-md-4">
								<input type="text" name="cno"   class="form-control"  required></div>
						</div><br>

						<label>Department</label><div class="row">
						<div class="col-md-4">
								<select name="category" style="width: 150px">
    <option value="Engineering">Engineering</option>
    <option value="Accounting">Accounting</option>
    <option value="Marketing">Marketing</option> 
</select></div><br><br><br>
&nbsp;&nbsp;<label>SubDepartment</label><div class="row">
<div class="col-md-4">
<select name="choices[]" id="choices" style="width: 150px" >
</select></div></div><br>
					<div class="row">
						<div class="row">
                                <input type="submit" class="btn btn-success btn-lg" value="Register">
                            </div>
						</div>
					</form>
					</div>
            </div>
        </div>
    </section>
	</div>
				<br><br><br><br>
	<%@include file="footer.jsp"%>
<script type="text/javascript">
/*
From JavaScript and Forms Tutorial at dyn-web.com
Find information and updates at http://www.dyn-web.com/tutorials/forms/
*/

// removes all option elements in select list 
// removeGrp (optional) boolean to remove optgroups
function removeAllOptions(sel, removeGrp) {
    var len, groups, par;
    if (removeGrp) {
        groups = sel.getElementsByTagName('optgroup');
        len = groups.length;
        for (var i=len; i; i--) {
            sel.removeChild( groups[i-1] );
        }
    }
    
    len = sel.options.length;
    for (var i=len; i; i--) {
        par = sel.options[i-1].parentNode;
        par.removeChild( sel.options[i-1] );
    }
}

function appendDataToSelect(sel, obj) {
    var f = document.createDocumentFragment();
    var labels = [], group, opts;
    
    function addOptions(obj) {
        var f = document.createDocumentFragment();
        var o;
        
        for (var i=0, len=obj.text.length; i<len; i++) {
            o = document.createElement('option');
            o.appendChild( document.createTextNode( obj.text[i] ) );
            
            if ( obj.value ) {
                o.value = obj.value[i];
            }
            
            f.appendChild(o);
        }
        return f;
    }
    
    if ( obj.text ) {
        opts = addOptions(obj);
        f.appendChild(opts);
    } else {
        for ( var prop in obj ) {
            if ( obj.hasOwnProperty(prop) ) {
                labels.push(prop);
            }
        }
        
        for (var i=0, len=labels.length; i<len; i++) {
            group = document.createElement('optgroup');
            group.label = labels[i];
            f.appendChild(group);
            opts = addOptions(obj[ labels[i] ] );
            group.appendChild(opts);
        }
    }
    sel.appendChild(f);
}

// anonymous function assigned to onchange event of controlling select list
document.forms['demoForm'].elements['category'].onchange = function(e) {
    // name of associated select list
    var relName = 'choices[]';
    
    // reference to associated select list 
    var relList = this.form.elements[ relName ];
    
    // get data from object literal based on selection in controlling select list (this.value)
    var obj = Select_List_Data[ relName ][ this.value ];
    
    // remove current option elements
    removeAllOptions(relList, true);
    
    // call function to add optgroup/option elements
    // pass reference to associated select list and data for new options
    appendDataToSelect(relList, obj);
};

// object literal holds data for optgroup/option elements
var Select_List_Data = {
    
    // name of associated select list
    'choices[]': {
        
        // names match option values in controlling select list
       Engineering: {
            // optgroup labe
                text: ['Designing','Programming','Testing'],
                value: ['Designing','Programming','Testing']
            },
   
       Accounting: {
            // example without optgroups
            text: ['Payroll','Investment'],
            value: ['Payroll', 'Investment']
        },
			Marketing: {
            // example without optgroups
            text: ['Financial','H.R'],
            value: ['Financial','H.R']
        },
		
		
        mrktaaaaa: {
            'Download Demos': {
                // example without values
                text: ['Iframes', 'PHP to JS', 'Unobtrusive JS']
            },
            
            'No Download': {
                text: ['Object Literals', 'Initializing JS', 'JS Errors']
            }
        }
    }
    
};

// populate associated select list when page loads
window.onload = function() {
    var form = document.forms['demoForm'];
    
    // reference to controlling select list
    var sel = form.elements['category'];
    sel.selectedIndex = 0;
    
    // name of associated select list
    var relName = 'choices[]';
    // reference to associated select list
    var rel = form.elements[ relName ];
    
    // get data for associated select list passing its name
    // and value of selected in controlling select list
    var data = Select_List_Data[ relName ][ sel.value ];
    
    // add options to associated select list
    appendDataToSelect(rel, data);
};

</script>
			