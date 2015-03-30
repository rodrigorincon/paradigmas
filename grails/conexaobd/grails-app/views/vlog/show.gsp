
<%@ page import="conexaobd.Vlog" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vlog.label', default: 'Vlog')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vlog" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-vlog" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vlog">
			
				<g:if test="${vlogInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="vlog.author.label" default="Author" /></span>
					
						<span class="property-value" aria-labelledby="author-label"><g:fieldValue bean="${vlogInstance}" field="author"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vlogInstance?.canal}">
				<li class="fieldcontain">
					<span id="canal-label" class="property-label"><g:message code="vlog.canal.label" default="Canal" /></span>
					
						<span class="property-value" aria-labelledby="canal-label"><g:fieldValue bean="${vlogInstance}" field="canal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vlogInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="vlog.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${vlogInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vlogInstance?.tempo}">
				<li class="fieldcontain">
					<span id="tempo-label" class="property-label"><g:message code="vlog.tempo.label" default="Tempo" /></span>
					
						<span class="property-value" aria-labelledby="tempo-label"><g:fieldValue bean="${vlogInstance}" field="tempo"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${vlogInstance?.id}" />
					<g:link class="edit" action="edit" id="${vlogInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
