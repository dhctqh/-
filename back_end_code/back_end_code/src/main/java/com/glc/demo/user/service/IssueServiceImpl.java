package com.glc.demo.user.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.glc.demo.user.dao.IssueDao;
import com.glc.demo.user.entity.IssueEntity;

@Service
public class IssueServiceImpl implements IssueService{

	@Autowired
    IssueDao issueDao;
    
    //创建issue
    @Override
    public void insertIssue(IssueEntity issue) {
        issue.setiCreateTime(new Date());
        issue.setIssueStatus("待解决");
        issueDao.insertIssue(issue);
    }

    //删除issue
    @Override
    public void deleteIssue(Integer issueId) {
        issueDao.deleteIssue(issueId);
    }

	//查询所有issue
    @Override
    public List<IssueEntity> listIssue(Map map) {
        return issueDao.listIssue();
    }

    //查询issue(根据issueId,issueStatus,founder,reviser,iCreateTime时间段，actualTime时间段)
    @Override
    public List<IssueEntity> queryIssue(String issueId,String issueStatus,String founder,String reviser,Date iCreateTime1,Date iCreateTime2,Date actualTime1,Date actualTime2) {
        return issueDao.queryIssue(issueId,issueStatus,founder,reviser,iCreateTime1,iCreateTime2,actualTime1,actualTime2);
    }

    //修改issue
    @Override
    public void updateIssue(IssueEntity issue) {
//    	issue.setIssueStatus("已关闭");
//    	issue.setActualTime(new Date());
        issueDao.updateIssue(issue);
    }
    
    //关闭issue
    @Override
    public void closeIssue(IssueEntity issue) {
    	issue.setIssueStatus("已关闭");
    	issue.setActualTime(new Date());
        issueDao.closeIssue(issue);
    }
    
    //获取issue报表(根据userId1,founder)
    @Override
    public List<IssueEntity> formIssue(String userId1,String founder) {
        return issueDao.formIssue(userId1,founder);
    }

}
