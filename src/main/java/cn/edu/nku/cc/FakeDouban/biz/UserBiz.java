package cn.edu.nku.cc.FakeDouban.biz;

import java.util.List;

import cn.edu.nku.cc.FakeDouban.domain.po.User;

public interface UserBiz{
    public User findById(Integer id);
    public User findByName(String userName);
    public User modifyUser(User user);
    public User insertUser(User user);
	public User findByNameAndPwd(String userName, String password);
	public List<User> findAll();
}