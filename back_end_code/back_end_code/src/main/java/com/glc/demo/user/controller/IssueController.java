 package com.glc.demo.user.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.glc.demo.user.entity.IssueEntity;
import com.glc.demo.user.service.IssueService;

@Controller
@RequestMapping("issue")
public class IssueController {

	@Autowired
	IssueService issueService;

	//创建issue
	@RequestMapping("/insertIssue")
	@ResponseBody
	public String insertIssue(@RequestBody IssueEntity issue){
		System.out.println("创建issue"+issue.toString());
		issueService.insertIssue(issue);
		return "success";
	}

	//删除issue
	@RequestMapping("/deleteIssue")
	public String deleteIssue(Integer issueId){
		issueService.deleteIssue(issueId);
		return "success";
	//	return "redirect:/index.html";//重定向功能
	}
	
	//获取所有issue
	@ResponseBody
	@RequestMapping("/listIssue")
	public List<IssueEntity> listIssue(Map map){
		return issueService.listIssue(map);
	}
	        
	//查询issue(根据issueId,issueStatus,founder,reviser,iCreateTime时间段，actualTime时间段)
	@RequestMapping("/queryIssue")
	@ResponseBody
	public List<IssueEntity> queryIssue(String issueId,String issueStatus,String founder,String reviser,Date iCreateTime1,Date iCreateTime2,Date actualTime1,Date actualTime2){
		return issueService.queryIssue(issueId,issueStatus,founder,reviser,iCreateTime1,iCreateTime2,actualTime1,actualTime2);
	}
	    
	//修改issue
	@RequestMapping("/updateIssue")
	@ResponseBody
	public String updateIssue(@RequestBody IssueEntity issue){
		issueService.updateIssue(issue);
		return "success";
	}
	
	//关闭issue
		@RequestMapping("/closeIssue")
		@ResponseBody
		public String closeIssue(@RequestBody IssueEntity issue){
			issueService.closeIssue(issue);
			return "success";
		}
	
	//查询issue报表(根据userId1,founder)
	 @RequestMapping("/formIssue")
	 @ResponseBody
	 public List<IssueEntity> formIssue(String userId1,String founder){
	  return  issueService.formIssue(userId1,founder);
	 }
	    
}
