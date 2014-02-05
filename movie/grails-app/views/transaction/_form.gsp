<%@ page import="movie.Transaction" %>



<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'customerId', 'error')} required">
	<label for="customerId">
		<g:message code="transaction.customerId.label" default="Customer Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="customerId" required="" value="${transactionInstance?.customerId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="transaction.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="type" required="" value="${transactionInstance?.type}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'movieId', 'error')} required">
	<label for="movieId">
		<g:message code="transaction.movieId.label" default="Movie Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="movieId" required="" value="${transactionInstance?.movieId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="transaction.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${transactionInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'fee', 'error')} required">
	<label for="fee">
		<g:message code="transaction.fee.label" default="Fee" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="fee" value="${fieldValue(bean: transactionInstance, field: 'fee')}" required=""/>
</div>

