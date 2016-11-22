package team.cfw.oms.business.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import team.cfw.oms.base.entity.User;
import team.cfw.oms.base.util.AppContext;
import team.cfw.oms.business.entity.Order;
import team.cfw.oms.business.service.OrderService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by CFWLoader on 10/26/16.
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    @Resource
    private OrderService orderService;

    @RequestMapping("/customer-orders")
    public String customerOrders(String action, HttpSession session, Map<String, Object> models)
    {
        User user = (User) session.getAttribute("user");

        if(user == null)
        {
            return "redirect:" + AppContext.getBaseUrl() + "/index";
        }

        if(action == null || !action.trim().equals("add"))
        {
            action = "view";
        }

        if(action.trim().equals("add"))
        {
            boolean result = orderService.handleAddOrderBusiness(session);

            if(!result)
            {
                models.put("errorMessage", "Transaction failed.");

                return "errorPage";
            }
        }

        List<Order> orderList = orderService.getOrdersByUser(user, 0, 10);

        models.put("orderList", orderList);

        models.put("itemCount", AppContext.getCart(session).getItemList().size());

        return "user/customer-orders";
    }

    @RequestMapping(value = "customer-order", method = RequestMethod.GET)
    public String customerOrder(String id, HttpSession session, Map<String, Object> models)
    {
        User user = (User) session.getAttribute("user");

        if(user == null)
        {
            return "redirect:" + AppContext.getBaseUrl() + "/index";
        }

        Order order = orderService.getOrderByUser(id, user);

        models.put("order", order);

        models.put("itemCount", AppContext.getCart(session).getItemList().size());

        return "user/customer-order";
    }
}
