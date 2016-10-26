package team.cfw.oms.base.controller;

import org.springframework.stereotype.Controller;
import team.cfw.oms.base.service.UserService;

import javax.annotation.Resource;

/**
 * Created by CFWLoader on 10/26/16.
 */
@Controller
public class UserController {

    @Resource
    private UserService userService;


}
