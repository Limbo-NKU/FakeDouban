package cn.edu.nku.cc.FakeDouban.domain.po;

import java.io.Serializable;

@SuppressWarnings("serial")
public class MovieTag implements Serializable{
	private Integer movieid;
	private Integer tagid;
	public Integer getMovieid() {
		return movieid;
	}
	public void setMovieid(Integer movieid) {
		this.movieid = movieid;
	}
	public Integer getTagid() {
		return tagid;
	}
	public void setTagid(Integer tagid) {
		this.tagid = tagid;
	}
	public MovieTag(Integer movieid, Integer tagid) {
		super();
		this.movieid = movieid;
		this.tagid = tagid;
	}

}
