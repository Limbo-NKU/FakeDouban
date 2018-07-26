package cn.edu.nku.cc.FakeDouban.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nku.cc.FakeDouban.biz.UserBiz;
import cn.edu.nku.cc.FakeDouban.dao.UserDao;
import cn.edu.nku.cc.FakeDouban.domain.po.User;

@Service
public class UserBizImpl implements UserBiz{

    @Autowired
    private UserDao userDao;
    
    public User findById(Integer id) {
		return userDao.findById(id);
	}

	public User findByNameAndPwd(String userName, String password) {
		return userDao.findByNameAndPwd(userName, password);
	}

	public User modifyUser(User user) {
        if(userDao.modifyUser(user)>0){
            return userDao.findById(user.getId());
        }
        return null;
	}

	public User insertUser(User user) {
        if(userDao.insertUser(user)>0){
            return userDao.findByNameAndPwd(user.getUserName(), user.getPassword());
        }
		return null;
	}

}