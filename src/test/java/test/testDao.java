package test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.edu.nku.cc.FakeDouban.dao.UserDao;
import cn.edu.nku.cc.FakeDouban.domain.po.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:cn/edu/nku/cc/FakeDouban/spring/applicationContext.xml"}) 
public class testDao {

	@Autowired
	private UserDao userDao;
	@Test
	public void test() {
		User user=userDao.findById(1);
		user.setAge(12);
		int res=userDao.modifyUser(user);
		System.out.println(" ");
	}
}
