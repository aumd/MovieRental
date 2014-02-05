
<%@ page import="movie.RentedMovie" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'rentedMovie.label', default: 'RentedMovie')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-rentedMovie" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-rentedMovie" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list rentedMovie">
			
				<g:if test="${rentedMovieInstance?.customerId}">
				<li class="fieldcontain">
					<span id="customerId-label" class="property-label"><g:message code="rentedMovie.customerId.label" default="Customer Id" /></span>
					
						<span class="property-value" aria-labelledby="customerId-label"><g:fieldValue bean="${rentedMovieInstance}" field="customerId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${rentedMovieInstance?.movieId}">
				<li class="fieldcontain">
					<span id="movieId-label" class="property-label"><g:message code="rentedMovie.movieId.label" default="Movie Id" /></span>
					
						<span class="property-value" aria-labelledby="movieId-label"><g:fieldValue bean="${rentedMovieInstance}" field="movieId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${rentedMovieInstance?.dueDate}">
				<li class="fieldcontain">
					<span id="dueDate-label" class="property-label"><g:message code="rentedMovie.dueDate.label" default="Due Date" /></span>
					
						<span class="property-value" aria-labelledby="dueDate-label"><g:formatDate date="${rentedMovieInstance?.dueDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${rentedMovieInstance?.id}" />
					<g:link class="edit" action="edit" id="${rentedMovieInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
