package com.glc.demo.user.dao;


import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.glc.demo.user.entity.IssueEntity;

@Mapper
public interface IssueDao {

    //创建issue
    public int insertIssue(IssueEntity issue);
    
	//删除issue
    public int deleteIssue(Integer issueId);
	
    //查询所有issue
    public List<IssueEntity> listIssue();
    
    //查询issue(根据issueId,issueStatus,founder,reviser,iCreateTime时间段，actualTime时间段)
    public List<IssueEntity> queryIssue(String issueId,String issueStatus,String founder,String reviser,Date iCreateTime1,Date iCreateTime2,Date actualTime1,Date actualTime2);
 
    //修改issue
    public int updateIssue(IssueEntity issue);
    
    //关闭issue
    public int closeIssue(IssueEntity issue);
  
    //获取issue报表(根据userId1,founder)
    public List<IssueEntity> formIssue(String userId1,String founder);
    
}
