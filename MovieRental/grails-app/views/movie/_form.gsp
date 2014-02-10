<%@ page import="MovieRental.Movie" %>



<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="movie.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${movieInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'medium', 'error')} required">
	<label for="medium">
		<g:message code="movie.medium.label" default="Medium" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="medium" required="" value="${movieInstance?.medium}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'genre', 'error')} required">
	<label for="genre">
		<g:message code="movie.genre.label" default="Genre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="genre" required="" value="${movieInstance?.genre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'director', 'error')} required">
	<label for="director">
		<g:message code="movie.director.label" default="Director" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="director" required="" value="${movieInstance?.director}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'actorOrActress', 'error')} required">
	<label for="actorOrActress">
		<g:message code="movie.actorOrActress.label" default="Actor Or Actress" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="actorOrActress" required="" value="${movieInstance?.actorOrActress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="movie.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="status" required="" value="${movieInstance?.status}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'overdueRate', 'error')} required">
	<label for="overdueRate">
		<g:message code="movie.overdueRate.label" default="Overdue Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="overdueRate" value="${fieldValue(bean: movieInstance, field: 'overdueRate')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'rate', 'error')} required">
	<label for="rate">
		<g:message code="movie.rate.label" default="Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rate" value="${fieldValue(bean: movieInstance, field: 'rate')}" required=""/>
</div>

