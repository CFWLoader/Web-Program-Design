package team.cfw.oms.base.service;

import team.cfw.oms.base.entity.Movie;

import java.util.List;

/**
 * Created by CFWLoader on 10/26/16.
 */
public interface MovieService {

    boolean addMovie(Movie movie);

    List<Movie> getAllMovies();

    Movie getMovieByMovieId(String movieId);
}
