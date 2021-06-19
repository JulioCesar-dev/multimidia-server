<%@tag description="Simple Wrapper Tag" pageEncoding="UTF-8"%>
<%@attribute name="script" fragment="true" %>

<!DOCTYPE html>

<html>
	<head>
		<meta charset="utf-8">
		<title>Streaming Video APP</title>
		
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">		
		
		<link href="/style.css" rel="stylesheet">
		<link href="/font-awesome/css/all.css" rel="stylesheet">
	</head>
	<body>
		<header>
			<nav class="navbar navbar-light bg-white px-3">
			    <div class="container-fluid">
			        <button class="navbar-toggler" type="button" onclick="toggleSidebar()"> 
			            <span class="navbar-toggler-icon"></span>
			        </button>
			        <a class="navbar-brand" href="/">
						<img src="https://play-lh.googleusercontent.com/y2Od7hvKRSTHUt4U-hTOFSp6clrrNK7JXGxjYur6ffCOypJpEcRX2HSRIgbuwjWPv54" alt="" width="30" height="24" class="d-inline-block align-text-top">
						Multimedia Server
			        </a>
			    </div>
			</nav>			
		</header>
	
		<div id="btn-sidenav-toggler" class="sidenav pt-4">
			<ul class="nav flex-column">
				<li class="nav-item px-4 py-2">
					<i class="fas fa-home fa-lg"></i>
					<a class="nav-link" href="/">Home</a>
				</li>
				<li class="nav-item px-4 py-2">
					<i class="fas fa-upload fa-lg"></i>
					<a class="nav-link" href="/media/upload">Upload</a>
				</li>
				<li class="nav-item px-4 py-2">
					<i class="fas fa-file-audio fa-lg"></i>
					<a class="nav-link" href="/media/audio">Audio</a>
				</li>
				<li class="nav-item px-4 py-2">
					<i class="fab fa-youtube fa-lg"></i>
					<a class="nav-link" href="/media/video">Vídeo</a>
				</li>
			</ul>
		</div>
		
		<main class="bg-light">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-12 col-md-10">
						<div class="p-4">
							<jsp:doBody/>
						</div>
					</div>
				</div>
			</div>
		</main>

		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
		<script src="/app.js"></script>

		<jsp:invoke fragment="script"/>		
	</body>
</html>