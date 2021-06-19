package streaming.video.app.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import streaming.video.app.model.Media;
import streaming.video.app.model.MediaPostObject;
import streaming.video.app.service.MediaService;

@Controller
@RequestMapping("/media")
@SuppressWarnings("serial")
public class MediaController {

	private MediaService mediaService;
	
	public MediaController(MediaService mediaService) {
		this.mediaService = mediaService;
	}
	
	@GetMapping("/audio")
	public ModelAndView getAudioPage() {
		List<Media> audios = this.mediaService.getAllByMediaType(Media.Type.AUDIO);
		
		Map<String, List<Media>> model = new HashMap<String, List<Media>>() {{
			put("audios", audios);
		}};
		
		return new ModelAndView("audio", model);
	}
	
	@GetMapping("/video")
	public ModelAndView getVideoPage() {
		List<Media> videos = this.mediaService.getAllByMediaType(Media.Type.VIDEO);
		
		Map<String, List<Media>> model = new HashMap<String, List<Media>>() {{
			put("videos", videos);
		}};
		
		return new ModelAndView("video", model);
	}
	
	@GetMapping("/video/{id}")
	public ModelAndView getVideoPage(@PathVariable UUID id) {
		Media media = this.mediaService.getById(id);
		
		Map<String, Media> model = new HashMap<String, Media>() {{
			put("media", media);
		}};
		
		return new ModelAndView("media-view", model);
	}
	
	@GetMapping("/audio/{id}")
	public ModelAndView getAudioPage(@PathVariable UUID id) {
		Media media = this.mediaService.getById(id);
		
		Map<String, Media> model = new HashMap<String, Media>() {{
			put("media", media);
		}};
		
		return new ModelAndView("media-view", model);
	}
	
	@GetMapping("/stream/{id}")
	public ResponseEntity<Resource> download(@PathVariable UUID id) throws IOException {
		Media media = this.mediaService.getById(id);
		String url = this.mediaService.generateUrl(id);

	    InputStreamResource resource = new InputStreamResource(new FileInputStream(url));

	    return ResponseEntity.ok()
	            .contentType(MediaType.valueOf(media.getMimeType()))
	            .body(resource);
	}
	
	@GetMapping("/upload")
	public String getUploadPage() {
		return "upload";
	}
	
	@PostMapping("/upload")
	public ModelAndView save(MediaPostObject media) {
		this.mediaService.save(media);
		
		Map<String, Object> model = new HashMap<String, Object>() {{
			put("showToast", true);
		}};

		return new ModelAndView("upload", model);
	}
}
