package team.cfw.oms.business.service.impl;

import org.springframework.stereotype.Service;
import team.cfw.oms.base.entity.Movie;
import team.cfw.oms.base.entity.User;
import team.cfw.oms.base.util.AppContext;
import team.cfw.oms.business.dao.OrderDao;
import team.cfw.oms.business.entity.Order;
import team.cfw.oms.business.entity.trans.Cart;
import team.cfw.oms.business.entity.trans.Triple;
import team.cfw.oms.business.service.OrderService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;

/**
 * Created by CFWLoader on 10/26/16.
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Resource
    private OrderDao orderDao;


    @Transactional
    public boolean handleAddOrderBusiness(HttpSession session) {

        Cart cart = AppContext.getCart(session);

        Order order = (Order) session.getAttribute("order");

        User user = (User) session.getAttribute("user");

        if(cart.getItemList().size() < 1 || order == null)
        {
            return false;
        }

        double totalFee = 0.0;

        for(Triple<String, Integer, Movie> triple : cart.getItemList())
        {
            order.getMovies().add(triple.getZ());

            totalFee += triple.getY() * triple.getZ().getPrice();
        }

        order.setOrderedDate(new Date(System.currentTimeMillis()));

        order.setUser(user);

        order.setTotalFee(totalFee);

        String uuid = (String) orderDao.addEntity(order);

        if(!uuid.equals(order.getId()))
        {
            return false;
        }

        session.setAttribute("order", null);

        cart.getItemList().clear();

        return true;
    }

    public List<Order> getOrdersByUser(User user, int startIndex, int size) {
        return orderDao.getOrdersByUSer(user, startIndex, size);
    }

    @Transactional
    public Order getOrderByUser(String id, User user) {
        return orderDao.getOrderByIdAndUser(id, user);
    }
}
