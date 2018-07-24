package cn.edu.nku.cc.FakeDouban.domain.po;

import java.io.Serializable;

public class Job implements Serializable{
    private Integer id;
    private String jobName;
    public Integer getId(){
        return id;
    }
    public void setId(Integer id){
        this.id=id;
    }
    public String getJobName(){
        return jobName;
    }
    public void setJobName(String jobName){
        this.jobName=jobName;
    }
    public Job(){
        super();
    }
}