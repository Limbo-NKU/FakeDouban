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
        User user=new User();
        user.setUserName(userName);
        user.setPassword(password);
        return userDao.findByNameAndPwd(user);
	}

	public User modifyUser(User user) {
        if(userDao.modifyUser(user)>0){
            return userDao.findById(user.getId());
        }else {
            return null;

        }
	}

	public User insertUser(User user) {
		if (userDao.findByName(user.getUserName()) == null) {
			if (userDao.insertUser(user) > 0) {
				return userDao.findByNameAndPwd(user);
			} else {
				return null;
			}
		} else {
			return null;
		}
	}

}