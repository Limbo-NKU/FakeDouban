package test;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.edu.nku.cc.FakeDouban.biz.MovieBiz;
import cn.edu.nku.cc.FakeDouban.biz.UserBiz;
import cn.edu.nku.cc.FakeDouban.biz.impl.UserBizImpl;
import cn.edu.nku.cc.FakeDouban.domain.po.Movie;
import cn.edu.nku.cc.FakeDouban.domain.po.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:cn/edu/nku/cc/FakeDouban/spring/applicationContext.xml"}) 

public class testBiz {
	
	@Autowired 
	private MovieBiz movieBiz;
	@Test
	public void test(){
		Movie movie=movieBiz.findById(1);
		System.out.println(" ");
	}

}
