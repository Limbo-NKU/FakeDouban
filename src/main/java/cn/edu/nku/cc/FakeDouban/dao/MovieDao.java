package cn.edu.nku.cc.FakeDouban.dao;

import java.util.List;

import cn.edu.nku.cc.FakeDouban.domain.po.Movie;
import cn.edu.nku.cc.FakeDouban.domain.po.MovieTag;

public interface MovieDao{
    List<Movie> findHotMovies();
    List<Movie> findNewMovies();
    List<Movie> findAll();
    Movie findById(int id);
    List<Movie> findByName(String movieName);
    Movie findRecById(int id);
    //--------------------------
    int insertmovie(Movie movie);
    int insertrecmovie(Movie movie);
    int deleterecmovie(int id);
    int insertmovietag(MovieTag movietag);
	Movie findByAbsoluteName(String movieName);
	int modifyMovie(Movie movie);
}