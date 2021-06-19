<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<t:structure>
	<jsp:body>
	    <h1 class="display-6">Vídeos</h1>
	
		<c:forEach var="video" items="${videos}">
			<div class="card" onclick="viewVideo('${video.id}')">
				<div class="card-body">
					<i class="far fa-play-circle"></i>
					<span class="ml-4">${video.title}</span>
				</div>
			</div>
		</c:forEach>
		
		<c:if test="${empty videos}">
			<p class="mt-4">Nenhum vídeo encontrado</p>
		</c:if>
	</jsp:body>
</t:structure>