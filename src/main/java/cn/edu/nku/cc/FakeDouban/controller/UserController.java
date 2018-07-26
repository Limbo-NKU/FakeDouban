package cn.edu.nku.cc.FakeDouban.controller;

import java.io.IOException;

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

import cn.edu.nku.cc.FakeDouban.biz.UserBiz;
import cn.edu.nku.cc.FakeDouban.domain.po.User;

@Controller
@RequestMapping("/user")
public class UserController{
    @Autowired
    private UserBiz userBiz;

    @RequestMapping(value="/login",method=RequestMethod.POST)
    public ModelAndView login(HttpServletRequest request,HttpServletResponse response){
        String userName=request.getParameter("username");
        String password=request.getParameter("password");
        User user=userBiz.findByNameAndPwd(userName, password);
        
        ModelAndView mView=new ModelAndView();
        if(user==null){
            mView.addObject("error", "用户名或密码错误");
            mView.setViewName("login");            
        }else{
            HttpSession session=request.getSession();
            session.setAttribute("userSession", user);
            mView.setViewName("index");
        }
        return mView;
    }

    @RequestMapping()
    @ResponseBody
    public User register(HttpServletRequest request,HttpServletResponse response){
        
        String userName=request.getParameter("username");
        String password=request.getParameter("password");
        Integer age=Integer.parseInt(request.getParameter("age"));
        String gender=request.getParameter("gender");
        String city=request.getParameter("city");
        String job=request.getParameter("job");
        String description=request.getParameter("description");
        User user=new User(userName, password, gender, age, city, job, description);
        user=userBiz.insertUser(user);
        if(user!=null){
            HttpSession session=request.getSession();
            session.setAttribute("userSession", user);
            return user;
        }else{
            return null;
        }
    }

    @RequestMapping("/userDetail/{id}")
    public ModelAndView getUserDetail(@PathVariable("id") int id,
    HttpServletRequest request,HttpServletResponse response){
      
        User user=userBiz.findById(id);
        if(user==null){
            try {
				response.sendRedirect("../error.html");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            return null;
        }else{
            ModelAndView mView=new ModelAndView();
            mView.addObject("user", user);
            mView.setViewName("userdetail");
            return mView;
        }
    }

    @RequestMapping("/userDetail")
    public ModelAndView getCurrentUserDetail(
    HttpServletRequest request,HttpServletResponse response){
        
        HttpSession session=request.getSession();
        User userSession=(User) session.getAttribute("userSession");
        Integer id=userSession.getId();
        
        User user=userBiz.findById(id);
        if(user==null){
            try {
				response.sendRedirect("../error.html");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            return null;
        }else{
            ModelAndView mView=new ModelAndView();
            mView.addObject("user", user);
            mView.setViewName("userdetail");
            return mView;
        }
    }

    @RequestMapping(value="/modify",method=RequestMethod.POST)
    @ResponseBody
    public User modifyUser(HttpServletRequest request,HttpServletResponse response){
        
        HttpSession session=request.getSession();
        Integer age=Integer.parseInt(request.getParameter("age"));
        String gender=request.getParameter("gender");
        String city=request.getParameter("city");
        String job=request.getParameter("job");
        String description=request.getParameter("description");
        User user=(User) session.getAttribute("userSession");
        user.setAge(age);
        user.setGender(gender);
        user.setCity(city);
        user.setJob(job);
        user.setDescription(description);
        user=userBiz.modifyUser(user);
        session.invalidate();
        session.setAttribute("userSession", user);
        return user;
    }
}