<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:structure>
	<jsp:attribute name="script">
		<script>
			<c:if test="${showToast == true}">
				setTimeout(()=> {
					$('.toast').toast('show');
				});
			</c:if>
		</script>
	</jsp:attribute>
	
	<jsp:body>
		<form id="upload" action="/media/upload" method="POST" enctype="multipart/form-data">
			<h1 class="display-6 text-center mb-4">Upload de Mídia</h1>
			<div class="mb-3">
				<label for="title" class="form-label fw-bold">Título</label> 
				<input type="text" name="title" class="form-control" id="title" required>
			</div>
			<div class="mb-3">
				<label for="description" class="form-label fw-bold">Descrição</label>
				<textarea class="form-control" name="description" id="description" rows="3" required></textarea>
			</div>
			<div class="mb-3">
				<label for="media-file" class="form-label fw-bold">Mídia</label> 
				<input class="form-control" name="file" type="file" id="media-file" accept="audio/*,video/*" required>
			</div>
			<div class="d-grid gap-2">
				<button type="submit" class="btn btn-primary fw-bold">Upload</button>
			</div>
		</form>
		
		<div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
			<div class="toast-header">
				<strong class="me-auto">Bootstrap</strong>
				<small>Agora</small>
				<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
			</div>
			<div class="toast-body">
				Upload realizado com sucesso!
			</div>
		</div>
    </jsp:body>	
</t:structure>