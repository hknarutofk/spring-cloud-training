# spring-cloud-training

## 开发规范
阿里巴巴Java开发手册（泰山版）.pdf
https://github.com/alibaba/p3c/blob/master/%E9%98%BF%E9%87%8C%E5%B7%B4%E5%B7%B4Java%E5%BC%80%E5%8F%91%E6%89%8B%E5%86%8C%EF%BC%88%E6%B3%B0%E5%B1%B1%E7%89%88%EF%BC%89.pdf

## 代码格式化
https://github.com/alibaba/p3c/tree/master/p3c-formatter

## 架构选型
功能|框架|版本
---|---|---
分布式框架 | Spring Cloud | 。
基础框架 | Spring Boot | .
API接口 | Swagger2 | .
服务注册、发现 | Nacos | 
负载均衡 | Ribbon | 
服务消费 | Feign |
熔断器 | Hystrix（下一步alibaba/sentinel） |
路由网关 | Gateway（下一步kong） |
配置中心 | Nacos |
服务链路跟踪 | Spring Cloud Sleuth |
微服务监控 | Spring Boot Admin | 
分布式安全框架 | Spring Security OAuth2 | 
日志收集、展示 | ELK | 



## 开发环境

系统/软件 | 版本信息
---|---
Fedora31 | Linux localhost.localdomain 5.3.8-300.fc31.x86_64 #1 SMP Tue Oct 29 14:28:41 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux 
docker   |  19.03.4

## zipkin配置
https://cloud.spring.io/spring-cloud-static/spring-cloud-sleuth/2.2.2.RELEASE/reference/html/#sending-spans-to-zipkin

## 启动步骤

```
cd nacos-docker
sh start.sh
```


第一步：搭建基础Spring Cloud框架，采用nacos，排除Eureka、config server



第二步：容器化，Docker Compose



第三步：k8s



第四步:Prometheus监控报警
