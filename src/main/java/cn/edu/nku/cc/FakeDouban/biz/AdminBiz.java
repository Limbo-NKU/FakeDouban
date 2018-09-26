package cn.edu.nku.cc.FakeDouban.biz;

import java.util.List;

import cn.edu.nku.cc.FakeDouban.domain.po.Administer;
import cn.edu.nku.cc.FakeDouban.domain.po.User;

public interface AdminBiz{
//    public User findByName(String username);
//    public User modifyUser(User user);
//    public User insertUser(User user);
    
//	public User findByNameAndPwd(String userName, String password);
	public int deleteUser(int id);
	public int levelupUser(int id);
	public List<User> findAll();
	public int insert (User user);
	 public Administer findByNameAndPwd(String adminName,String password);
}