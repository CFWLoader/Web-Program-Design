package team.cfw.oms.business.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import team.cfw.oms.business.service.OrderService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
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
        if(action == null || !action.trim().equals("add"))
        {
            action = "view";
        }

        if(action.trim().equals("add"))
        {
            boolean result = orderService.handleAddOrderBusiness(session);
        }

        return "user/customer-orders";
    }

}
