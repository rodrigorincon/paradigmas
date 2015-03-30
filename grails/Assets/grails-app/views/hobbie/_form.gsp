<%@ page import="assets.Hobbie" %>



<div class="fieldcontain ${hasErrors(bean: hobbieInstance, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="hobbie.nome.label" default="Nome" />
		
	</label>
	<g:textField name="nome" value="${hobbieInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hobbieInstance, field: 'person', 'error')} ">
	<label for="person">
		<g:message code="hobbie.person.label" default="Person" />
		
	</label>
	
</div>

