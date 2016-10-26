package team.cfw.oms.business.service.impl;

import org.springframework.stereotype.Service;
import team.cfw.oms.business.dao.OrderDao;
import team.cfw.oms.business.service.OrderService;

import javax.annotation.Resource;

/**
 * Created by CFWLoader on 10/26/16.
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Resource
    private OrderDao orderDao;

}
