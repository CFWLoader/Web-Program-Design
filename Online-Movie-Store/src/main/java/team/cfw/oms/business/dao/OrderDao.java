package team.cfw.oms.business.dao;

import team.cfw.oms.base.dao.TemplateDao;
import team.cfw.oms.base.entity.User;
import team.cfw.oms.business.entity.Order;

import java.util.List;

/**
 * Created by CFWLoader on 10/26/16.
 */
public interface OrderDao extends TemplateDao<Order> {
    List<Order> getOrdersByUSer(User user, int startIndex, int size);

    Order getOrderByIdAndUser(String id, User user);

}
