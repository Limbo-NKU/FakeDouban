package cn.edu.nku.cc.FakeDouban.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nku.cc.FakeDouban.biz.AdminBiz;
import cn.edu.nku.cc.FakeDouban.biz.UserBiz;
import cn.edu.nku.cc.FakeDouban.dao.UserDao;
import cn.edu.nku.cc.FakeDouban.domain.po.Administer;
import cn.edu.nku.cc.FakeDouban.domain.po.User;

@Service
public  class AdminBizImpl implements AdminBiz{

    @Autowired
    private UserDao userDao;
    
//   public User findByName(String username) {
//		return userDao.findByName(username);
//	}
//
//	public User findByNameAndPwd(String userName, String password) {
//		return userDao.findByNameAndPwd(userName, password);
//	}
//
//	public User modifyUser(User user) {
//        if(userDao.modifyUser(user)>0){
//            return userDao.findByName(user.getUserName());
//        }
//        return null;
//	}


	public int deleteUser(int id) {
		// TODO Auto-generated method stub
		return userDao.deleteUser(id);
	}

	public int levelupUser(int id) {
		return userDao.levelupUser(id);
	}

	public List<User> findAll() {
		return userDao.findAll();
	}

	public int insert(User user) {
		// TODO Auto-generated method stub
		if(userDao.insert(user)!=0) {
			if(user.getLevel()!=null) {
				user=userDao.findByNameAndPwd(user);
				return userDao.levelupUser(user.getId());
			}
			else
				return 1;
		}
		return 0;
//		return userDao.insert(user);
	}

	public Administer findByNameAndPwd(String adminName,String password) {
        Administer administer=new Administer();
        administer.setAdminName(adminName);
        //未引入加密，明文存储/查询
        administer.setPassword(password);
		return userDao.findByAdminNameAndPwd(administer);
	}
	
}