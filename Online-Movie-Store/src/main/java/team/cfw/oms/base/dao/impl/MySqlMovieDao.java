package team.cfw.oms.base.dao.impl;

import org.springframework.stereotype.Repository;
import team.cfw.oms.base.dao.MovieDao;
import team.cfw.oms.base.entity.Movie;

/**
 * Created by CFWLoader on 10/26/16.
 */
@Repository
public class MySqlMovieDao extends TemplateDaoImpl<Movie> implements MovieDao {
}
