package team.cfw.oms.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import team.cfw.oms.base.entity.Movie;
import team.cfw.oms.base.service.CacheDataManageService;
import team.cfw.oms.base.service.MovieService;

import javax.annotation.Resource;
import java.util.Map;

/**
 * Created by CFWLoader on 10/26/16.
 */
@Controller
@RequestMapping("/movie")
public class MovieController {

    @Resource
    private MovieService movieService;

    @Resource
    private CacheDataManageService cacheDataManageService;

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String movieDetailPage(String id, Map<String, Object> models)
    {
        Movie movie = movieService.getMovieByMovieId(id);

        models.put("movie", movie);

        return "movie/detail";
    }

}
