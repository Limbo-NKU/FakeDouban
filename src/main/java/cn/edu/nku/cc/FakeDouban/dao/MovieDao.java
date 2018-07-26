package cn.edu.nku.cc.FakeDouban.dao;

import java.util.List;

import cn.edu.nku.cc.FakeDouban.domain.po.Movie;

public interface MovieDao{
    List<Movie> findHotMovies();
    List<Movie> findNewMovies();
    List<Movie> findAll();
    Movie findById(int id);
    List<Movie> findByName(String movieName);
    
}