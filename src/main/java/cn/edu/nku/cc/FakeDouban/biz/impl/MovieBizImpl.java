package cn.edu.nku.cc.FakeDouban.biz.impl;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nku.cc.FakeDouban.biz.MovieBiz;
import cn.edu.nku.cc.FakeDouban.dao.LongReviewDao;
import cn.edu.nku.cc.FakeDouban.dao.MovieDao;
import cn.edu.nku.cc.FakeDouban.dao.SimpleReviewDao;
import cn.edu.nku.cc.FakeDouban.domain.po.LongReview;
import cn.edu.nku.cc.FakeDouban.domain.po.Movie;
import cn.edu.nku.cc.FakeDouban.domain.po.MovieTag;
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

	public int setNewSimpleReview(User user, int movieId, int rank, String review) {
        SimpleReview sReview=new SimpleReview();
        sReview.setUser(user);
        Movie movie=new Movie();
        movie.setId(movieId);
        sReview.setMovie(movie);
        sReview.setRank(rank);
        sReview.setReview(review);
//        return srDao.insert(sReview);
        if(srDao.insert(sReview)>0){
        	movie=movieDao.findById(movieId);
//        	movie.getRanking().
        	BigDecimal ranking=srDao.findAvgSRRanking(movieId);
        	ranking=ranking.setScale(1, BigDecimal.ROUND_HALF_UP);
        	movie.setRanking(ranking);
        	movie.setRankCount(srDao.findSRNum(movieId));
        	movieDao.modifyMovie(movie);
        	return 1;
//            return srDao.findByUserAndMovie(sReview);
        }else return 0;
	}

	public int setNewLongReview(User reviewer, int movieId, int rank, String title, String content) {
		LongReview lReview=new LongReview();
        lReview.setReviewer(reviewer);
        Movie movie=new Movie();
        movie.setId(movieId);
        lReview.setMovie(movie);
        lReview.setRank(rank);
        lReview.setTitle(title);
        lReview.setContent(content);
        return lrDao.insert(lReview);
	}

	public int insertrecmovie(Movie movie) {
		// TODO Auto-generated method stub
		if(movieDao.findRecById(movie.getId())!=null) {
			return 0;
		}else
		return movieDao.insertrecmovie(movie);
	}

	public List<SimpleReview> findAllSimpleReview() {
		// TODO Auto-generated method stub
		return srDao.findAllSimpleReview();
	}

	public List<LongReview> findAllLongReview() {
		// TODO Auto-generated method stub
		return lrDao.findAllLongReview();
	}

	public int insertmovie(Movie movie) {
		// TODO Auto-generated method stub
		if(movieDao.findByAbsoluteName(movie.getMovieName())!=null) {
			return 0;
		}else
		return movieDao.insertmovie(movie);
	}

	public int deleterecmovie(int id) {
		// TODO Auto-generated method stub
		return movieDao.deleterecmovie(id);
	}
	
	public int insertmovietag(MovieTag movietag) {
		// TODO Auto-generated method stub
		return movieDao.insertmovietag(movietag);
	}

	public int deletelongreview(int id) {
		// TODO Auto-generated method stub
		return lrDao.deletelongreview(id);
	}

	public int deletesimplereview(int id) {
		// TODO Auto-generated method stub
		return srDao.deletesimplereview(id);
	}

	public List<SimpleReview> findSRByUserid(int userid) {
		// TODO Auto-generated method stub
		return srDao.findSRByUserid(userid);
	}

	public List<LongReview> findLRByReviewer(int userid) {
		// TODO Auto-generated method stub
		return lrDao.findLRByReviewer(userid);
	}

	public Movie findByAbsoluteName(String movieName) {
	     
		return movieDao.findByAbsoluteName(movieName);
	}

}