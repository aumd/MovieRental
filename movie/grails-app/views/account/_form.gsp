<%@ page import="movie.Account" %>



<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'fullName', 'error')} required">
	<label for="fullName">
		<g:message code="account.fullName.label" default="Full Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fullName" required="" value="${accountInstance?.fullName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'userName', 'error')} required">
	<label for="userName">
		<g:message code="account.userName.label" default="User Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userName" required="" value="${accountInstance?.userName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="account.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${accountInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="account.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="role" required="" value="${accountInstance?.role}"/>
</div>

