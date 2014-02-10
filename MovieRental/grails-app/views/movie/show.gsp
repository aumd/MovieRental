
<%@ page import="MovieRental.Movie" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movie.label', default: 'Movie')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-movie" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-movie" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list movie">
			
				<g:if test="${movieInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="movie.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${movieInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movieInstance?.medium}">
				<li class="fieldcontain">
					<span id="medium-label" class="property-label"><g:message code="movie.medium.label" default="Medium" /></span>
					
						<span class="property-value" aria-labelledby="medium-label"><g:fieldValue bean="${movieInstance}" field="medium"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movieInstance?.genre}">
				<li class="fieldcontain">
					<span id="genre-label" class="property-label"><g:message code="movie.genre.label" default="Genre" /></span>
					
						<span class="property-value" aria-labelledby="genre-label"><g:fieldValue bean="${movieInstance}" field="genre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movieInstance?.director}">
				<li class="fieldcontain">
					<span id="director-label" class="property-label"><g:message code="movie.director.label" default="Director" /></span>
					
						<span class="property-value" aria-labelledby="director-label"><g:fieldValue bean="${movieInstance}" field="director"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movieInstance?.actorOrActress}">
				<li class="fieldcontain">
					<span id="actorOrActress-label" class="property-label"><g:message code="movie.actorOrActress.label" default="Actor Or Actress" /></span>
					
						<span class="property-value" aria-labelledby="actorOrActress-label"><g:fieldValue bean="${movieInstance}" field="actorOrActress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movieInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="movie.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${movieInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movieInstance?.overdueRate}">
				<li class="fieldcontain">
					<span id="overdueRate-label" class="property-label"><g:message code="movie.overdueRate.label" default="Overdue Rate" /></span>
					
						<span class="property-value" aria-labelledby="overdueRate-label"><g:fieldValue bean="${movieInstance}" field="overdueRate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movieInstance?.rate}">
				<li class="fieldcontain">
					<span id="rate-label" class="property-label"><g:message code="movie.rate.label" default="Rate" /></span>
					
						<span class="property-value" aria-labelledby="rate-label"><g:fieldValue bean="${movieInstance}" field="rate"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${movieInstance?.id}" />
					<g:link class="edit" action="edit" id="${movieInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
