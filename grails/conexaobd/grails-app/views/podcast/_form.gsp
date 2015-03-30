<%@ page import="conexaobd.Podcast" %>



<div class="fieldcontain ${hasErrors(bean: podcastInstance, field: 'author', 'error')} ">
	<label for="author">
		<g:message code="podcast.author.label" default="Author" />
		
	</label>
	<g:textField name="author" value="${podcastInstance?.author}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: podcastInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="podcast.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${podcastInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: podcastInstance, field: 'isbn', 'error')} ">
	<label for="isbn">
		<g:message code="podcast.isbn.label" default="Isbn" />
		
	</label>
	<g:textField name="isbn" value="${podcastInstance?.isbn}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: podcastInstance, field: 'tema', 'error')} ">
	<label for="tema">
		<g:message code="podcast.tema.label" default="Tema" />
		
	</label>
	<g:textField name="tema" value="${podcastInstance?.tema}"/>
</div>

