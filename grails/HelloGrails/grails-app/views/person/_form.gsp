<%@ page import="hellograils.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'birthday', 'error')} required">
	<label for="birthday">
		<g:message code="person.birthday.label" default="Birthday" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birthday" precision="day"  value="${personInstance?.birthday}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="person.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${personInstance?.name}"/>
</div>

