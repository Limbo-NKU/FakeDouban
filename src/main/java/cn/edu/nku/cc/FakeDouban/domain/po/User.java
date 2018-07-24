package cn.edu.nku.cc.FakeDouban.domain.po;

import java.io.Serializable;

@SuppressWarnings("serial")
public class User implements Serializable{
	//普通用户基本属性
    private Integer id;
    private String userName;
    private String password;
    private String gender;
    private Integer age;
    private String city;
    private Job job;
	private String description;
	//level为评论员必需属性，普通用户为空
	//前端解析时若为空，则隐藏等级显示
	private Integer level;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Job getJob() {
		return job;
	}
	public void setJob(Job job) {
		this.job = job;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
    
}