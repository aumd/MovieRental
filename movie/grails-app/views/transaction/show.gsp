
<%@ page import="movie.Transaction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-transaction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-transaction" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list transaction">
			
				<g:if test="${transactionInstance?.customerId}">
				<li class="fieldcontain">
					<span id="customerId-label" class="property-label"><g:message code="transaction.customerId.label" default="Customer Id" /></span>
					
						<span class="property-value" aria-labelledby="customerId-label"><g:fieldValue bean="${transactionInstance}" field="customerId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="transaction.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${transactionInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.movieId}">
				<li class="fieldcontain">
					<span id="movieId-label" class="property-label"><g:message code="transaction.movieId.label" default="Movie Id" /></span>
					
						<span class="property-value" aria-labelledby="movieId-label"><g:fieldValue bean="${transactionInstance}" field="movieId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="transaction.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${transactionInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.fee}">
				<li class="fieldcontain">
					<span id="fee-label" class="property-label"><g:message code="transaction.fee.label" default="Fee" /></span>
					
						<span class="property-value" aria-labelledby="fee-label"><g:fieldValue bean="${transactionInstance}" field="fee"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${transactionInstance?.id}" />
					<g:link class="edit" action="edit" id="${transactionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
