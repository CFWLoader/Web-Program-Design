package team.cfw.oms.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import team.cfw.oms.base.entity.Movie;
import team.cfw.oms.base.entity.User;
import team.cfw.oms.base.service.CacheDataManageService;

import javax.annotation.Resource;
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
    String indexPage(Map<String, Object> models)
    {
        List<Movie> movieList = cacheDataManageService.getColumnByColumnName("movieColumn", Movie.class);

        models.put("movieColumn", movieList);

        return "index";
    }
}
