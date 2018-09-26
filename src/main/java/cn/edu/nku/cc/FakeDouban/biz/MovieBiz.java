package cn.edu.nku.cc.FakeDouban.biz;

import java.util.List;

import cn.edu.nku.cc.FakeDouban.domain.po.LongReview;
import cn.edu.nku.cc.FakeDouban.domain.po.Movie;
import cn.edu.nku.cc.FakeDouban.domain.po.MovieTag;
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
    int setNewSimpleReview(User User,int movieId,int rank,String review);
    int setNewLongReview(User reviewer,int movieId,int rank,String title,String content);
    //--------------------
    List<SimpleReview> findAllSimpleReview();
    List<LongReview> findAllLongReview();
    int insertmovie(Movie movie);
    int insertmovietag(MovieTag movietag);
    int insertrecmovie(Movie movie);
    int deleterecmovie(int id);
    int deletelongreview(int id);
    int deletesimplereview(int id);
    List<SimpleReview> findSRByUserid(int userid);
    List<LongReview> findLRByReviewer(int userid);
    Movie findByAbsoluteName(String movieName);
}