package team.cfw.oms.base.dao;

import team.cfw.oms.base.entity.User;

/**
 * Created by CFWLoader on 10/26/16.
 */
public interface UserDao extends TemplateDao<User> {
    User getUserByUsername(String username);
}
