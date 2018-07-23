package cn.edu.nku.cc.FakeDouban.domain.po;

import java.io.Serializable;

class User implements Serializable{
    private int id;
    private String userName;
    private String password;
    private String gender;
    private int age;
    private String city;
    private int jobId;
    private String description;
	public int getId() {
		return id;
	}
	public void setId(int id) {
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
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getJobId() {
		return jobId;
	}
	public void setJobId(int jobId) {
		this.jobId = jobId;
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
	public User(String userName, String password, String gender, int age, String city, int jobId, String description) {
		super();
		this.userName = userName;
		this.password = password;
		this.gender = gender;
		this.age = age;
		this.city = city;
		this.jobId = jobId;
		this.description = description;
	}
    
}