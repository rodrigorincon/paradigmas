<%@ page import="heranca.Content" %>



<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'author', 'error')} ">
	<label for="author">
		<g:message code="content.author.label" default="Author" />
		
	</label>
	<g:textField name="author" value="${contentInstance?.author}"/>
</div>

