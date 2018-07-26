package cn.edu.nku.cc.FakeDouban.domain.po;

import java.io.Serializable;


@SuppressWarnings("serial")
public class SimpleReview implements Serializable{
	private Integer id;
    private User user;
    private Movie movie;
    private int rank;
	private String review;
	private Integer likeCount;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public SimpleReview() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(Integer likeCount) {
		this.likeCount = likeCount;
	}
	public SimpleReview(User user, Movie movie, int rank, String review) {
		super();
		this.user = user;
		this.movie = movie;
		this.rank = rank;
		this.review = review;
	}
    
}