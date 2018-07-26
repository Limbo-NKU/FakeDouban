package cn.edu.nku.cc.FakeDouban.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.nku.cc.FakeDouban.biz.LoginBiz;
import cn.edu.nku.cc.FakeDouban.domain.po.User;

@Controller
@RequestMapping("")
public class LoginController{
    @Autowired
    private LoginBiz loginBiz;

    @RequestMapping(value="/login",method=RequestMethod.POST)
    public ModelAndView login(HttpServletRequest request,HttpServletResponse response){
        String userName=request.getParameter("username");
        String password=request.getParameter("password");
        User user=loginBiz.login(userName,password);
        if(user!=null){
            HttpSession session=request.getSession();
            session.setAttribute("userSession", user);
            return new ModelAndView("main");
        }else{
            return new ModelAndView("login", "error", "用户名或密码错误，请检查后重试");
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request,HttpServletResponse response){
        HttpSession session=request.getSession();
        session.invalidate();
        return "login";
    }
}