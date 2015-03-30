
<%@ page import="conexaobd.Vlog" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vlog.label', default: 'Vlog')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-vlog" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-vlog" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="author" title="${message(code: 'vlog.author.label', default: 'Author')}" />
					
						<g:sortableColumn property="canal" title="${message(code: 'vlog.canal.label', default: 'Canal')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'vlog.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="tempo" title="${message(code: 'vlog.tempo.label', default: 'Tempo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vlogInstanceList}" status="i" var="vlogInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${vlogInstance.id}">${fieldValue(bean: vlogInstance, field: "author")}</g:link></td>
					
						<td>${fieldValue(bean: vlogInstance, field: "canal")}</td>
					
						<td><g:formatDate date="${vlogInstance.date}" /></td>
					
						<td>${fieldValue(bean: vlogInstance, field: "tempo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vlogInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
