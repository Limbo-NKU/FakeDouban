package cn.edu.nku.cc.FakeDouban.dao;

import cn.edu.nku.cc.FakeDouban.domain.po.User;

public interface UserDao {
    public User findByNameAndPwd(String userName,String password);
    public User findById(Integer id);
    public int  modifyUser(User user);
    public int insertUser(User user);
}