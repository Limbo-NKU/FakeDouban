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
    private BigDecimal ranking;
	private Integer rankCount;
	private Date updateDate;
	//首页推荐电影必需属性
	public String reason;
	public Integer recommendType;

	//Getters and Setters
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
	
	public Movie() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Integer getRecommendType() {
		return recommendType;
	}
	public void setRecommendType(Integer recommendType) {
		this.recommendType = recommendType;
	}
	public Movie(String movieName, String movieType, String movieRegion, List<String> movieTags, BigDecimal moviePrice,
			Date updateDate) {
		super();
		this.movieName = movieName;
		this.movieType = movieType;
		this.movieRegion = movieRegion;
		this.movieTags = movieTags;
		this.moviePrice = moviePrice;
		this.updateDate = updateDate;
	}

}