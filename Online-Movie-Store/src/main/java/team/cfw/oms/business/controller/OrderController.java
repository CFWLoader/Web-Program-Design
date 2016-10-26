package team.cfw.oms.business.controller;

import org.springframework.stereotype.Controller;
import team.cfw.oms.business.service.OrderService;

import javax.annotation.Resource;

/**
 * Created by CFWLoader on 10/26/16.
 */
@Controller
public class OrderController {

    @Resource
    private OrderService orderService;

}
