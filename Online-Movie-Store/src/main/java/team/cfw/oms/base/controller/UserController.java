package team.cfw.oms.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import team.cfw.oms.base.entity.User;
import team.cfw.oms.base.service.UserService;
import team.cfw.oms.base.util.AppContext;
import team.cfw.oms.business.service.OrderService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
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

    @Resource
    private OrderService orderService;

    @RequestMapping("/registerPage")
    public String registerPage() {
        return "user/registerPage";
    }

    @RequestMapping("/doRegister")
    public String doRegister(String email, String password1, String phoneNumber, String address) {
        User user = new User();

        if(phoneNumber == null)
        {
            phoneNumber = "";
        }

        if(address == null)
        {
            address = "";
        }

        user.setUsername(email);
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

    @RequestMapping("/checkUsernameExistence")
    public @ResponseBody Map<String, String> checkUsernameExistence(String username)
    {
        System.out.println(username);

        Map<String, String> hashMap = new HashMap<String, String>();

        boolean isExisted = userService.checkUsernameExistence(username);

        if(isExisted)
        {
            hashMap.put("result", "existed");
        }
        else
        {
            hashMap.put("result", "notExited");
        }

        // System.out.println(hashMap.get("result"));

        return hashMap;
    }

    @RequestMapping("/login")
    public String doLogin(String username, String password, HttpSession session, Map<String, Object> models)
    {
        User user = userService.login(username, password);

        if(user != null)
        {
            session.setAttribute("user", user);

            models.put("orderList", orderService.getOrdersByUser(user, 0, 10));
        }

        return "user/customer-orders";
    }

    @RequestMapping("/customer-orders")
    public String customerOrdersPage(HttpSession session, Map<String, Object> models)
    {
        User user = (User) session.getAttribute("user");

        if(user == null)
        {
            return "redirect:" + AppContext.getBaseUrl() + "/index";
        }

        models.put("orderList", orderService.getOrdersByUser(user, 0, 10));

        return "user/customer-orders";
    }
}
