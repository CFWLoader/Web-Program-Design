package team.cfw.oms.business.dao.impl;

import org.springframework.stereotype.Repository;
import team.cfw.oms.base.dao.impl.TemplateDaoImpl;
import team.cfw.oms.business.dao.OrderDao;
import team.cfw.oms.business.entity.Order;

/**
 * Created by CFWLoader on 10/26/16.
 */
@Repository
public class MySqlOrderDao extends TemplateDaoImpl<Order> implements OrderDao{
}
