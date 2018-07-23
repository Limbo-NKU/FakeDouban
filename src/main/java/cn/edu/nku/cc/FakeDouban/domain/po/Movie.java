package cn.edu.nku.cc.FakeDouban.domain.po;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

@SuppressWarnings("serial")
public class Movie implements Serializable{
    //普通电影基本属性
    private Integer id;
    private String movieName;
    private String movieType;
    private String movieRegion;
    private List<String> movieTags;
    private BigDecimal moviePrice;
    //首页推荐电影必需特性，普通电影为空
    private BigDecimal ranking;
    //首页热门推荐电影必需特性，普通电影为空
    private Integer rankCount;
    //首页最新推荐电影必需特性，普通电影为空
    private Date updateTime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getMovieType() {
		return movieType;
	}
	public void setMovieType(String movieType) {
		this.movieType = movieType;
	}
	public String getMovieRegion() {
		return movieRegion;
	}
	public void setMovieRegion(String movieRegion) {
		this.movieRegion = movieRegion;
	}
	public List<String> getMovieTags() {
		return movieTags;
	}
	public void setMovieTags(List<String> movieTags) {
		this.movieTags = movieTags;
	}
	public BigDecimal getMoviePrice() {
		return moviePrice;
	}
	public void setMoviePrice(BigDecimal moviePrice) {
		this.moviePrice = moviePrice;
	}
	public BigDecimal getRanking() {
		return ranking;
	}
	public void setRanking(BigDecimal ranking) {
		this.ranking = ranking;
	}
	public Integer getRankCount() {
		return rankCount;
	}
	public void setRankCount(Integer rankCount) {
		this.rankCount = rankCount;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Movie() {
		super();
		// TODO Auto-generated constructor stub
	}

}