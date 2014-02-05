<%@ page import="movie.Cart" %>



<div class="fieldcontain ${hasErrors(bean: cartInstance, field: 'customerId', 'error')} required">
	<label for="customerId">
		<g:message code="cart.customerId.label" default="Customer Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="customerId" required="" value="${cartInstance?.customerId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cartInstance, field: 'movieId', 'error')} required">
	<label for="movieId">
		<g:message code="cart.movieId.label" default="Movie Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="movieId" required="" value="${cartInstance?.movieId}"/>
</div>

