package com.glc.demo.user.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

import com.glc.demo.user.entity.IssueEntity;

public interface IssueService {

    //创建issue
    public void insertIssue(IssueEntity issue);
    
    //删除issue
    public void deleteIssue(Integer issueId);

    //查询所有issue
	List<IssueEntity> listIssue(Map map);

	//查询issue(根据issueId,issueStatus,founder,reviser,iCreateTime时间段，actualTime时间段)
	public List<IssueEntity> queryIssue(String issueId,String issueStatus,String founder,String reviser,Date iCreateTime1,Date iCreateTime2,Date actualTime1,Date actualTime2);

    //修改issue
    public void updateIssue(@RequestBody IssueEntity issue);
    
    //关闭issue
    public void closeIssue(@RequestBody IssueEntity issue);

    //查询issue报表(根据userId1,founder)
    public List<IssueEntity> formIssue(String userId1,String founder);
}
