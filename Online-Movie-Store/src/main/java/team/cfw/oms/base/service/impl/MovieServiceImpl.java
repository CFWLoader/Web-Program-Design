package team.cfw.oms.base.service.impl;

import org.springframework.stereotype.Service;
import team.cfw.oms.base.dao.MovieDao;
import team.cfw.oms.base.entity.Movie;
import team.cfw.oms.base.service.MovieService;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by CFWLoader on 10/26/16.
 */
@Service
public class MovieServiceImpl implements MovieService {

    @Resource
    private MovieDao movieDao;

    @Transactional
    public boolean addMovie(Movie movie) {
        String uuid = (String) movieDao.addEntity(movie);

        if(uuid != movie.getId())
        {
            return false;
        }

        return true;
    }

    public List<Movie> getAllMovies() {
        return movieDao.getEntities();
    }

    public Movie getMovieByMovieId(String movieId) {
        return movieDao.getEntityById(movieId);
    }
}
