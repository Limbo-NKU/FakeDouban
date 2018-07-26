package cn.edu.nku.cc.FakeDouban.biz;

import java.util.List;

import cn.edu.nku.cc.FakeDouban.domain.po.LongReview;
import cn.edu.nku.cc.FakeDouban.domain.po.Movie;
import cn.edu.nku.cc.FakeDouban.domain.po.SimpleReview;
import cn.edu.nku.cc.FakeDouban.domain.po.User;

public interface MovieBiz{
    List<Movie> getHotMovies();
    List<Movie> getNewMovies();
    List<Movie> getAllMovies();
    Movie findById(int movieId);
    List<Movie> findByName(String movieName);
    List<SimpleReview> findSRByMovieId(int movieId);
    List<LongReview> findLRByMovieId(int movieId);
    SimpleReview setNewSimpleReview(User User,int movieId,int rank,String review);
    LongReview setNewLongReview(User reviewer,int movieId,int rank,String title,String content);

}