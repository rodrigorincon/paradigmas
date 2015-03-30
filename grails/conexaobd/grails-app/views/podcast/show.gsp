
<%@ page import="conexaobd.Podcast" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'podcast.label', default: 'Podcast')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-podcast" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-podcast" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list podcast">
			
				<g:if test="${podcastInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="podcast.author.label" default="Author" /></span>
					
						<span class="property-value" aria-labelledby="author-label"><g:fieldValue bean="${podcastInstance}" field="author"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${podcastInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="podcast.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${podcastInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${podcastInstance?.isbn}">
				<li class="fieldcontain">
					<span id="isbn-label" class="property-label"><g:message code="podcast.isbn.label" default="Isbn" /></span>
					
						<span class="property-value" aria-labelledby="isbn-label"><g:fieldValue bean="${podcastInstance}" field="isbn"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${podcastInstance?.tema}">
				<li class="fieldcontain">
					<span id="tema-label" class="property-label"><g:message code="podcast.tema.label" default="Tema" /></span>
					
						<span class="property-value" aria-labelledby="tema-label"><g:fieldValue bean="${podcastInstance}" field="tema"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${podcastInstance?.id}" />
					<g:link class="edit" action="edit" id="${podcastInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
