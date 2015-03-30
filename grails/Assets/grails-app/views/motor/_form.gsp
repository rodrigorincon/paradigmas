<%@ page import="assets.Motor" %>



<div class="fieldcontain ${hasErrors(bean: motorInstance, field: 'cavalos', 'error')} required">
	<label for="cavalos">
		<g:message code="motor.cavalos.label" default="Cavalos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cavalos" type="number" value="${motorInstance.cavalos}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: motorInstance, field: 'potencia', 'error')} required">
	<label for="potencia">
		<g:message code="motor.potencia.label" default="Potencia" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="potencia" value="${fieldValue(bean: motorInstance, field: 'potencia')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: motorInstance, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="motor.tipo.label" default="Tipo" />
		
	</label>
	<g:textField name="tipo" value="${motorInstance?.tipo}"/>
</div>

