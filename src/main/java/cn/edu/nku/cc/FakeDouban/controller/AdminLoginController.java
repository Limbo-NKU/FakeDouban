package cn.edu.nku.cc.FakeDouban.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.nku.cc.FakeDouban.biz.AdminBiz;
import cn.edu.nku.cc.FakeDouban.biz.MovieBiz;
import cn.edu.nku.cc.FakeDouban.biz.UserBiz;
import cn.edu.nku.cc.FakeDouban.domain.po.Administer;
import cn.edu.nku.cc.FakeDouban.domain.po.Movie;
import cn.edu.nku.cc.FakeDouban.domain.po.User;

@Controller
@RequestMapping("/admin")
public class AdminLoginController{
    @Autowired
    private AdminBiz adminBiz;
    @Autowired
    private UserBiz userBiz;
    @Autowired
    private MovieBiz movieBiz;

    @RequestMapping("")
    public ModelAndView index(HttpServletRequest request) {
		ModelAndView mView=new ModelAndView();
		Administer administer=(Administer) request.getSession().getAttribute("adminSession");
		if(administer==null) {
			mView.setViewName("AD-login");
			return mView;
		}else {
			List<User> users=userBiz.findAll();
			mView.addObject("users", users);
			List<Movie> movies=movieBiz.getAllMovies();
			mView.addObject("movies", movies);
			mView.setViewName("AD-index");
			return mView;
		}
	}
    
    @RequestMapping(value="/login",method=RequestMethod.POST)
    public ModelAndView login(HttpServletRequest request,HttpServletResponse response) throws IOException{
        String adminName=request.getParameter("username");
        String password=request.getParameter("password");
        Administer administer=adminBiz.findByNameAndPwd(adminName,password);
        if(administer!=null){
            HttpSession session=request.getSession();
            session.setAttribute("adminSession", administer);
//            List<User> users=userBiz.findAll();
//            return new ModelAndView("AD-index");
            response.sendRedirect("/FakeDouban/admin");
            return null;
        }else{
            return new ModelAndView("AD-login", "status", "用户名或密码错误，请重试");
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request,HttpServletResponse response){
        HttpSession session=request.getSession();
        session.invalidate();
        return "AD-login";
    }
}