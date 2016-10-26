package team.cfw.oms.base.dao.impl;

import org.springframework.stereotype.Repository;
import team.cfw.oms.base.dao.UserDao;
import team.cfw.oms.base.entity.User;

/**
 * Created by CFWLoader on 10/26/16.
 */
@Repository
public class MySqlUserDao extends TemplateDaoImpl<User> implements UserDao {
}
