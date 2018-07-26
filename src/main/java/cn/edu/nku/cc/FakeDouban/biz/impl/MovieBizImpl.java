package cn.edu.nku.cc.FakeDouban.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nku.cc.FakeDouban.biz.MovieBiz;
import cn.edu.nku.cc.FakeDouban.dao.LongReviewDao;
import cn.edu.nku.cc.FakeDouban.dao.MovieDao;
import cn.edu.nku.cc.FakeDouban.dao.SimpleReviewDao;
import cn.edu.nku.cc.FakeDouban.domain.po.LongReview;
import cn.edu.nku.cc.FakeDouban.domain.po.Movie;
import cn.edu.nku.cc.FakeDouban.domain.po.SimpleReview;
import cn.edu.nku.cc.FakeDouban.domain.po.User;

@Service
public class MovieBizImpl implements MovieBiz{
    @Autowired
    private MovieDao movieDao;
    @Autowired
    private SimpleReviewDao srDao;
    @Autowired
    private LongReviewDao lrDao;

	public List<Movie> getHotMovies() {
		return movieDao.findHotMovies();
	}

	public List<Movie> getNewMovies() {
		return movieDao.findNewMovies();
	}

	public List<Movie> getAllMovies() {
		return movieDao.findAll();
	}

	public Movie findById(int movieId) {
		return movieDao.findById(movieId);
	}

	public List<Movie> findByName(String movieName) {
        movieName='%'+movieName+'%';
		return movieDao.findByName(movieName);
	}

	public List<SimpleReview> findSRByMovieId(int movieId) {
		return srDao.findSRByMovieId(movieId);
	}

	public List<LongReview> findLRByMovieId(int movieId) {
		return lrDao.findLRByMovieId(movieId);
	}

	public SimpleReview setNewSimpleReview(User user, int movieId, int rank, String review) {
        SimpleReview sReview=new SimpleReview();
        sReview.setUser(user);
        Movie movie=new Movie();
        movie.setId(movieId);
        sReview.setMovie(movie);
        sReview.setRank(rank);
        sReview.setReview(review);
        if(srDao.insert(sReview)>0){
            return srDao.findByUserAndMovie(sReview);
        }else return null;
	}

	public LongReview setNewLongReview(User reviewer, int movieId, int rank, String title, String content) {
		LongReview lReview=new LongReview();
        lReview.setReviewer(reviewer);
        Movie movie=new Movie();
        movie.setId(movieId);
        lReview.setMovie(movie);
        lReview.setRank(rank);
        lReview.setTitle(title);
        lReview.setContent(content);
        if(lrDao.insert(lReview)>0){
            return lrDao.findByReviewerAndMovie(lReview);
        }else return null;
	}

}