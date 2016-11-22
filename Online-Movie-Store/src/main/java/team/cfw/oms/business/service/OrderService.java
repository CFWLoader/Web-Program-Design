package team.cfw.oms.business.service;

import team.cfw.oms.base.entity.User;
import team.cfw.oms.business.entity.Order;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by CFWLoader on 10/26/16.
 */
public interface OrderService {
    boolean handleAddOrderBusiness(HttpSession session);

    List<Order> getOrdersByUser(User user, int startIndex, int size);

    Order getOrderByUser(String id, User user);
}
