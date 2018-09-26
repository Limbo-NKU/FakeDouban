package cn.edu.nku.cc.FakeDouban.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.nku.cc.FakeDouban.biz.MovieBiz;
import cn.edu.nku.cc.FakeDouban.domain.po.LongReview;
import cn.edu.nku.cc.FakeDouban.domain.po.Movie;
import cn.edu.nku.cc.FakeDouban.domain.po.MovieTag;
import cn.edu.nku.cc.FakeDouban.domain.po.SimpleReview;
import cn.edu.nku.cc.FakeDouban.domain.po.User;

@Controller
@RequestMapping("/movie")
public class MovieController {
    @Autowired
    private MovieBiz movieBiz;
//填充首页内容
    @RequestMapping("/index")
    public ModelAndView index() {
        List<Movie> hotMovies = movieBiz.getHotMovies();
        List<Movie> newMovies = movieBiz.getNewMovies();
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("hotmovies", hotMovies);
        resultMap.put("newmovies", newMovies);
        ModelAndView mView = new ModelAndView();
        mView.addAllObjects(resultMap);
        mView.setViewName("index");
        return mView;
    }
//电影列表页（全部电影）
    @RequestMapping("/all")
    public ModelAndView getAllMovies() {
        List<Movie> movies = movieBiz.getAllMovies();
        ModelAndView mView = new ModelAndView();
        mView.addObject("movies", movies);
        mView.setViewName("movielist");
        return mView;
    }
    
//    @RequestMapping("/all")
//    public ModelAndView getAllMovies(@RequestParam(value="pn", defaultValue="1")Integer pn,HttpServletRequest request) {
//       List<Movie> movies = movieBiz.getAllMovies();
//        ModelAndView mView = new ModelAndView();
//        mView.addObject("movies", movies);
//        mView.setViewName("movielist");
//        PageHelper.startPage(pn, 5);
//        PageInfo movie=new PageInfo(movies,5);
//        mView.addObject("movies",movies);
//        return mView;
//    }

    
//电影列表页（根据名称模糊查询）
    @RequestMapping("/findmovies")
    public ModelAndView findMovieByName(HttpServletRequest request) {
        String movieName = request.getParameter("moviename");
        List<Movie> movies = movieBiz.findByName(movieName);
        ModelAndView mView = new ModelAndView();
        mView.addObject("movies", movies);
        mView.setViewName("movielist");
        return mView;
    }
//电影详情页（根据id精确查询）
    @RequestMapping("/detail")
    public ModelAndView getMovieDetail(HttpServletRequest request) {
        Integer movieId = Integer.parseInt(request.getParameter("movieid"));
        Movie movie = movieBiz.findById(movieId);
        List<SimpleReview> simpleReviews = movieBiz.findSRByMovieId(movieId);
        List<LongReview> longReviews = movieBiz.findLRByMovieId(movieId);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("movie", movie);
        resultMap.put("simplereviews", simpleReviews);
        resultMap.put("longreviews", longReviews);
        ModelAndView mView = new ModelAndView();
        mView.addAllObjects(resultMap);
        mView.setViewName("single");
        return mView;

    }
//
    @RequestMapping("/addlongreview")
    public ModelAndView insertlongreview(HttpServletRequest request) {
    	Integer movieid=Integer.parseInt(request.getParameter("movieid"));
    	Movie movie=movieBiz.findById(movieid);
    	ModelAndView mView =new ModelAndView();
    	mView.addObject("movie", movie);
    	mView.setViewName("addlongreview");
    	return mView;
    	
    }

//新建短评
    @RequestMapping(value = "/simplereview", method = RequestMethod.POST)
    public void postSimpleReview(HttpServletRequest request,HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userSession");

        Integer movieId = Integer.parseInt(request.getParameter("movieid"));
        Integer rank = Integer.parseInt(request.getParameter("rank"));
        String review = request.getParameter("review");
        if(movieBiz.setNewSimpleReview(user, movieId, rank, review)>0) {
        	response.sendRedirect("/FakeDouban/movie/detail?movieid="+movieId.toString());
        }else {
        	response.sendRedirect("/FakeDouban/error.html");
        }
//        return movieBiz.setNewSimpleReview(user, movieId, rank, review);

    }
//新建长评
    @RequestMapping(value = "/longreview", method = RequestMethod.POST)
//    @ResponseBody
    public ModelAndView postLongReview(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userSession");
        if (user.getLevel() == null) {
//            response.sendRedirect("/.html");
        	return new ModelAndView("addlongreview","status","非评论员用户！！！");
        } else {
            // Integer reviewerId=user.getId();
            Integer movieId = Integer.parseInt(request.getParameter("movieid"));
            Integer rank = Integer.parseInt(request.getParameter("rank"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            if(movieBiz.setNewLongReview(user, movieId, rank, title, content)!=0) {
//            	return new ModelAndView("detail")
            	response.sendRedirect("/FakeDouban/movie/detail?movieid="+movieId.toString());
            	return null;
            }else {
            	return new ModelAndView("addlongreview","status","创建失败");
            }
//            return movieBiz.setNewLongReview(user, movieId, rank, title, content);
        }
    }

    // @RequestMapping("/viewSimpleReviews")
    // public ModelAndView getSimpleReviews(HttpServletRequest request){
    // Integer movieId=Integer.parseInt(request.getParameter("movieId"));
    // List<SimpleReview> simpleReviews=movieBiz.findSRByMovieId(movieId);
    // ModelAndView mView=new ModelAndView();
    // mView.addObject("simpleReviews", simpleReviews);
    // mView.setViewName("srlist");
    // return mView;
    // }
//根据电影id查询全部长评
    @RequestMapping("/viewLongReviews")
    public ModelAndView getLongReviews(HttpServletRequest request) {
        Integer movieId = Integer.parseInt(request.getParameter("movieId"));
        List<LongReview> longReviews = movieBiz.findLRByMovieId(movieId);
        ModelAndView mView = new ModelAndView();
        mView.addObject("longReviews", longReviews);
        mView.setViewName("lrlist");
        return mView;
    }
//--------------
    @RequestMapping(value = "/insertmovie", method = RequestMethod.POST) // 插入电影
//    @ResponseBody
    public ModelAndView insertMovie(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String movieName = request.getParameter("movieName");
        String movieType = request.getParameter("movieType");
        String movieRegion = request.getParameter("movieRegion");
        String str = request.getParameter("moviePrice");
        BigDecimal moviePrice = new BigDecimal(str);
        Date updateDate =Date.valueOf(request.getParameter("updateDate"));
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        sdf.format(updateDate);
        String[] tagidd = request.getParameterValues("tags");
        List<String> tagids = new ArrayList<String>();
        for (String ele : tagidd) {
            tagids.add(ele);
        }

        Movie movie = new Movie(movieName, movieType, movieRegion, tagids, moviePrice,  updateDate);
        movie.setRankCount(null);
        movie.setRanking(null);
//        Map<String, String> resultMap = new HashMap<>();
        int rst = movieBiz.insertmovie(movie);
        if (rst != 0) {
            Movie temp = movieBiz.findByAbsoluteName(movieName);
            Integer movieid = temp.getId();
            for (String tag : tagids) {
                Integer tagid = Integer.parseInt(tag);
                MovieTag movietag = new MovieTag(movieid, tagid);
                movieBiz.insertmovietag(movietag);
            }
//            resultMap.put("status", "success");
             return new ModelAndView("AD-index", "status", "插入成功");
//        	response.sendRedirect("/FakeDouban/admin");
//        	return null;
        	
        } else
             return new ModelAndView("AD-index", "status", "插入失败，请检查电影名称是否与现有电影重复！");
//            resultMap.put("status", "fail");
//        return resultMap;
    }

    @RequestMapping(value="/recmovie/insert",method=RequestMethod.POST)          //插入推荐电影
//    @ResponseBody
    public ModelAndView insertrecmovie(HttpServletRequest request){
        Integer movieId=Integer.parseInt(request.getParameter("movieid"));
        String reason=request.getParameter("reason");
        Integer recommendtype=Integer.parseInt(request.getParameter("recommendtype"));
        Movie movie=movieBiz.findById(movieId);
        Map<String,String> resultMap=new HashMap<>();
        if(movie!=null) {
        	Movie temp=new Movie();
        	temp.setId(movieId);
        	temp.setReason(reason);
        	temp.setRecommendType(recommendtype);
        	int rst=movieBiz.insertrecmovie(temp);
            if(rst!=0)
//                resultMap.put("status", "success");
        		  return new ModelAndView("AD-index", "status", "插入成功");
            else
//                resultMap.put("status", "fail");
        		  return new ModelAndView("AD-index", "status", "插入失败，请检查是否重复插入");
//            return resultMap;
        }else
        
//            resultMap.put("status", "notexist");
        	  return new ModelAndView("AD-index", "status", "电影不存在，插入失败");
//            return resultMap;
    }

    @RequestMapping(value = "/recmovie/delete", method = RequestMethod.POST) // 解除推荐
//    @ResponseBody
    public ModelAndView deleterecmovie(HttpServletRequest request) {
        Integer movieId = Integer.parseInt(request.getParameter("movieid"));
        Map<String, String> resultMap = new HashMap<>();
        int rst = movieBiz.deleterecmovie(movieId);
        if (rst != 0)
//            resultMap.put("status", "删除成功");
         return new ModelAndView("AD-index", "status", "删除成功");
        else
//            resultMap.put("status", "删除失败");
         return new ModelAndView("AD-index", "status", "删除失败");
//        return resultMap;
    }

    @RequestMapping("/viewSimpleReviews")
    public ModelAndView getSimpleReviews(HttpServletRequest request) { // 查所有短评
        List<SimpleReview> simpleReviews = movieBiz.findAllSimpleReview();
        ModelAndView mView = new ModelAndView();
        mView.addObject("simpleReviews", simpleReviews);
        mView.setViewName("srlist");
        return mView;
    }

    @RequestMapping(value = "/viewSimpleReviews/{movieid}", method = RequestMethod.GET) // 根据电影查短评
    public ModelAndView getSimpleReviewsByMovie(HttpServletRequest request,@PathVariable int movieid) {
//        Integer movieId = Integer.parseInt(request.getParameter("movieid"));
        List<SimpleReview> simpleReviews = movieBiz.findSRByMovieId(movieid);
        ModelAndView mView = new ModelAndView();
        mView.addObject("simpleReviews", simpleReviews);
        mView.setViewName("srlist");
        return mView;
    }

    @RequestMapping(value = "/viewSimpleReviews/delete", method = RequestMethod.GET) // 删短评
    public ModelAndView deleteSimpleReviewsByMovie(HttpServletRequest request) {
        Integer simplereviewid = Integer.parseInt(request.getParameter("simplereviewid"));
        Integer rst = movieBiz.deletesimplereview(simplereviewid);
        if (rst != 0)
            return new ModelAndView("movie", "status", "删除成功");
        else
            return new ModelAndView("movie", "status", "删除失败");
    }

//    @RequestMapping("/viewLongReviews")
//    public ModelAndView getLongReviews(HttpServletRequest request) { // 显示所有长评
//        List<LongReview> longReviews = movieBiz.findAllLongReview();
//        ModelAndView mView = new ModelAndView();
//        mView.addObject("longReviews", longReviews);
//        mView.setViewName("lrlist");
//        return mView;
//    }

    @RequestMapping(value = "/viewLongReviews/{movieid}", method = RequestMethod.GET) // 根据电影查长评
    public ModelAndView getLongReviewsByMovie(HttpServletRequest request,@PathVariable int movieid) {
//        Integer movieId = Integer.parseInt(request.getParameter("movieid"));
        List<LongReview> longReviews = movieBiz.findLRByMovieId(movieid);
        ModelAndView mView = new ModelAndView();
        mView.addObject("longReviews", longReviews);
        mView.setViewName("srlist");
        return mView;
    }

    @RequestMapping(value = "/viewLongReviews/delete", method = RequestMethod.GET) // 删长评
    public ModelAndView deleteLongReviewsByMovie(HttpServletRequest request) {
        Integer longreviewid = Integer.parseInt(request.getParameter("longreviewid"));
        Integer rst = movieBiz.deletesimplereview(longreviewid);
        if (rst != 0)
            return new ModelAndView("movie", "status", "删除成功");
        else
            return new ModelAndView("movie", "status", "删除失败");
    }
}