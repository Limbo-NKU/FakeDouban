package cn.edu.nku.cc.FakeDouban.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import cn.edu.nku.cc.FakeDouban.biz.AnalysisBiz;
import cn.edu.nku.cc.FakeDouban.domain.po.Analysis;

@Controller
@RequestMapping("/echarts")
public class EchartsController {
    @Autowired
    AnalysisBiz analysisbiz;

    @RequestMapping(value = "/getmovie",method=RequestMethod.POST)
    @ResponseBody
    public List<Analysis> getmovie(HttpServletRequest request) {
    	int usertype=Integer.parseInt(request.getParameter("usertype"));
    	int usercollection=Integer.parseInt(request.getParameter("usercollection"));
    	int movietype=Integer.parseInt(request.getParameter("movietype"));
        List<Analysis> result = analysisbiz.getAnalysisByUser(usertype,usercollection,movietype);
        return result;
    }

    @RequestMapping(value = "/getuser",method=RequestMethod.POST)
    @ResponseBody
    public List<Analysis> getuser(HttpServletRequest request) {
    	int movietype=Integer.parseInt(request.getParameter("movietype"));
    	int moviecollection=Integer.parseInt(request.getParameter("moviecollection"));
    	int usertype=Integer.parseInt(request.getParameter("usertype"));
    	List<Analysis> result = analysisbiz.getAnalysisByMovie(movietype,moviecollection,usertype);
        return result;
    }
}
