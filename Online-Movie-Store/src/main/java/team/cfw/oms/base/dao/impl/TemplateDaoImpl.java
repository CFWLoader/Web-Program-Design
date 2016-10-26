package team.cfw.oms.base.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate4.HibernateTemplate;
import team.cfw.oms.base.dao.TemplateDao;

import javax.annotation.Resource;
import java.lang.reflect.ParameterizedType;
import java.util.List;

/**
 * Created by CFWLoader on 10/25/16.
 */
@SuppressWarnings("unchecked")
public class TemplateDaoImpl<T> implements TemplateDao<T> {

    @Resource
    private HibernateTemplate hibernateTemplate;

    protected Class<T> clazz;

    public TemplateDaoImpl() {

        ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
        //  获取第一个泛型化参数
        clazz = (Class<T>) type.getActualTypeArguments()[0];

    }

    public Object addEntity(T entity) {

        return hibernateTemplate.save(entity);

    }

    public boolean deleteEntity(T entity) {

        hibernateTemplate.delete(entity);

        return true;
    }

    public boolean updateEntity(T entity) {

        hibernateTemplate.update(entity);

        return true;
    }

    public List<T> getEntities() {

        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(clazz);

        return (List<T>) hibernateTemplate.findByCriteria(detachedCriteria);

    }

    public List<T> getEntities(int startIndex, int fetchSize) {

        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(clazz);

        return (List<T>) hibernateTemplate.findByCriteria(detachedCriteria, startIndex, fetchSize);

    }

    public Long sumOfEntities() {

        Criteria criteria = this.getSession().createCriteria(clazz);

        criteria.setProjection(Projections.count("id"));

        Long result = (Long) criteria.uniqueResult();

        return result;
    }

    public T getEntityById(String id) {
        return hibernateTemplate.get(clazz, id);
    }

    public Session getSession() {
        return hibernateTemplate.getSessionFactory().getCurrentSession();
    }
}
