<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<t:structure>
	<jsp:body>
	    <h1 class="display-6">${media.title}</h1>
	
		<div class="my-4">
			<c:if test = "${media.type == 'VIDEO'}">
				<video height="480" controls>
				  <source src="/media/stream/${media.id}" type="${media.mimeType}">
				</video>
			</c:if>
			
			<c:if test = "${media.type == 'AUDIO'}">
				<audio controls>
				  <source src="/media/stream/${media.id}" type="${media.mimeType}">
				</audio>
			</c:if>
		</div>
		
		<div>
			<div class="fw-bold">Descrição:</div>
			<p class="mt-1">${media.description}</p>
		</div>
	</jsp:body>
</t:structure>