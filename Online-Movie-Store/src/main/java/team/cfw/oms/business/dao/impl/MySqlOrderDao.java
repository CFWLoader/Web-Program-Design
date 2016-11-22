package team.cfw.oms.business.dao.impl;

import org.hibernate.Hibernate;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import team.cfw.oms.base.dao.impl.TemplateDaoImpl;
import team.cfw.oms.base.entity.User;
import team.cfw.oms.business.dao.OrderDao;
import team.cfw.oms.business.entity.Order;

import java.util.List;

/**
 * Created by CFWLoader on 10/26/16.
 */
@Repository
public class MySqlOrderDao extends TemplateDaoImpl<Order> implements OrderDao{
    @SuppressWarnings("unchecked")
    public List<Order> getOrdersByUSer(User user, int startIndex, int size) {

        DetachedCriteria criteria = DetachedCriteria.forClass(clazz);

        criteria.add(Restrictions.eq("user", user));

        criteria.addOrder(org.hibernate.criterion.Order.desc("orderedDate"));

        List<Order> orderList = (List<Order>) hibernateTemplate.findByCriteria(criteria, startIndex, size);

        return orderList;
    }

    @SuppressWarnings("unchecked")
    public Order getOrderByIdAndUser(String id, User user) {

        DetachedCriteria criteria = DetachedCriteria.forClass(clazz);

        criteria.add(Restrictions.eq("id", id));

        criteria.add(Restrictions.eq("user", user));

        List<Order> orderList = (List<Order>) hibernateTemplate.findByCriteria(criteria);

        if(orderList.size() > 0)
        {
            Order order = orderList.get(0);

            Hibernate.initialize(order.getMovies());

            return order;
        }
        else {
            return null;
        }
    }
}
