-- 创建issue数据库
CREATE DATABASE issue;

USE issue;


-- 创建user表
CREATE TABLE user( 
userId int(30) primary key auto_increment,
name varchar(30),
email varchar(30),
uCreateTime date DEFAULT NULL,
identity varchar(15),
status varchar(10),
password varchar(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 设置userId初始值
alter TABLE user auto_increment =1000;
-- 输入测试数据
insert into user(name,email,uCreatetime,identity,status,password) value('admin','admin@.163.com','2020-01-01','admin','激活','Admin123.');
insert into user(name,email,uCreatetime,identity,status,password) value('小展','liuyi@163.com','2020-02-02','经理','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('小华','chener@qq.com','2020-03-03','普通职员','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('小邦','zhangsan@163.com','2020-04-04','普通职员','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('小承','lisi@qq.com','2020-05-05','经理','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('小平','wangwu@163.com','2020-06-06','经理','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('小恒','zhaoliu@qq.com','2020-07-07','普通职员','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('小星','sunqi@163.com','2020-08-08','经理','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('小佳','zhouba@qq.com','2020-09-09','经理','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('小文','wujiu@163.com','2020-10-10','普通职员','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('小贤','zhengshi@qq.com','2020-11-11','经理','激活','Qq123456.');

insert into user(name,email,uCreatetime,identity,status,password) value('曹操','caocao@.163.com','2020-01-01','普通职员','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('刘备','liubei@163.com','2020-02-02','普通职员','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('诸葛亮','zhugeliang@qq.com','2020-03-03','普通职员','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('孙权','sunquan@163.com','2020-04-04','普通职员','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('孙策','sunce@qq.com','2020-05-05','普通职员','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('曹丕','caopi@163.com','2020-06-06','经理','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('刘禅','liushan@qq.com','2020-07-07','普通职员','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('张辽','zhangliao@163.com','2020-08-08','经理','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('周瑜','zhouyu@qq.com','2020-09-09','普通职员','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('关羽','guanyu@163.com','2020-10-10','经理','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('张飞','zhangfei@qq.com','2020-11-11','普通职员','激活','Qq123456.');

insert into user(name,email,uCreatetime,identity,status,password) value('姜维','jiangwei@.163.com','2020-01-01','普通职员','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('曹真','caozhen@163.com','2020-02-02','经理','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('曹爽','caoshuang@qq.com','2020-03-03','普通职员','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('赵云','zhangyun@163.com','2020-04-04','经理','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('黄忠','huangzhong@qq.com','2020-05-05','普通职员','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('黄盖','huanggai@163.com','2020-06-06','经理','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('吕布','lvbu@qq.com','2020-07-07','普通职员','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('貂蝉','diaochan@163.com','2020-08-08','经理','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('典韦','dianwei@qq.com','2020-09-09','普通职员','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('马超','machao@163.com','2020-10-10','经理','激活','Qq123456.');
insert into user(name,email,uCreatetime,identity,status,password) value('庞统','pangtong@qq.com','2020-11-11','普通职员','激活','Qq123456.');




-- 创建issue表
CREATE TABLE issue( 
issueId int(30) primary key auto_increment,
title varchar(80),
founder varchar(30),
iCreateTime date DEFAULT NULL,
reviser varchar(30),
issueStatus varchar(10),
planTime date DEFAULT NULL,
actualTime date DEFAULT NULL,
userId1 int(30),
userId2 int(30),
type varchar(30),
grade varchar(6),
version varchar(30),
step varchar(2000),
plan varchar(2000)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 设置issueId初始值
alter TABLE issue auto_increment =202001;

-- 插入测试数据
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('登录不成功','小展','2020-11-12','小贤','已关闭','2020-11-13','2020-11-14',1001,1010,'后端','一般','1.0','123','321');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan) 
     value('注册不成功','小华','2020-11-12','小佳','待解决','2020-11-13','2020-11-14',1002,1008,'前端','一般','2.0','456','654');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('用户查询不成功','小邦','2020-11-12','小华','待验证','2020-11-13','2020-11-14',1003,1002,'后端','一般','1.0','123','321');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan) 
     value('权限失效','小承','2020-11-12','小文','待解决','2020-11-13','2020-11-14',1004,1009,'前端','一般','2.0','456','654');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan) 
     value('issue创建失败','小恒','2020-11-12','小佳','待解决','2020-11-13','2020-11-14',1001,1008,'前端','一般','2.0','456','654');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('issue查询失败','小恒','2020-11-12','小贤','待验证','2020-11-13','2020-11-14',1006,1010,'后端','一般','1.0','123','321');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('修改issue失败','小平','2020-11-12','小展','已关闭','2020-11-13','2020-11-14',1005,1001,'后端','一般','1.0','123','321');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan) 
     value('issue模糊查询失败','小文','2020-11-12','小星','待解决','2020-11-13','2020-11-14',1009,1007,'前端','一般','2.0','456','654');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('issue状态更新失败','小贤','2020-11-12','小邦','已关闭','2020-11-13','2020-11-14',1010,1003,'后端','一般','1.0','123','321');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan) 
     value('issue报表查询失败','小佳','2020-11-12','小承','待验证','2020-11-13','2020-11-14',1008,1004,'前端','一般','2.0','456','654');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('issue报表统计失败','小展','2020-11-12','小平','待解决','2020-11-13','2020-11-14',1001,1005,'后端','一般','1.0','123','321');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('issue报表完成率不显示','小平','2020-11-12','小贤','已关闭','2020-11-13','2020-11-14',1005,1010,'后端','一般','1.0','123','321');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('issue报表完成率不显示','小星','2020-11-12','小恒','已关闭','2020-11-13','2020-11-14',1007,1006,'后端','一般','1.0','123','321');
     
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('登录不成功','小展','2020-11-12','小贤','已关闭','2020-11-13','2020-11-14',1001,1010,'后端','一般','1.0','123','321');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan) 
     value('注册不成功','小华','2020-11-12','小佳','已关闭','2020-11-13','2020-11-14',1002,1008,'前端','一般','2.0','456','654');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('用户查询不成功','小邦','2020-11-12','小华','已关闭','2020-11-13','2020-11-14',1003,1002,'后端','一般','1.0','123','321');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan) 
     value('权限失效','小承','2020-11-12','小文','已关闭','2020-11-13','2020-11-14',1004,1009,'前端','一般','2.0','456','654');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan) 
     value('issue创建失败','小恒','2020-11-12','小佳','已关闭','2020-11-13','2020-11-14',1001,1008,'前端','一般','2.0','456','654');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('issue查询失败','小恒','2020-11-12','小贤','已关闭','2020-11-13','2020-11-14',1006,1010,'后端','一般','1.0','123','321');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('修改issue失败','小平','2020-11-12','小展','已关闭','2020-11-13','2020-11-14',1005,1001,'后端','一般','1.0','123','321');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan) 
     value('issue模糊查询失败','小文','2020-11-12','小星','已关闭','2020-11-13','2020-11-14',1009,1007,'前端','一般','2.0','456','654');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('issue状态更新失败','小贤','2020-11-12','小邦','已关闭','2020-11-13','2020-11-14',1010,1003,'后端','一般','1.0','123','321');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan) 
     value('issue报表查询失败','小佳','2020-11-12','小承','已关闭','2020-11-13','2020-11-14',1008,1004,'前端','一般','2.0','456','654');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('issue报表统计失败','小展','2020-11-12','小平','已关闭','2020-11-13','2020-11-14',1001,1005,'后端','一般','1.0','123','321');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('issue报表完成率不显示','小平','2020-11-12','小贤','已关闭','2020-11-13','2020-11-14',1005,1010,'后端','一般','1.0','123','321');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('issue报表完成率不显示','小星','2020-11-12','小恒','已关闭','2020-11-13','2020-11-14',1007,1006,'后端','一般','1.0','123','321');
     
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('登录不成功','小展','2020-11-12','小贤','待解决','2020-11-13','2020-11-14',1001,1010,'后端','一般','1.0','123','321');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan) 
     value('注册不成功','小华','2020-11-12','小佳','待解决','2020-11-13','2020-11-14',1002,1008,'前端','一般','2.0','456','654');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('用户查询不成功','小邦','2020-11-12','小华','待解决','2020-11-13','2020-11-14',1003,1002,'后端','一般','1.0','123','321');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan) 
     value('权限失效','小承','2020-11-12','小文','待解决','2020-11-13','2020-11-14',1004,1009,'前端','一般','2.0','456','654');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan) 
     value('issue创建失败','小恒','2020-11-12','小佳','待解决','2020-11-13','2020-11-14',1001,1008,'前端','一般','2.0','456','654');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('issue查询失败','小恒','2020-11-12','小贤','待解决','2020-11-13','2020-11-14',1006,1010,'后端','一般','1.0','123','321');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('修改issue失败','小平','2020-11-12','小展','待解决','2020-11-13','2020-11-14',1005,1001,'后端','一般','1.0','123','321');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan) 
     value('issue模糊查询失败','小文','2020-11-12','小星','待解决','2020-11-13','2020-11-14',1009,1007,'前端','一般','2.0','456','654');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('issue状态更新失败','小贤','2020-11-12','小邦','待解决','2020-11-13','2020-11-14',1010,1003,'后端','一般','1.0','123','321');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan) 
     value('issue报表查询失败','小佳','2020-11-12','小承','待解决','2020-11-13','2020-11-14',1008,1004,'前端','一般','2.0','456','654');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('issue报表统计失败','小展','2020-11-12','小平','待解决','2020-11-13','2020-11-14',1001,1005,'后端','一般','1.0','123','321');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('issue报表完成率不显示','小平','2020-11-12','小贤','待解决','2020-11-13','2020-11-14',1005,1010,'后端','一般','1.0','123','321');
insert into issue(title,founder,iCreateTime,reviser,issueStatus,planTime,actualTime,userId1,userId2,type,grade,version,step,plan)
     value('issue报表完成率不显示','小星','2020-11-12','小恒','待解决','2020-11-13','2020-11-14',1007,1006,'后端','一般','1.0','123','321');
          


-- 查询表
SELECT * FROM user;

SELECT * FROM issue;