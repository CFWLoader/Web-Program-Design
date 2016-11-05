package team.cfw.oms.base.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import team.cfw.oms.base.entity.Movie;
import team.cfw.oms.base.service.MovieService;
import team.cfw.oms.business.entity.Order;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashSet;
import java.util.UUID;

/**
 * Created by CFWLoader on 11/5/16.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private MovieService movieService;

    @RequestMapping("")
    public String adminIndex()
    {
        return "admin/index";
    }

    @RequestMapping("addMoviePage")
    public String addMoviePage()
    {
        return "admin/addMoviePage";
    }

    @RequestMapping("doAddMovie")
    public String doAddMovie(HttpServletRequest request, String movieName, String priceStr,
                             @RequestParam(value = "moviePic") MultipartFile moviePic)
    {
        Movie movie = new Movie();

        movie.setMovieName(movieName);

        double price = Double.parseDouble(priceStr);

        movie.setPrice(price);

        String targetDir = request.getServletContext().getRealPath("/resource/images/upload");

        this.saveFile(movie, targetDir, moviePic);

        movie.setLinkAddress("");

        movie.setOrders(new HashSet<Order>());

        movieService.addMovie(movie);

        return "admin/doAddMovie";
    }

    private String saveFile(Movie movie, String dir, MultipartFile file) {
        try {

            byte[] bytes = file.getBytes();

            String filename = file.getOriginalFilename();

            int tempIndex = filename.lastIndexOf(".");

            String temp = filename.substring(tempIndex);

            String sep = System.getProperty("file.separator");

            String uuidName = UUID.randomUUID().toString();

            File dirPath = new File(dir);

            if (!dirPath.exists()) {
                dirPath.mkdirs();
            }

            String path = dir + sep + uuidName + temp;

            System.out.println(path);

            File uploadedFile = new File(path);

            FileCopyUtils.copy(bytes, uploadedFile);

            movie.setPicAddress(uuidName + temp);

        } catch (IOException e) {
            return "Failed";
        }

        return "success";
    }

}
