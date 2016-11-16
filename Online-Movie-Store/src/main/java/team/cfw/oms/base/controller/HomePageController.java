package team.cfw.oms.base.controller;

import javafx.util.Pair;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import team.cfw.oms.base.entity.Movie;
import team.cfw.oms.base.service.CacheDataManageService;
import team.cfw.oms.base.service.MovieService;
import team.cfw.oms.base.util.AppContext;
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
    String indexPage(Map<String, Object> models, HttpSession session)
    {
        List<Movie> movieList = cacheDataManageService.getColumnByColumnName("movieColumn", Movie.class);

        Cart cart = AppContext.getCart(session);

        models.put("movieColumn", movieList);

        models.put("itemCount", cart.getItemList().size());

        return "index";
    }

    @RequestMapping(value = "/basket", method = RequestMethod.GET)
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
    String searchPage(String keyword, Map<String, Object> models, HttpSession session)
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
}
