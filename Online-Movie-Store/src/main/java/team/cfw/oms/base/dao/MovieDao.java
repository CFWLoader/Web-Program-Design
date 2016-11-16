package team.cfw.oms.base.dao;

import team.cfw.oms.base.entity.Movie;

import java.util.List;

/**
 * Created by CFWLoader on 10/26/16.
 */
public interface MovieDao extends TemplateDao<Movie> {

    List<Movie> searchMovieByKeywords(String[] keywords);

}
