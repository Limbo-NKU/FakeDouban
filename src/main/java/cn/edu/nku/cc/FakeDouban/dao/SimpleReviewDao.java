package cn.edu.nku.cc.FakeDouban.dao;

import java.util.List;

import cn.edu.nku.cc.FakeDouban.domain.po.SimpleReview;

public interface SimpleReviewDao{
    List<SimpleReview> findSRByMovieId(int movieId);
    SimpleReview findByUserAndMovie(SimpleReview sReview);
    int insert(SimpleReview sReview);
}