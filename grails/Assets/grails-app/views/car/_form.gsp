<%@ page import="assets.Car" %>



<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'motor', 'error')} required">
	<label for="motor">
		<g:message code="car.motor.label" default="Motor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="motor" name="motor.id" from="${assets.Motor.list()}" optionKey="id" required="" value="${carInstance?.motor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="car.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${carInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="car.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${assets.Person.list()}" optionKey="id" required="" value="${carInstance?.person?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'year', 'error')} ">
	<label for="year">
		<g:message code="car.year.label" default="Year" />
		
	</label>
	<g:textField name="year" value="${carInstance?.year}"/>
</div>

