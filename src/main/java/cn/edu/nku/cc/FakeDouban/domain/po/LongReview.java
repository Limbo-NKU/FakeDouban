package cn.edu.nku.cc.FakeDouban.domain.po;

import java.io.Serializable;

@SuppressWarnings("serial")
public class LongReview implements Serializable{
    private User reviewer;
    private Movie movie;
    private int rank;
    private String title;
    private String content;
	public User getReviewer() {
		return reviewer;
	}
	public void setReviewer(User reviewer) {
		this.reviewer = reviewer;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public LongReview() {
		super();
		// TODO Auto-generated constructor stub
	}
}