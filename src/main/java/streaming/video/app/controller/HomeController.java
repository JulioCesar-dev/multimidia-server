package streaming.video.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import streaming.video.app.model.Media;
import streaming.video.app.service.MediaService;

@Controller
@RequestMapping("/")
public class HomeController {
	
	private MediaService mediaService;
	
	public HomeController(MediaService mediaService) {
		this.mediaService = mediaService;
	}

	@GetMapping
	public ModelAndView index() {
		List<Media> audios = this.mediaService.getAllByMediaType(Media.Type.AUDIO);
		List<Media> videos = this.mediaService.getAllByMediaType(Media.Type.VIDEO);
		
		Map<String, Object> model = new HashMap<>();
		model.put("audios", audios);
		model.put("videos", videos);
		
		return new ModelAndView("home", model);
	}
}
