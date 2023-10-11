# quartz 定制任务系统

> Spring Boot集成持久化Quartz定时任务管理和界面展示

> 包含定时任务页面管理，增删改查，暂停，执行等功能。包含定时任务执行日志。
> 从若依框架中剥离出来，简单可以直接内嵌到自己系统中，与自己系统解耦，无侵入。

> 技术栈：html、jquery、thymeleaf、SpringBoot、quartz、mybaties、pagehelper、mysql

> 使用方法：

1.  在RyTask类中添加自己需要定时的方法。参考：RyTask类示例方法。
2.  在job页面新增任务时，配置调用目标字符串。

> 项目访问：
http://localhost:8080/job
http://localhost:8080/jobLog

![1](https://github.com/superlizy/quartz/assets/35552357/0c3eb13a-0f11-48c8-b5a5-9e8049825916)
![2](https://github.com/superlizy/quartz/assets/35552357/cf64a2f2-d25d-4481-8987-6c779d933ba6)
![3](https://github.com/superlizy/quartz/assets/35552357/de57e6ff-a954-430b-b4f0-61bc259707c9)
![4](https://github.com/superlizy/quartz/assets/35552357/7b2790c9-2bad-4611-87a7-35ab26859af8)
![6](https://github.com/superlizy/quartz/assets/35552357/ee8d2967-76fc-48c7-84e3-e76bc47ab4e9)
