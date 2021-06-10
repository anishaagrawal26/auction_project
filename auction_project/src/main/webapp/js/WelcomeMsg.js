/**
 * 
 */
function welcomeMsg()
 {
	 var val=document.getElementById("id1").value;
	 if(window.confirm("Signup Successfully "+val+" !  Do you Want To Login Click Ok")){
		 
		 window.location.href="index.jsp";
		 
	 }
	 else{
		 
		 
	 }
 }