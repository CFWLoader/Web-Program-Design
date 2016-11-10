package team.cfw.oms.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    String movieDetailPage(String id, Map<String, Object> models)
    {

        return "movie/detail";
    }

}
