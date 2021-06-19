<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<t:structure>
	<jsp:body>
		<div>
			<h2 class="display-6">Áudios</h2>
		
			<c:forEach var="audio" items="${audios}">
				<div class="card">
					<div onclick="viewAudio('${audio.id}')" class="card-body">
						<i class="far fa-play-circle"></i>
						<span class="ml-4">${audio.title}</span>
					</div>
				</div>
			</c:forEach>
			
			<c:if test="${empty audios}">
				<p class="mt-4">Nenhum áudio encontrado</p>
			</c:if>
		</div>
		
		<div class="mt-4">
			 <h1 class="display-6">Vídeos</h1>
		
			<c:forEach var="video" items="${videos}">
				<div class="card">
					<div onclick="viewVideo('${video.id}')" class="card-body">
						<i class="far fa-play-circle"></i>
						<span class="ml-4">${video.title}</span>
					</div>
				</div>
			</c:forEach>
			
			<c:if test="${empty videos}">
				<p class="mt-4">Nenhum vídeo encontrado</p>
			</c:if>
		</div>
	</jsp:body>
</t:structure>