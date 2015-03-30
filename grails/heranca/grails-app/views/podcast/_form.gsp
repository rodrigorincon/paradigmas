<%@ page import="heranca.Podcast" %>



<div class="fieldcontain ${hasErrors(bean: podcastInstance, field: 'author', 'error')} ">
	<label for="author">
		<g:message code="podcast.author.label" default="Author" />
		
	</label>
	<g:textField name="author" value="${podcastInstance?.author}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: podcastInstance, field: 'isbn', 'error')} ">
	<label for="isbn">
		<g:message code="podcast.isbn.label" default="Isbn" />
		
	</label>
	<g:textField name="isbn" value="${podcastInstance?.isbn}"/>
</div>

