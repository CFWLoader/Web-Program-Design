package team.cfw.oms.business.service.impl;

import org.springframework.stereotype.Service;
import team.cfw.oms.base.util.AppContext;
import team.cfw.oms.business.dao.OrderDao;
import team.cfw.oms.business.entity.Order;
import team.cfw.oms.business.entity.trans.Cart;
import team.cfw.oms.business.service.OrderService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by CFWLoader on 10/26/16.
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Resource
    private OrderDao orderDao;

    public boolean handleAddOrderBusiness(HttpSession session) {

        Cart cart = AppContext.getCart(session);

        Order order = (Order) session.getAttribute("order");

        if(cart.getItemList().size() < 1 || order == null)
        {
            return false;
        }

        return true;
    }
}
