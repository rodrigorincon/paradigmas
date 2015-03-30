<%@ page import="conexaobd.Vlog" %>



<div class="fieldcontain ${hasErrors(bean: vlogInstance, field: 'author', 'error')} ">
	<label for="author">
		<g:message code="vlog.author.label" default="Author" />
		
	</label>
	<g:textField name="author" value="${vlogInstance?.author}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vlogInstance, field: 'canal', 'error')} ">
	<label for="canal">
		<g:message code="vlog.canal.label" default="Canal" />
		
	</label>
	<g:textField name="canal" value="${vlogInstance?.canal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vlogInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="vlog.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${vlogInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: vlogInstance, field: 'tempo', 'error')} required">
	<label for="tempo">
		<g:message code="vlog.tempo.label" default="Tempo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="tempo" type="number" value="${vlogInstance.tempo}" required=""/>
</div>

