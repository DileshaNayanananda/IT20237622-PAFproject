<%@page import="model.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<meta charset="ISO-8859-1">
<title>User Management</title>

<link rel="stylesheet" href="Views/bootstrap.min.css"> 
<link rel="stylesheet" type="text/css" href="css\footer.css"> 
<script src="components/jquery-3.6.0.js"></script>
<script src="components/main.js"></script>



 <nav class="navbar navbar-expand-md navbar-dark" style="background-color: 	#000000">
                   

                    <ul class="navbar-nav">
                        <li><a href="Customer.jsp" class="nav-link"> Electro Grid</a></li>
                    </ul>
                 </nav>
               


</head>
<body>




<br>
<br>


<div class="container"> 
		<div class="row">  
		 <br>
            <div class="container col-md-5">
                <div class="card">
                    <div class="card-body">
                       

                     
                            <h2>
                                User Management
                            </h2>
                        
		
			
				<form id="formCustomer" name="formCustomer" method="post" action="Customer.jsp">  
					Customer Name:  
					<input id="user_name" name="user_name" type="text" class="form-control form-control-sm">  
					
					<br> 
					Customer Email:  
					<input id="email" name="email" type="text" class="form-control form-control-sm">  
					
					<br>
					 Customer Address:  
					 <input id="address" name="address" type="text" class="form-control form-control-sm">  
					 
					 <br> 
					 Phone number:  
					 <input id="phone_num" name="phone_num" type="text" class="form-control form-control-sm">
					 
					 <br> 
					 Password:  
					 <input id="password" name="password" type="text" class="form-control form-control-sm">   
					 
					
					 
					 
					 <br>  
					 <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">  
					 <input type="hidden" id="hidcustomerIDSave" name="hidcustomerIDSave" value=""> 
					 
					 <br/><br/>
					 
					 <div id="alertSuccess" class="alert alert-success"></div>  
					 <div id="alertError" class="alert alert-danger"></div> 
					 
					 
				</form> 
				  </div>
                </div>
            </div>
				
				<br>
               

                   
                <div class="container">
                 <br><br><br><br>
                    <h3 class="text-center">Customer Details</h3>
                   
                   
                
                   <div id="divItemsGrid" align='center'>   
					<%    
						Customer customerObj = new Customer();
						out.print(customerObj.readCustomer());   
					%>  
				
					<br>
					<br>
				</div> 
                   
                </div>
            </div>
				  
 			</div> 
 		
<br>
	 

</body>

 <!-- Site footer -->
    
</html>