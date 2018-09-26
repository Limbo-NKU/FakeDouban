package cn.edu.nku.cc.FakeDouban.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nku.cc.FakeDouban.biz.AnalysisBiz;
import cn.edu.nku.cc.FakeDouban.dao.AnalysisDao;
import cn.edu.nku.cc.FakeDouban.domain.po.Analysis;

@Service
public class AnalysisBizImpl implements AnalysisBiz{
	@Autowired
	AnalysisDao analysisdao;

	public List<Analysis> getAnalysisByUser(int usertype, int usercollection,int movietype) {
		Analysis ana=new Analysis();
		ana.setUserType(usertype);
		ana.setUserCollection(usercollection);
		ana.setMovieType(movietype);
		return analysisdao.getAnalysisByUser(ana);
	}

	public List<Analysis> getAnalysisByMovie(int movietype, int moviecollection,int usertype) {
		Analysis ana=new Analysis();
		ana.setMovieType(movietype);
		ana.setMovieCollection(moviecollection);
		ana.setUserType(usertype);
		return analysisdao.getAnalysisByMovie(ana);
	}

}
