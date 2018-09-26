package cn.edu.nku.cc.FakeDouban.dao;

import java.util.List;

import cn.edu.nku.cc.FakeDouban.domain.po.LongReview;

public interface LongReviewDao{
    List<LongReview> findLRByMovieId(int movieId);
    List<LongReview> findByReviewerAndMovie(LongReview lReview);
    int insert(LongReview lReview);
    //------------------------
    List<LongReview> findAllLongReview();
    List<LongReview> findLRByReviewer(int userid);
//  int insert(LongReview lReview);
    int deletelongreview(int id);
}