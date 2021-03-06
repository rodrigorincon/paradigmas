
<%@ page import="conexaobd.Podcast" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'podcast.label', default: 'Podcast')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-podcast" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-podcast" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="author" title="${message(code: 'podcast.author.label', default: 'Author')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'podcast.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="isbn" title="${message(code: 'podcast.isbn.label', default: 'Isbn')}" />
					
						<g:sortableColumn property="tema" title="${message(code: 'podcast.tema.label', default: 'Tema')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${podcastInstanceList}" status="i" var="podcastInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${podcastInstance.id}">${fieldValue(bean: podcastInstance, field: "author")}</g:link></td>
					
						<td><g:formatDate date="${podcastInstance.date}" /></td>
					
						<td>${fieldValue(bean: podcastInstance, field: "isbn")}</td>
					
						<td>${fieldValue(bean: podcastInstance, field: "tema")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${podcastInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
