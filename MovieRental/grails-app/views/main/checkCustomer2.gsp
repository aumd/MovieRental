<html>
<head>
	<meta name="layout" content="admin" />
	<title>Check Customer</title>
	
		<!-- Le styles -->
	
	<link href="css/prettify.css" rel="stylesheet">
	<link href="css/font-awesome.css" rel="stylesheet">
	<link href="css/site.css" rel="stylesheet">
	
	<style type="text/css">
		body {
			background-image: url("../images/img/tile.jpg");
		}
	</style>
	
</head>
<body>
	
	<div align="center">
		<g:form class="form-search" controller="main" action="searchForCustomer2">
			<input type="text" placeholder="Search Customer" name="parameter" value="${parameter}" class="input-medium search-query icon-search">
			<input type="submit" class="btn btn-primary btn-small" value="Search">
		</g:form>
	</div>
	
	<div align="center">
	<g:if test="${infos}">
		<table width="400px">
				<tr>
					<th><font color="black">First Name</font></th>
					<th><font color="black">Last Name</font></th>
				</tr>
			<g:each in="${infos}" var="${info}">
				<tr>
					<td><font color="black"><center>${info.first_name}</center></font></td>
					<td><font color="black"><center>${info.last_name}</center></font></td>
					<td>
						<g:form controller="main" action="viewCustomer">
							<input type="hidden" name="id" value="${info.id}">
							<input type="submit" class="btn btn-primary btn-small" value="View">
						</g:form>
					</td>
				</tr>
			</g:each>
		</table>
	</g:if>
	</div>
	
	<div>
		<g:form controller="main" action="index">
			<input type="submit" class="btn btn-primary btn-small" value="Back">
		</g:form>
	</div>
	
</body>
</html>