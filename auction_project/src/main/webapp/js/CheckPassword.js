/**
 * 
 */
function checkPassword(){
	pass1=document.signup.password.value;
	pass2=document.signup.password2.value;
	if(pass1==pass2){
		document.getElementById("msg").innerHTML="Password Matched";
		document.getElementById("msg").style.color="blue";
	}else{
		document.getElementById("msg").innerHTML="Password not Matched";
		document.getElementById("msg").style.color="red";
	}
}