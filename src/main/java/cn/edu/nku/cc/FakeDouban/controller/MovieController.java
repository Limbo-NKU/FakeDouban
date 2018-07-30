package cn.edu.nku.cc.FakeDouban.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.nku.cc.FakeDouban.biz.MovieBiz;
import cn.edu.nku.cc.FakeDouban.domain.po.LongReview;
import cn.edu.nku.cc.FakeDouban.domain.po.Movie;
import cn.edu.nku.cc.FakeDouban.domain.po.SimpleReview;
import cn.edu.nku.cc.FakeDouban.domain.po.User;
@Controller
@RequestMapping("/movie")
public class MovieController{
    @Autowired
    private MovieBiz movieBiz;

    @RequestMapping("")
    public ModelAndView index(){
        List<Movie> hotMovies=movieBiz.getHotMovies();
        List<Movie> newMovies=movieBiz.getNewMovies();
        Map<String,Object> resultMap=new HashMap<String,Object>();
        resultMap.put("hotMovies",hotMovies);
        resultMap.put("newMovies", newMovies);
        ModelAndView mView = new ModelAndView();
        mView.addAllObjects(resultMap);
        mView.setViewName("index");
        return mView;
    }

    @RequestMapping("/all")
    public ModelAndView getAllMovies(){
        List<Movie> movies=movieBiz.getAllMovies();
        ModelAndView mView=new ModelAndView();
        mView.addObject("movies", movies);
        mView.setViewName("movielist");
        return mView;
    }

    @RequestMapping("/findMovies")
    public ModelAndView findMovieByName(HttpServletRequest request){
        String movieName=request.getParameter("movieName");
        List<Movie> movies= movieBiz.findByName(movieName);
        ModelAndView mView=new ModelAndView();
        mView.addObject("movies", movies);
        mView.setViewName("movielist");
        return mView;
    }

    @RequestMapping("/detail")
    public ModelAndView getMovieDetail(HttpServletRequest request){
        Integer movieId=Integer.parseInt(request.getParameter("movieid"));
        Movie movie=movieBiz.findById(movieId);
        List<SimpleReview> simpleReviews=movieBiz.findSRByMovieId(movieId);
        List<LongReview> longReviews=movieBiz.findLRByMovieId(movieId);
        Map<String,Object> resultMap=new HashMap<String,Object>();
        resultMap.put("movie", movie);
        resultMap.put("simplereviews", simpleReviews);
        resultMap.put("longreviews", longReviews);
        ModelAndView mView= new ModelAndView();
        mView.addAllObjects(resultMap);
        mView.setViewName("single");
        return mView;

    }

    @RequestMapping(value="/simpleReview",method=RequestMethod.POST)
    @ResponseBody
    public SimpleReview postSimpleReview(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user=(User) session.getAttribute("userSession");
        
        Integer movieId=Integer.parseInt(request.getParameter("movieid"));
        Integer rank=Integer.parseInt(request.getParameter("rank"));
        String description=request.getParameter("description");
        return movieBiz.setNewSimpleReview(user,movieId,rank,description);

    }
    @RequestMapping(value="/longReview",method=RequestMethod.POST)
    @ResponseBody
    public LongReview postLongReview(HttpServletRequest request,HttpServletResponse response) throws IOException{
        HttpSession session=request.getSession();
        User user=(User) session.getAttribute("userSession");
        if(user.getLevel()==null){
            response.sendRedirect("/not-a-reviewer.html");
            return null;
        }else{
            // Integer reviewerId=user.getId();
            Integer movieId=Integer.parseInt(request.getParameter("movieId"));
            Integer rank=Integer.parseInt(request.getParameter("rank"));
            String title=request.getParameter("title");
            String content=request.getParameter("content");
            return movieBiz.setNewLongReview(user,movieId,rank,title,content);
        }
    }

//    @RequestMapping("/viewSimpleReviews")
//    public ModelAndView getSimpleReviews(HttpServletRequest request){
//        Integer movieId=Integer.parseInt(request.getParameter("movieId"));
//        List<SimpleReview> simpleReviews=movieBiz.findSRByMovieId(movieId);
//        ModelAndView mView=new ModelAndView();
//        mView.addObject("simpleReviews", simpleReviews);
//        mView.setViewName("srlist");
//        return mView;
//    }

    @RequestMapping("viewLongReviews")
    public ModelAndView getLongReviews(HttpServletRequest request){
        Integer movieId=Integer.parseInt(request.getParameter("movieId"));
        List<LongReview> longReviews=movieBiz.findLRByMovieId(movieId);
        ModelAndView mView=new ModelAndView();
        mView.addObject("longReviews", longReviews);
        mView.setViewName("lrlist");
        return mView;
    }
}