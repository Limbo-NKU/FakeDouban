package cn.edu.nku.cc.FakeDouban.biz;

import java.util.List;

import cn.edu.nku.cc.FakeDouban.domain.po.Analysis;

public interface AnalysisBiz {
	public List<Analysis> getAnalysisByUser(int usertype,int usercollection,int movietype);
	public List<Analysis> getAnalysisByMovie(int movietype,int moviecollection,int usertype);
}
