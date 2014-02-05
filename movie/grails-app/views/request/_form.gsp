<%@ page import="movie.Request" %>



<div class="fieldcontain ${hasErrors(bean: requestInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="request.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${requestInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requestInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="request.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${requestInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requestInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="request.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${requestInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requestInstance, field: 'contactNumber', 'error')} required">
	<label for="contactNumber">
		<g:message code="request.contactNumber.label" default="Contact Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contactNumber" required="" value="${requestInstance?.contactNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requestInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="request.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${requestInstance?.email}"/>
</div>

