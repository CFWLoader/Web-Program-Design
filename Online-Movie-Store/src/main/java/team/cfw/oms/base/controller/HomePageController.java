package team.cfw.oms.base.controller;

import javafx.util.Pair;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import team.cfw.oms.base.entity.Movie;
import team.cfw.oms.base.entity.User;
import team.cfw.oms.base.service.CacheDataManageService;
import team.cfw.oms.base.service.MovieService;
import team.cfw.oms.base.util.AppContext;
import team.cfw.oms.business.entity.Order;
import team.cfw.oms.business.entity.trans.Cart;
import team.cfw.oms.business.entity.trans.Triple;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane;
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

    @Resource
    private MovieService movieService;

    @RequestMapping("/index")
    public String indexPage(Map<String, Object> models, HttpSession session)
    {
        List<Movie> movieList = cacheDataManageService.getColumnByColumnName("movieColumn", Movie.class);

        Cart cart = AppContext.getCart(session);

        models.put("movieColumn", movieList);

        models.put("itemCount", cart.getItemList().size());

        return "index";
    }

    @RequestMapping(value = "/basket", method = RequestMethod.GET)
    public String basketPage(String action, String targetId, Map<String, Object> models, HttpSession session)
    {
        if(action == null || action.trim().equals(""))
        {
            action = "view";
        }

        Cart cart = AppContext.getCart(session);

        if(action.equals("add") && targetId != null && !targetId.trim().equals(""))
        {
            Integer newValue = 1;

            Movie theMovie = null;

            Triple<String, Integer, Movie> target = null;

            for(Triple<String, Integer, Movie> triple : cart.getItemList())
            {
                if(triple.getX().equals(targetId))
                {
                    target = triple;

                    newValue = triple.getY() + newValue;

                    theMovie = triple.getZ();

                    break;
                }
            }

            if(target == null)
            {
                for(Movie movie : cacheDataManageService.getColumnByColumnName("movieColumn", Movie.class))
                {
                    if(movie.getId().equals(targetId))
                    {
                        theMovie = movie;

                        break;
                    }
                }

                cart.addItemToCart(targetId, newValue,
                        theMovie == null ? movieService.getMovieByMovieId(targetId) : theMovie);
            }
            else
            {
                cart.removeItemFromCart(targetId);

                cart.addItemToCart(targetId, newValue, theMovie);
            }

        }
        else if(action.equals("delete") && targetId != null && !targetId.trim().equals(""))
        {
            cart.removeItemFromCart(targetId);
        }

        models.put("itemList", cart.getItemList());

        models.put("itemCount", cart.getItemList().size());

        if(action.equals("view"))
        {
            return "basket";
        }
        else {
            return "redirect:" + AppContext.getBaseUrl() + "/basket?action=view";
        }
    }

    @RequestMapping(value = "/searchPage", method = RequestMethod.POST)
    public String searchPage(String keyword, Map<String, Object> models, HttpSession session)
    {
        if(keyword == null)
        {
            keyword = "";
        }

        List<Movie> movieList = movieService.searchMovieByKeywords(keyword);

        models.put("searchedMovie", movieList);

        models.put("itemCount", AppContext.getCart(session).getItemList().size());

        return "searchPage";
    }

    @RequestMapping(value = "/checkout1", method = RequestMethod.POST)
    public String checkout1Page(Map<String, Object> models, HttpSession session)
    {
        User user = (User) session.getAttribute("user");

        models.put("phoneNumber", user == null ? "" : user.getPhoneNumber());

        models.put("address", user == null ? "" : user.getAddress());

        return "checkout1";
    }

    @RequestMapping(value = "/checkout2", method = RequestMethod.POST)
    public String checkout2Page(String firstname, String lastname, String address, String phoneNumber, String email,
                         Map<String, Object> models, HttpSession session)
    {
        String result = this.validateTheFormParameters(firstname, lastname, address, phoneNumber, email);

        if(!result.equals("OK"))
        {
            models.put("errorMessage", result);

            return "errorPage";
        }

        Order order = new Order();

        order.setReceiverFirstName(firstname);
        order.setReceiverLastName(lastname);
        order.setReceiverAddress(address);
        order.setReceiverPhoneNumber(phoneNumber);
        order.setReceiverEmail(email);

        session.setAttribute("order", order);

        return "checkout2";
    }

    private String validateTheFormParameters(String firstname, String lastname, String address, String phoneNumber, String email) {

        if(firstname == null || firstname.trim().equals(""))
        {
            return "Invalid info: firstname.";
        }

        if(lastname == null || lastname.trim().equals(""))
        {
            return "Invalid info: lastname.";
        }

        if(address == null || address.trim().equals(""))
        {
            return "Invalid info: address.";
        }

        if(phoneNumber == null || phoneNumber.trim().equals(""))
        {
            return "Invalid info: phone number.";
        }

        if(email == null || email.trim().equals(""))
        {
            return "Invalid info: email.";
        }

        return "OK";
    }

}
