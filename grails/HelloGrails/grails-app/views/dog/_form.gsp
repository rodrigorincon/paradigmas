<%@ page import="hellograils.Dog" %>



<div class="fieldcontain ${hasErrors(bean: dogInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="dog.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${dogInstance?.name}"/>
</div>

