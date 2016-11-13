package team.cfw.oms.base.service;

import team.cfw.oms.base.entity.User;

/**
 * Created by CFWLoader on 10/25/16.
 */
public interface UserService {

    boolean addNewUser(User user);

    boolean checkUsernameExistence(String username);

    User login(String username, String password);
}
