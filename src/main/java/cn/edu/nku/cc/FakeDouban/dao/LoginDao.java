package cn.edu.nku.cc.FakeDouban.dao;

import cn.edu.nku.cc.FakeDouban.domain.po.User;

public interface LoginDao{
    public User findByNameAndPwd(User user);
}