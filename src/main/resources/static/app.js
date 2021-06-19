function viewVideo(id) {
	window.location.href = "/media/video/" + id; 
}

function viewAudio(id) {
	window.location.href = "/media/audio/" + id; 
}

function toggleSidebar() {
	const sideBarElement = document.getElementById('btn-sidenav-toggler');
	
	if (sideBarElement.style.display == 'none' || sideBarElement.style.display == '') {
		sideBarElement.style.display = 'block';
	} else {
		sideBarElement.style.display = 'none';
	}
}

function upload() {
	$('#upload').ajaxForm({
		success: function() {
     		$('#upload-alert').toast('show');
		}
	});
}