package team.cfw.oms.base.dao.impl;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import team.cfw.oms.base.dao.MovieDao;
import team.cfw.oms.base.entity.Movie;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by CFWLoader on 10/26/16.
 */
@Repository
public class MySqlMovieDao extends TemplateDaoImpl<Movie> implements MovieDao {

    @SuppressWarnings("unchecked")
    public List<Movie> searchMovieByKeywords(String[] keywords) {

        if(keywords.length < 1)
        {
            return this.getEntities(0, 10);
        }

        List<Movie> result = new LinkedList<Movie>();

        DetachedCriteria criteria = DetachedCriteria.forClass(clazz);

        Criterion criterion;

        criterion = Restrictions.like("movieName", "");

        for(String keyword : keywords)
        {
            criterion = Restrictions.or(criterion, Restrictions.like("movieName", keyword));
        }

        result = (List<Movie>) hibernateTemplate.findByCriteria(criteria.add(criterion));

        return result;
    }
}
