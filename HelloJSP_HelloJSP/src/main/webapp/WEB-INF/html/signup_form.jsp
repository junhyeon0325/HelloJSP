<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box;
}

/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	display: inline-block;
	border: none;
	background: #f1f1f1;
}

/* Add a background color when the inputs get focus */
input[type=text]:focus, input[type=password]:focus {
	background-color: #ddd;
	outline: none;
}

/* Set a style for all buttons */
button {
	background-color: #04AA6D;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
	opacity: 0.9;
}

button:hover {
	opacity: 1;
}

/* Extra styles for the cancel button */
.cancelbtn {
	padding: 14px 20px;
	background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
	float: left;
	width: 50%;
}

/* Add padding to container elements */
.container {
	padding: 16px;
}

/* The Modal (background) */
.modal {
	display: block; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: #474e5d;
	padding-top: 50px;
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 80%; /* Could be more or less, depending on screen size */
}

/* Style the horizontal ruler */
hr {
	border: 1px solid #f1f1f1;
	margin-bottom: 25px;
}

/* The Close Button (x) */
.close {
	position: absolute;
	right: 35px;
	top: 15px;
	font-size: 40px;
	font-weight: bold;
	color: #f1f1f1;
}

.close:hover, .close:focus {
	color: #f44336;
	cursor: pointer;
}

/* Clear floats */
.clearfix::after {
	content: "";
	clear: both;
	display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
	.cancelbtn, .signupbtn {
		width: 100%;
	}
}
</style>
</head>
<body>
	<h2>Modal Signup Form</h2>
	<!--                      요친구가 id01이라는 id를 찾아오는거 -->
	<button onclick="document.getElementById('id01').style.display='block'"
		style="width: auto;">Sign Up</button>

	<div id="id01" class="modal"> <!--                               여기 none이라고 되어있는데 이게 block된다는거? -->
		<span onclick="document.getElementById('id01').style.display='none'"
			class="close" title="Close Modal">&times;</span>
		<form class="modal-content" action="signup.do">
			<div class="container">
				<h1>Sign Up</h1>
				<p>Please fill in this form to create an account.</p>
				<hr>
				<label for="id"><b>아이디</b></label>
				<input type="text"	placeholder="Enter New ID" name="id" required>
				
				<label for="psw"><b>비밀번호</b></label>
				<input type="password" placeholder="Enter Password" name="psw" required>
				
				<label for="name"><b>회원이름</b></label>
				<input type="text" placeholder="Enter Name" name="name" required>
				
				<label>
				  <input type="checkbox" checked="checked" name="remember" style="margin-bottom: 15px"> Remember me
				</label>

				<p>	By creating an account you agree to our <a href="#"	style="color: dodgerblue">Terms & Privacy</a>.</p>

				<div class="clearfix">
					<button type="button" onclick="location.href='boardList.do'" class="cancelbtn">Cancel</button>
					<button type="submit" class="signupbtn">Sign Up</button>	
				</div>
			</div>
		</form>
	</div>

	<script>
		// Get the modal
		var modal = document.getElementById('id01');

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
</body>
</html>