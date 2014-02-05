
<%@ page import="movie.Cart" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cart.label', default: 'Cart')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cart" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cart" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cart">
			
				<g:if test="${cartInstance?.customerId}">
				<li class="fieldcontain">
					<span id="customerId-label" class="property-label"><g:message code="cart.customerId.label" default="Customer Id" /></span>
					
						<span class="property-value" aria-labelledby="customerId-label"><g:fieldValue bean="${cartInstance}" field="customerId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cartInstance?.movieId}">
				<li class="fieldcontain">
					<span id="movieId-label" class="property-label"><g:message code="cart.movieId.label" default="Movie Id" /></span>
					
						<span class="property-value" aria-labelledby="movieId-label"><g:fieldValue bean="${cartInstance}" field="movieId"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${cartInstance?.id}" />
					<g:link class="edit" action="edit" id="${cartInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
