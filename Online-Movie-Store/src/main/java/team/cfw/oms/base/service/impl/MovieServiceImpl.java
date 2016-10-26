package team.cfw.oms.base.service.impl;

import org.springframework.stereotype.Service;
import team.cfw.oms.base.dao.MovieDao;
import team.cfw.oms.base.service.MovieService;

import javax.annotation.Resource;

/**
 * Created by CFWLoader on 10/26/16.
 */
@Service
public class MovieServiceImpl implements MovieService {

    @Resource
    private MovieDao movieDao;


}
