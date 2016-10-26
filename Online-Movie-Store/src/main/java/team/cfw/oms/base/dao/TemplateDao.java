package team.cfw.oms.base.dao;

import org.hibernate.Session;

import java.util.List;

/**
 * Created by CFWLoader on 10/25/16.
 */
public interface TemplateDao<T> {

    // HibernateTemplate.save() return the id of the entity.
    Object addEntity(T entity);

    boolean deleteEntity(T entity);

    boolean updateEntity(T entity);

    List<T> getEntities();

    List<T> getEntities(int startIndex, int fetchSize);

    Long sumOfEntities();

    T getEntityById(String id);

    Session getSession();
}
