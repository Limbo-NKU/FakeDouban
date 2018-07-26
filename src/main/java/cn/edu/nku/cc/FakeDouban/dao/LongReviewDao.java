package cn.edu.nku.cc.FakeDouban.dao;

import java.util.List;

import cn.edu.nku.cc.FakeDouban.domain.po.LongReview;

public interface LongReviewDao{
    List<LongReview> findLRByMovieId(int movieId);
    LongReview findByReviewerAndMovie(LongReview lReview);
    int insert(LongReview lReview);
}