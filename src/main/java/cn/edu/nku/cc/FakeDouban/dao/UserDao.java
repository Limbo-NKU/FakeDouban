package cn.edu.nku.cc.FakeDouban.dao;

import java.util.List;

import cn.edu.nku.cc.FakeDouban.domain.po.Administer;
import cn.edu.nku.cc.FakeDouban.domain.po.User;

public interface UserDao {
    public User findByNameAndPwd(User user);
    public User findByName(String userName);
    public User findById(Integer id);
    public int  modifyUser(User user);
    public int insertUser(User user);
    //----------------------
    public int  levelupUser(int id);
    public int deleteUser(int id);
    public List<User> findAll();
    public int insert (User user);
    public Administer findByAdminNameAndPwd(Administer adminster);
}