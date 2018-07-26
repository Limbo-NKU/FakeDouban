package cn.edu.nku.cc.FakeDouban.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nku.cc.FakeDouban.biz.LoginBiz;
import cn.edu.nku.cc.FakeDouban.dao.LoginDao;
import cn.edu.nku.cc.FakeDouban.domain.po.User;
@Service
public class LoginBizImpl implements LoginBiz{
    @Autowired
    private LoginDao loginDao;

	public User login(String userName, String password) {
        User user=new User();
        user.setUserName(userName);
        //未引入加密，明文存储/查询
        user.setPassword(password);
		return loginDao.findByNameAndPwd(user);
	}

}