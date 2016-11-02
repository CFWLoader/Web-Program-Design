package team.cfw.oms.base.dao.impl;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import team.cfw.oms.base.dao.UserDao;
import team.cfw.oms.base.entity.User;

import java.util.List;

/**
 * Created by CFWLoader on 10/26/16.
 */
@Repository
public class MySqlUserDao extends TemplateDaoImpl<User> implements UserDao {
    public User getUserByUsername(String username) {

        DetachedCriteria criteria = DetachedCriteria.forClass(User.class);

        criteria.add(Restrictions.eq("username", username));

        @SuppressWarnings("unchecked")
        List<User> userList = (List<User>) hibernateTemplate.findByCriteria(criteria);

        if(userList.size() < 1)
        {
            return null;
        }
        else
        {
            return userList.get(0);
        }

    }
}
