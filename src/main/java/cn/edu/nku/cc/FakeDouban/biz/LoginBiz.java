package cn.edu.nku.cc.FakeDouban.biz;

import cn.edu.nku.cc.FakeDouban.domain.po.User;

public interface LoginBiz{
    public User login(String userName,String password);
}