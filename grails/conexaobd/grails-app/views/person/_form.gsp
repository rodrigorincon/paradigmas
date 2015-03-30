<%@ page import="conexaobd.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'conteudo', 'error')} ">
	<label for="conteudo">
		<g:message code="person.conteudo.label" default="Conteudo" />
		
	</label>
	<g:select id="conteudo" name="conteudo.id" from="${conexaobd.Content.list()}" optionKey="id" value="${personInstance?.conteudo?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'first_name', 'error')} ">
	<label for="first_name">
		<g:message code="person.first_name.label" default="Firstname" />
		
	</label>
	<g:textField name="first_name" value="${personInstance?.first_name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'last_name', 'error')} ">
	<label for="last_name">
		<g:message code="person.last_name.label" default="Lastname" />
		
	</label>
	<g:textField name="last_name" value="${personInstance?.last_name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'section', 'error')} ">
	<label for="section">
		<g:message code="person.section.label" default="Section" />
		
	</label>
	<g:textField name="section" value="${personInstance?.section}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="person.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="year" type="number" value="${personInstance.year}" required=""/>
</div>

