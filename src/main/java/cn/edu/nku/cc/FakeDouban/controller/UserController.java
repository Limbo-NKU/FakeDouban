package cn.edu.nku.cc.FakeDouban.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.apache.bcel.generic.RET;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.nku.cc.FakeDouban.biz.AdminBiz;
import cn.edu.nku.cc.FakeDouban.biz.UserBiz;
import cn.edu.nku.cc.FakeDouban.domain.po.User;
import cn.edu.nku.cc.FakeDouban.util.MD5Util;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserBiz userBiz;
    @Autowired
    private AdminBiz adminBiz;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        User user = userBiz.findByNameAndPwd(userName, password);

        ModelAndView mView = new ModelAndView();
        if (user == null) {
            mView.addObject("error", "用户名或密码错误");
            mView.setViewName("login");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("userSession", user);
            mView.setViewName("index");
        }
        return mView;
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    
    public ModelAndView register(HttpServletRequest request, HttpServletResponse response) {

        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        Integer age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String city = request.getParameter("city");
        String job = request.getParameter("job");
        String description = request.getParameter("description");
        password=MD5Util.md5(userName+password);
        User user = new User(userName, password, gender, age, city, job, description);
        user = userBiz.insertUser(user);
        ModelAndView mView=new ModelAndView();
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("userSession", user);
//            return user;
            mView.setViewName("index");
        } else {
//            return null;
        	mView.addObject("error", "用户名已存在，请更改用户名后重试");
        	mView.setViewName("register");
        }
        return mView;
    }

    @RequestMapping("/detail/{id}")
    public ModelAndView getUserDetail(@PathVariable("id") int id, HttpServletRequest request,
            HttpServletResponse response) {

        User user = userBiz.findById(id);
        if (user == null) {
            try {
                response.sendRedirect("/FakeDouban/error.html");
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            return null;
        } else {
//        	return user;
            ModelAndView mView = new ModelAndView();
            mView.addObject("user", user);
            mView.setViewName("userdetail");
            return mView;
        }
    }

    @RequestMapping("/detail")
    
    public ModelAndView getCurrentUserDetail(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        User userSession = (User) session.getAttribute("userSession");
        Integer id = userSession.getId();

        User user = userBiz.findById(id);
        if (user == null) {
            try {
                response.sendRedirect("/FakeDouban/error.html");
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            return null;
        } else {
//        	return user;
            ModelAndView mView = new ModelAndView();
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
    @RequestMapping(value="/admin/modify",method=RequestMethod.POST)
//    @ResponseBody
    public ModelAndView adminModifyUser(HttpServletRequest request,HttpServletResponse response){
        
//        HttpSession session=request.getSession();
    	Integer userid=Integer.parseInt(request.getParameter("userid"));
        String userName=request.getParameter("username");
        Integer age=Integer.parseInt(request.getParameter("age"));
        String gender=request.getParameter("gender");
        String city=request.getParameter("city");
        String job=request.getParameter("job");
        String description=request.getParameter("description");
//        User user=(User) session.getAttribute("userSession");
        User user=userBiz.findById(userid);
//        user.setId(userid);
        user.setUserName(userName);
        user.setAge(age);
        user.setGender(gender);
        user.setCity(city);
        user.setJob(job);
        user.setDescription(description);
        user=userBiz.modifyUser(user);
        if(user!=null) {
        	return new ModelAndView("AD-index","status","修改成功");
        }else {
        	return new ModelAndView("AD-index","status","修改失败，请检查！");
        }
//        session.invalidate();
//        session.setAttribute("userSession", user);
//        return user;
    }

    @RequestMapping("/checkuser")
    @ResponseBody
    public Map<String,String> checkUser(@RequestParam String username){
        Map<String,String> resultMap=new HashMap<String,String>();
        User user=userBiz.findByName(username);
        if(user!=null){
            resultMap.put("status","exist");
        }else{
            resultMap.put("status","notexist");
        }
        return resultMap;
    }
    

    @RequestMapping(value="/modifypwd",method=RequestMethod.POST)
    @ResponseBody
    public Map<String,String> modifyPassword(HttpServletRequest request){
        HttpSession session=request.getSession();
        User user=(User) session.getAttribute("user");
        String password=request.getParameter("password");
        password=MD5Util.md5(user.getUserName()+password);
        user.setPassword(password);

        Map<String,String> resultMap=new HashMap<String,String>();
        if(userBiz.modifyUser(user)!=null){
            resultMap.put("status", "success");
        }else{
            resultMap.put("status", "fail");
        }
        return resultMap;
    }
    //----------------------
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
//    @ResponseBody
	    public  ModelAndView insertuser(HttpServletRequest request,HttpServletResponse response){

	        String userName = request.getParameter("username");
	        String password = request.getParameter("password");
	        password=MD5Util.md5(userName+password);
	        Integer age = Integer.parseInt(request.getParameter("age"));
	        String gender = request.getParameter("gender");
	        String city = request.getParameter("city");
	        String job = request.getParameter("job");
			String description = request.getParameter("description");
//			Integer level=Integer.parseInt(request.getParameter("level"));
	        User user = new User(userName, password, gender, age, city, job, description);
	        if(request.getParameter("level")!=null) {
	        	Integer level=Integer.parseInt(request.getParameter("level"));
	        	user.setLevel(level);
	        }
            int result = adminBiz.insert(user);
//            Map<String,String> resultMap=new HashMap<>();
	        if (result == 1) {
//                resultMap.put("status", "success");
	             return new ModelAndView("AD-index", "status", "插入用户成功!");
	        } else {
//                resultMap.put("status", "fail");
	             return new ModelAndView("AD-index", "status", "插入失败！");
	        }
//	        return resultMap;
	    }
	    
	    @RequestMapping(value = "/user/delete", method = RequestMethod.POST)
		@ResponseBody
		public  Map<String,String> deleteuser(HttpServletRequest request,HttpServletResponse response){

	        Integer userid = Integer.parseInt(request.getParameter("userid"));
	      	Map<String,String> resultMap=new HashMap<>();
	        int result = adminBiz.deleteUser(userid);
	        if (result != 0) {
	           resultMap.put("status", "success");
	            // return new ModelAndView("user", "error", "删除成功");
	        } else {
				resultMap.put("status", "fail");
	            // return new ModelAndView("user", "error", "删除失败");
			}
			return resultMap;
	    }
}