<%@ page import="conexaobd.Content" %>



<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'author', 'error')} ">
	<label for="author">
		<g:message code="content.author.label" default="Author" />
		
	</label>
	<g:textField name="author" value="${contentInstance?.author}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="content.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${contentInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'pessoa', 'error')} required">
	<label for="pessoa">
		<g:message code="content.pessoa.label" default="Pessoa" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pessoa" name="pessoa.id" from="${conexaobd.Person.list()}" optionKey="id" required="" value="${contentInstance?.pessoa?.id}" class="many-to-one"/>
</div>

