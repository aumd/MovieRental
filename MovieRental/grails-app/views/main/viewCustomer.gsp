<html>
<head>
	<meta name="layout" content="admin" />
	<title>View Customer's Ledger</title>
	
	<style type="text/css">
		body {
			background-image: url("../images/img/tile.jpg");
		}
	</style>
	
</head>
<body>
	
	<h3 align="center"><font color="black">Customer's Profile</font></h3>
	<strong>
	<div align="center">
		<font color="black">Customer ID: ${info.id}</font>
		<br/>
		<font color="black">First Name: ${info.first_name}</font>
		<br/>
		<font color="black">Last Name: ${info.last_name}</font>
		<br/>
		<font color="black">Address: ${info.address}</font>
		<br/>
		<font color="black">Contact Number: ${info.contact_number}</font>
		<br/>
		<font color="black">Email Address: ${info.email}</font>
	</div>
	</strong>
	
	<br/>
	<br/>
	<br/>
	
	<div>
		<g:form controller="main" action="searchForCustomer">
			<input type="submit" class="btn btn-primary btn-small" value="Back">
		</g:form>
	</div><br/><br/><br/><br/><br/>
	
</body>
</html>