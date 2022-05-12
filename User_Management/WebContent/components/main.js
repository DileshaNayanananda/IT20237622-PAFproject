$(document).ready(function() 
{  
	if ($("#alertSuccess").text().trim() == "")  
	{   
		$("#alertSuccess").hide();  
	} 
	$("#alertError").hide(); 
}); 

//SAVE ============================================ 
$(document).on("click", "#btnSave", function(event) 
{  
	// Clear alerts---------------------  
	$("#alertSuccess").text("");  
	$("#alertSuccess").hide();  
	$("#alertError").text("");  
	$("#alertError").hide(); 

	// Form validation-------------------  
	var status = validateCustomerForm();  
	if (status != true)  
	{   
		$("#alertError").text(status);   
		$("#alertError").show();   
		return;  
	} 

	// If valid------------------------  
	var t = ($("#hidcustomerIDSave").val() == "") ? "POST" : "PUT";
	
	$.ajax(
	{
		url : "CustomerApi",
		type : t,
		data : $("#formCustomer").serialize(),
		dataType : "text",
		complete : function(response, status)
		{
			onCustomerSaveComplete(response.responseText, status);
		}
	});
}); 

function onCustomerSaveComplete(response, status){
	if(status == "success")
	{
		var resultSet = JSON.parse(response);
			
		if(resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully Saved.");
			$("#alertSuccess").show();
					
			$("#divItemsGrid").html(resultSet.data);
	
		}else if(resultSet.status.trim() == "error"){
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	}else if(status == "error"){
		$("#alertError").text("Error While Saving.");
		$("#slertError").show();
	}else{
		$("#alertError").text("Unknown Error while Saving.");
		$("#alertError").show();
	}
	$("#hidcustomerIDSave").val("");
	$("#formCustomer")[0].reset();
}

//UPDATE========================================== 
$(document).on("click", ".btnUpdate", function(event) 
		{     
	$("#hidcustomerIDSave").val($(this).closest("tr").find('#hidcustomerIDUpdate').val());     
	$("#user_name").val($(this).closest("tr").find('td:eq(0)').text());    
	$("#email").val($(this).closest("tr").find('td:eq(1)').text());     
	$("#address").val($(this).closest("tr").find('td:eq(2)').text());     
	$("#phone_num").val($(this).closest("tr").find('td:eq(3)').text()); 
	$("#password").val($(this).closest("tr").find('td:eq(4)').text());
	

});


//Remove Operation
$(document).on("click", ".btnRemove", function(event){
	$.ajax(
	{
		url : "CustomerApi",
		type : "DELETE",
		data : "user_id=" + $(this).data("user_id"),
		dataType : "text",
		complete : function(response, status)
		{
			onCustomerDeletedComplete(response.responseText, status);
		}
	});
});

function onCustomerDeletedComplete(response, status)
{
	if(status == "success")
	{
		var resultSet = JSON.parse(response);
			
		if(resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully Deleted.");
			$("#alertSuccess").show();
					
			$("#divItemsGrid").html(resultSet.data);
	
		}else if(resultSet.status.trim() == "error"){
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	}else if(status == "error"){
		$("#alertError").text("Error While Deleting.");
		$("#alertError").show();
	}else{
		$("#alertError").text("Unknown Error While Deleting.");
		$("#alertError").show();
	}
}

//CLIENTMODEL
function validateCustomerForm() {  
	// NAME  
	if ($("#user_name").val().trim() == "")  {   
		return "Insert customerName.";  
		
	} 
	
	 // Email 
	if ($("#email").val().trim() == "")  {   
		return "Insert Email.";  
	} 
	
	
	//address
	if ($("#address").val().trim() == "")  {   
		return "Insert address."; 
		 
	}
	 
	//phone number
	if ($("#phone_num").val().trim() == "")  {   
		return "Insert phone number."; 
	}
	
	//password
	if ($("#password").val().trim() == "")  {   
		return "Insert password."; 
	}
	 
	
		

	 
	 return true; 
	 
}
