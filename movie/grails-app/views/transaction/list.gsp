
<%@ page import="movie.Transaction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-transaction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-transaction" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="customerId" title="${message(code: 'transaction.customerId.label', default: 'Customer Id')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'transaction.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="movieId" title="${message(code: 'transaction.movieId.label', default: 'Movie Id')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'transaction.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="fee" title="${message(code: 'transaction.fee.label', default: 'Fee')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${transactionInstanceList}" status="i" var="transactionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${transactionInstance.id}">${fieldValue(bean: transactionInstance, field: "customerId")}</g:link></td>
					
						<td>${fieldValue(bean: transactionInstance, field: "type")}</td>
					
						<td>${fieldValue(bean: transactionInstance, field: "movieId")}</td>
					
						<td><g:formatDate date="${transactionInstance.date}" /></td>
					
						<td>${fieldValue(bean: transactionInstance, field: "fee")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${transactionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
