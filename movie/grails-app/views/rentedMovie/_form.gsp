<%@ page import="movie.RentedMovie" %>



<div class="fieldcontain ${hasErrors(bean: rentedMovieInstance, field: 'customerId', 'error')} required">
	<label for="customerId">
		<g:message code="rentedMovie.customerId.label" default="Customer Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="customerId" required="" value="${rentedMovieInstance?.customerId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: rentedMovieInstance, field: 'movieId', 'error')} required">
	<label for="movieId">
		<g:message code="rentedMovie.movieId.label" default="Movie Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="movieId" required="" value="${rentedMovieInstance?.movieId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: rentedMovieInstance, field: 'dueDate', 'error')} required">
	<label for="dueDate">
		<g:message code="rentedMovie.dueDate.label" default="Due Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dueDate" precision="day"  value="${rentedMovieInstance?.dueDate}"  />
</div>

