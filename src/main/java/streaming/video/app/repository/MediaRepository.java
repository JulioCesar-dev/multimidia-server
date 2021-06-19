package streaming.video.app.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.repository.CrudRepository;

import streaming.video.app.model.Media;

public interface MediaRepository extends CrudRepository<Media, UUID> {
	List<Media> findAllByType(Media.Type mediaType);
}
