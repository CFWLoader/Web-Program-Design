package team.cfw.oms.business.service;

import javax.servlet.http.HttpSession;

/**
 * Created by CFWLoader on 10/26/16.
 */
public interface OrderService {
    boolean handleAddOrderBusiness(HttpSession session);
}
