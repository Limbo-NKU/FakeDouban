package cn.edu.nku.cc.FakeDouban.dao;

import java.math.BigDecimal;
import java.util.List;

import cn.edu.nku.cc.FakeDouban.domain.po.SimpleReview;

public interface SimpleReviewDao{
    List<SimpleReview> findSRByMovieId(int movieId);
    SimpleReview findByUserAndMovie(SimpleReview sReview);
    int insert(SimpleReview sReview);
    //-----------------
    List<SimpleReview> findAllSimpleReview();
    List<SimpleReview> findSRByUserid(int userid);
//  int insert(SimpleReview sReview);
    int deletesimplereview(int id);
    int findSRNum(int movieid);
    BigDecimal findAvgSRRanking(int movieid);

}