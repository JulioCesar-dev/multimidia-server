<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<t:structure>
	<jsp:body>
		<h1 class="display-6">Áudios</h1>
	
		<c:forEach var="audio" items="${audios}">
			<div class="card" onclick="viewAudio('${audio.id}')">
				<div class="card-body">${audio.title}</div>
			</div>
		</c:forEach>
		
		<c:if test="${empty audios}">
			<p class="mt-4">Nenhum áudio encontrado</p>
		</c:if>
	</jsp:body>
</t:structure>