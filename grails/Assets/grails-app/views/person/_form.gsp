<%@ page import="assets.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'cars', 'error')} ">
	<label for="cars">
		<g:message code="person.cars.label" default="Cars" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.cars?}" var="c">
    <li><g:link controller="car" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="car" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'car.label', default: 'Car')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="person.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${personInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'hobbies', 'error')} ">
	<label for="hobbies">
		<g:message code="person.hobbies.label" default="Hobbies" />
		
	</label>
	<g:select name="hobbies" from="${assets.Hobbie.list()}" multiple="multiple" optionKey="id" size="5" value="${personInstance?.hobbies*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="person.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${personInstance?.name}"/>
</div>

