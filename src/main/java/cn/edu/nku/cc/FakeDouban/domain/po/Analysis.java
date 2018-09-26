package cn.edu.nku.cc.FakeDouban.domain.po;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Analysis implements Serializable{
	private int userType;
	private int userCollection;
	private int movieType;
	private int movieCollection;
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public int getUserCollection() {
		return userCollection;
	}
	public void setUserCollection(int userCollection) {
		this.userCollection = userCollection;
	}
	public int getMovieType() {
		return movieType;
	}
	public void setMovieType(int movieType) {
		this.movieType = movieType;
	}
	public int getMovieCollection() {
		return movieCollection;
	}
	public void setMovieCollection(int movieCollection) {
		this.movieCollection = movieCollection;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	private int count;
	
}
