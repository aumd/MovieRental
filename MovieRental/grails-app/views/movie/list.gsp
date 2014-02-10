
<%@ page import="MovieRental.Movie" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movie.label', default: 'Movie')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-movie" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-movie" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'movie.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="medium" title="${message(code: 'movie.medium.label', default: 'Medium')}" />
					
						<g:sortableColumn property="genre" title="${message(code: 'movie.genre.label', default: 'Genre')}" />
					
						<g:sortableColumn property="director" title="${message(code: 'movie.director.label', default: 'Director')}" />
					
						<g:sortableColumn property="actorOrActress" title="${message(code: 'movie.actorOrActress.label', default: 'Actor Or Actress')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'movie.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${movieInstanceList}" status="i" var="movieInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${movieInstance.id}">${fieldValue(bean: movieInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: movieInstance, field: "medium")}</td>
					
						<td>${fieldValue(bean: movieInstance, field: "genre")}</td>
					
						<td>${fieldValue(bean: movieInstance, field: "director")}</td>
					
						<td>${fieldValue(bean: movieInstance, field: "actorOrActress")}</td>
					
						<td>${fieldValue(bean: movieInstance, field: "status")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${movieInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
