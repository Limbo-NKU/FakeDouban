package cn.edu.nku.cc.FakeDouban.biz;

import cn.edu.nku.cc.FakeDouban.domain.po.User;

public interface UserBiz{
    public User findById(Integer id);
    public User findByNameAndPwd(String userName,String password);
    public User modifyUser(User user);
    public User insertUser(User user);
}