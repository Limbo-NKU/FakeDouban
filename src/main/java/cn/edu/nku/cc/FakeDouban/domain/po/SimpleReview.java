package cn.edu.nku.cc.FakeDouban.domain.po;

import java.io.Serializable;


@SuppressWarnings("serial")
public class SimpleReview implements Serializable{
    private User user;
    private Movie movie;
    private int rank;
    private String review;
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
    
}