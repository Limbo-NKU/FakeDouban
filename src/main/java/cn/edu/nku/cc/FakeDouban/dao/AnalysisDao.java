package cn.edu.nku.cc.FakeDouban.dao;

import java.util.List;

import cn.edu.nku.cc.FakeDouban.domain.po.Analysis;

public interface AnalysisDao {

	public List<Analysis> getAnalysisByUser(Analysis analysis);
	public List<Analysis> getAnalysisByMovie(Analysis analysis);
}
