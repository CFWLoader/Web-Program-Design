package team.cfw.oms.base.controller;

import javafx.util.Pair;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import team.cfw.oms.base.entity.Movie;
import team.cfw.oms.base.entity.User;
import team.cfw.oms.base.service.CacheDataManageService;
import team.cfw.oms.base.util.AppContext;
import team.cfw.oms.business.entity.Cart;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created by CFWLoader on 10/31/16.
 */
@Controller
@RequestMapping("")
public class HomePageController {

    @Resource
    private CacheDataManageService cacheDataManageService;

    @RequestMapping("/index")
    String indexPage(Map<String, Object> models, HttpSession session)
    {
        List<Movie> movieList = cacheDataManageService.getColumnByColumnName("movieColumn", Movie.class);

        Cart cart = AppContext.getCart(session);

        models.put("movieColumn", movieList);

        models.put("itemCount", cart.getItemList().size());

        return "index";
    }

    @RequestMapping("/basket")
    String basketPage(String action, String targetId, Map<String, Object> models, HttpSession session)
    {
        if(action == null || action.trim().equals(""))
        {
            action = "view";
        }

        Cart cart = AppContext.getCart(session);

        if(action.equals("add") && targetId != null && !targetId.trim().equals(""))
        {
            Integer newValue = 1;

            Pair<String, Integer> target = null;

            for(Pair<String, Integer> pair : cart.getItemList())
            {
                if(pair.getKey().equals(targetId))
                {
                    target = pair;

                    newValue = pair.getValue() + newValue;

                    break;
                }
            }

            if(target == null)
            {
                cart.addItemToCart(targetId, newValue);
            }
            else
            {
                cart.removeItemFromCart(targetId);

                cart.addItemToCart(targetId, newValue);
            }

        }

        models.put("itemList", cart.getItemList());

        models.put("itemCount", cart.getItemList().size());

        return "basket";
    }

}
