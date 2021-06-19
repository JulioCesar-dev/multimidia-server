package streaming.video.app.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.transaction.Transactional;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import streaming.video.app.model.Media;
import streaming.video.app.model.MediaPostObject;
import streaming.video.app.repository.MediaRepository;

@Service
public class MediaService {

	@Value("${app.media-directory}")
	private String mediaDirectory;
	
	private MediaRepository mediaRepository;
	
	public MediaService(MediaRepository mediaRepository) {
		this.mediaRepository = mediaRepository;
	}
	
	public List<Media> getAllByMediaType(Media.Type mediaType) {
		return this.mediaRepository.findAllByType(mediaType);
	}
	
	@Transactional
	public Media save(MediaPostObject media) {
		UUID uuid = UUID.randomUUID();
		
		try(InputStream in = media.getFile().getInputStream()) {
			write(in, uuid);
			
			Media model = new Media();
			
			model.setId(uuid);
			model.setTitle(media.getTitle());
			model.setDescription(media.getDescription());
			model.setMimeType(media.getFile().getContentType());
			model.setType(determineType(media.getFile().getContentType()));
			
			return this.mediaRepository.save(model);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	private Media.Type determineType(String mimeType) {
		if (mimeType == null) {
			throw new RuntimeException("Media type unsupported");
		}
		
		String[] type = mimeType.split("/");
		
		if (type.length == 0) {
			throw new RuntimeException("Media type unsupported");
		}
		
		if (type[0].equalsIgnoreCase("video")) {
			return Media.Type.VIDEO;
		} else if (type[0].equalsIgnoreCase("audio")) {
			return Media.Type.AUDIO;
		} else {
			throw new RuntimeException("Media type unsupported");
		}
	}

	private void write(InputStream in, UUID uuid) throws IOException {
		String filename = generateFilename(uuid);
		
		try(FileOutputStream fileOutputStream = new FileOutputStream(filename)){
			IOUtils.copy(in, fileOutputStream);
		}
	}

	private String generateFilename(UUID uuid) {
		return this.mediaDirectory + File.separator + uuid.toString();
	}

	public Media getById(UUID id) {
		return this.mediaRepository.findById(id).orElseThrow(() -> new RuntimeException("Resource not found"));
	}

	public String generateUrl(UUID id) {
		return mediaDirectory + "/" + id.toString();
	}
}
