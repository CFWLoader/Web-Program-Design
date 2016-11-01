package team.cfw.oms.base.service.impl;

import org.springframework.stereotype.Service;
import team.cfw.oms.base.dao.UserDao;
import team.cfw.oms.base.entity.User;
import team.cfw.oms.base.service.UserService;

import javax.annotation.Resource;
import javax.transaction.Transactional;

/**
 * Created by CFWLoader on 10/26/16.
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    @Transactional
    public boolean addNewUser(User user) {

        String uuid = (String) userDao.addEntity(user);

        if(!uuid.equals(user.getId()))
        {
            return false;
        }

        return true;
    }
}
