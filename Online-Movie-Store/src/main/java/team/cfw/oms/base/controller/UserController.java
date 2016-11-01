package team.cfw.oms.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import team.cfw.oms.base.entity.User;
import team.cfw.oms.base.service.UserService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by CFWLoader on 10/26/16.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    @RequestMapping("registerPage")
    public String registerPage() {
        return "user/registerPage";
    }

    @RequestMapping("doRegister")
    public String doRegister(String username, String password1, String phoneNumber, String address) {
        User user = new User();

        user.setUsername(username);
        user.setPassword(password1);
        user.setPhoneNumber(phoneNumber);
        user.setAddress(address);

        boolean result = userService.addNewUser(user);

        if (result) {
            return "user/successfulPage";
        } else {
            return "user/faultPage";
        }
    }

    @RequestMapping("/checkUsernameExistance")
    public @ResponseBody Map<String, String> checkUsernameExistance(String username)
    {
        Map<String, String> hashMap = new HashMap<String, String>();

        return hashMap;
    }
}
