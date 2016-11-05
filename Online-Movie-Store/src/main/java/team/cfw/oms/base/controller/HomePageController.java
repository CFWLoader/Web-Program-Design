package team.cfw.oms.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import team.cfw.oms.base.entity.User;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created by CFWLoader on 10/31/16.
 */
@Controller
@RequestMapping("")
public class HomePageController {

    @RequestMapping("/index")
    String indexPage()
    {
        return "index";
    }

    @RequestMapping("/test")
    String productsPage(Map<String, Object> models)
    {
        User user = new User();

        user.setId("1"); user.setPassword("1123"); user.setAddress("1233"); user.setUsername("setg"); user.setPhoneNumber("12");

        models.put("tUser", user);

        return "test";
    }
}
