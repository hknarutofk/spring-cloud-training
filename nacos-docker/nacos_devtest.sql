-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: nacos_devtest
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `config_info`
--

DROP TABLE IF EXISTS `config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info`
--

LOCK TABLES `config_info` WRITE;
/*!40000 ALTER TABLE `config_info` DISABLE KEYS */;
INSERT INTO `config_info` VALUES (4,'service-b.yml','DEFAULT_GROUP','server:\n  port: 9001\n  servlet:\n    context-path: /service-b\n\nspring:\n  zipkin:\n    baseUrl: http://127.0.0.1:9411/\n    sender:\n      type: web\n      \nparams:\n  p2: 2222','cd6d47a5a601d3bc262d13b9add74610','2020-05-19 15:02:33','2020-05-21 10:05:09',NULL,'172.19.0.1','','','null','null','null','yaml','null'),(5,'service-a.yml','DEFAULT_GROUP','server:\n  port: 9000\n  servlet:\n    context-path: /service-a\n\nspring:\n  zipkin:\n    baseUrl: http://127.0.0.1:9411/\n    sender:\n      type: web\n\nfeign:\n  hystrix:\n    enabled: true\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: hystrix.stream,mappings\n  \nparams:\n  p1: 1111','82b7494af4f8576522506d0d69a902ba','2020-05-19 15:02:56','2020-05-21 10:05:27',NULL,'172.19.0.1','','','null','null','null','yaml','null'),(8,'hystrix-dashboard.yml','DEFAULT_GROUP','server:\n  port: 9002\n  servlet:\n    context-path: /hystrix-dashboard\n\n','5a9f6bb32ab01e3d3e464103d5d1cfaa','2020-05-19 16:18:47','2020-05-20 16:45:27',NULL,'172.19.0.1','','','null','null','null','yaml','null'),(10,'gateway.yml','DEFAULT_GROUP','server:\n  port: 10000\n  servlet:\n    context-path: /\n\nspring:\n  zipkin:\n    baseUrl: http://127.0.0.1:9411/\n    sender:\n      type: web\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n      - id: hystrix_route\n        uri: lb://service-a/\n        predicates:\n        - Path=/service-a/**\n        filters:\n        - name: Hystrix\n          args:\n            name: fallbackcmd\n            fallbackUri: forward:/fallback       ','cedf5a77e140d1b7703914adb124b803','2020-05-20 14:34:03','2020-05-21 10:05:38',NULL,'172.19.0.1','','','null','null','null','yaml','null');
/*!40000 ALTER TABLE `config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_aggr`
--

DROP TABLE IF EXISTS `config_info_aggr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='增加租户字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_aggr`
--

LOCK TABLES `config_info_aggr` WRITE;
/*!40000 ALTER TABLE `config_info_aggr` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_aggr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_beta`
--

DROP TABLE IF EXISTS `config_info_beta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_beta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_beta`
--

LOCK TABLES `config_info_beta` WRITE;
/*!40000 ALTER TABLE `config_info_beta` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_beta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_tag`
--

DROP TABLE IF EXISTS `config_info_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_tag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_tag`
--

LOCK TABLES `config_info_tag` WRITE;
/*!40000 ALTER TABLE `config_info_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_tags_relation`
--

DROP TABLE IF EXISTS `config_tags_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_tag_relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_tags_relation`
--

LOCK TABLES `config_tags_relation` WRITE;
/*!40000 ALTER TABLE `config_tags_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_tags_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_capacity`
--

DROP TABLE IF EXISTS `group_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='集群、各Group容量信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_capacity`
--

LOCK TABLES `group_capacity` WRITE;
/*!40000 ALTER TABLE `group_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `his_config_info`
--

DROP TABLE IF EXISTS `his_config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `his_config_info` (
  `id` bigint(64) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text COLLATE utf8_bin,
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多租户改造';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `his_config_info`
--

LOCK TABLES `his_config_info` WRITE;
/*!40000 ALTER TABLE `his_config_info` DISABLE KEYS */;
INSERT INTO `his_config_info` VALUES (0,1,'service-a-default.yml','DEFAULT_GROUP','','params:\n  p1: 1111','c0143bc1265cfebe9918aa6ed6862178','2020-05-19 06:30:58','2020-05-19 14:30:58',NULL,'172.19.0.1','I',''),(0,2,'service-b-default.yml','DEFAULT_GROUP','','params:\n  p2: 2222','19b42c9c0113aa165a088a69df3290de','2020-05-19 06:31:19','2020-05-19 14:31:20',NULL,'172.19.0.1','I',''),(2,3,'service-b-default.yml','DEFAULT_GROUP','','params:\n  p2: 2222','19b42c9c0113aa165a088a69df3290de','2020-05-19 06:56:06','2020-05-19 14:56:06',NULL,'172.19.0.1','U',''),(0,4,'service-b.yml','DEFAULT_GROUP','','server:\n  port: 9000\n  \nparams:\n  p2: 2222','31c38756be4ec96a9849dae2b9ca72bd','2020-05-19 07:02:32','2020-05-19 15:02:33',NULL,'172.19.0.1','I',''),(0,5,'service-a.yml','DEFAULT_GROUP','','server:\n  port: 9000\n  \nparams:\n  p1: 1111','edd4477b279533126e89804c2271ae8b','2020-05-19 07:02:55','2020-05-19 15:02:56',NULL,'172.19.0.1','I',''),(1,6,'service-a-default.yml','DEFAULT_GROUP','','params:\n  p1: 1111','c0143bc1265cfebe9918aa6ed6862178','2020-05-19 07:03:03','2020-05-19 15:03:04',NULL,'172.19.0.1','D',''),(2,7,'service-b-default.yml','DEFAULT_GROUP','','server:\n  port: 9000\n  \nparams:\n  p2: 2222','31c38756be4ec96a9849dae2b9ca72bd','2020-05-19 07:03:03','2020-05-19 15:03:04',NULL,'172.19.0.1','D',''),(4,8,'service-b.yml','DEFAULT_GROUP','','server:\n  port: 9000\n  \nparams:\n  p2: 2222','31c38756be4ec96a9849dae2b9ca72bd','2020-05-19 07:03:12','2020-05-19 15:03:12',NULL,'172.19.0.1','U',''),(5,9,'service-a.yml','DEFAULT_GROUP','','server:\n  port: 9000\n  \nparams:\n  p1: 1111','edd4477b279533126e89804c2271ae8b','2020-05-19 07:44:16','2020-05-19 15:44:16',NULL,'172.19.0.1','U',''),(0,10,'hystrix-dashboard.yml','DEFAULT_GROUP','','server:\n  port: 9002\n\n','0414b33b9f256e62f0c7decdaa813a27','2020-05-19 08:18:47','2020-05-19 16:18:47',NULL,'172.19.0.1','I',''),(5,11,'service-a.yml','DEFAULT_GROUP','','server:\n  port: 9000\n\nfeigh:\n  hystrix:\n    enable: true\n  \nparams:\n  p1: 1111','f7c2f50ab1aec12f1d368de0b072e3c1','2020-05-19 08:27:37','2020-05-19 16:27:38',NULL,'172.19.0.1','U',''),(5,12,'service-a.yml','DEFAULT_GROUP','','server:\n  port: 9000\n\nfeigh:\n  hystrix:\n    enable: true\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: /actuator/hystrix.stream\n  \nparams:\n  p1: 1111','42dabe10130e4acdcc12cd8460e36c4d','2020-05-19 08:29:26','2020-05-19 16:29:26',NULL,'172.19.0.1','U',''),(5,13,'service-a.yml','DEFAULT_GROUP','','server:\n  port: 9000\n\nfeigh:\n  hystrix:\n    enable: true\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: hystrix.stream\n  \nparams:\n  p1: 1111','fe0b4d0b74be25bdf3fed858696214d9','2020-05-19 08:33:15','2020-05-19 16:33:15',NULL,'172.19.0.1','U',''),(5,14,'service-a.yml','DEFAULT_GROUP','','server:\n  port: 9000\n\nfeigh:\n  hystrix:\n    enable: true\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: hystrix,mappings\n  \nparams:\n  p1: 1111','696ce343e88fda1c2933aca834b97778','2020-05-19 08:34:07','2020-05-19 16:34:07',NULL,'172.19.0.1','U',''),(5,15,'service-a.yml','DEFAULT_GROUP','','server:\n  port: 9000\n\nfeigh:\n  hystrix:\n    enable: true\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: hystrix.stream,mappings\n  \nparams:\n  p1: 1111','e1386b364dbb9ca2dc9796b594ce9dc9','2020-05-20 05:57:58','2020-05-20 13:57:58',NULL,'172.19.0.1','U',''),(0,16,'gateway.yml','DEFAULT_GROUP','','server:\n  port: 10000\n  \n','f40b67dabff5ac8b1e89af7bacb382b4','2020-05-20 06:34:03','2020-05-20 14:34:03',NULL,'172.19.0.1','I',''),(10,17,'gateway.yml','DEFAULT_GROUP','','server:\n  port: 10000\n  \n','f40b67dabff5ac8b1e89af7bacb382b4','2020-05-20 07:29:42','2020-05-20 15:29:43',NULL,'172.19.0.1','U',''),(10,18,'gateway.yml','DEFAULT_GROUP','','server:\n  port: 10000\n  \nspring:\n  cloud:\n    gateway:\n      routes:\n      - id: api-a\n        uri: lb://service-a\n        predicates:\n        - Path=//api-a/**\n        filters:\n        - name: CircuitBreaker\n          args:\n            name: fetchIngredients\n            fallbackUri: forward:/fallback\n      ','316a7de95134b2ed86da57cb667035e2','2020-05-20 07:49:14','2020-05-20 15:49:14',NULL,'172.19.0.1','U',''),(10,19,'gateway.yml','DEFAULT_GROUP','','server:\n  port: 10000\n  \nspring:\n  cloud:\n    gateway:\n      routes:\n      - id: api-a\n        uri: lb://service-a\n        predicates:\n        - Path=//**\n        filters:\n        - name: CircuitBreaker\n          args:\n            name: fetchIngredients\n            fallbackUri: forward:/fallback\n      ','03ba0e75dc0a8a6e783183fdb34d1c07','2020-05-20 07:51:58','2020-05-20 15:51:57',NULL,'172.19.0.1','U',''),(10,20,'gateway.yml','DEFAULT_GROUP','','server:\n  port: 10000\n  \nspring:\n  cloud:\n    gateway:\n      routes:\n      - id: api-a\n        uri: http://localhost:9000\n        predicates:\n        - Path=//**\n        filters:\n        - name: CircuitBreaker\n          args:\n            name: fetchIngredients\n            fallbackUri: forward:/fallback\n      ','2d0b6de10c63ecb4b9226bae250ed9ff','2020-05-20 07:54:13','2020-05-20 15:54:13',NULL,'172.19.0.1','U',''),(10,21,'gateway.yml','DEFAULT_GROUP','','server:\n  port: 10000\n  \nspring.cloud.gateway.discovery.locator.enabled=true\n\nspring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n      - id: api-a\n        uri: lb://service-a\n        predicates:\n        - Path=//**\n        filters:\n        - name: CircuitBreaker\n          args:\n            name: fetchIngredients\n            fallbackUri: forward:/fallback\n      ','462e6b38f370739a25f2c18b732f3551','2020-05-20 07:54:22','2020-05-20 15:54:22',NULL,'172.19.0.1','U',''),(10,22,'gateway.yml','DEFAULT_GROUP','','server:\n  port: 10000\n\nspring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n      - id: api-a\n        uri: lb://service-a\n        predicates:\n        - Path=//**\n        filters:\n        - name: CircuitBreaker\n          args:\n            name: fetchIngredients\n            fallbackUri: forward:/fallback\n      ','76bf440af35491ffa4d04eb779dfdcfb','2020-05-20 07:54:39','2020-05-20 15:54:40',NULL,'172.19.0.1','U',''),(10,23,'gateway.yml','DEFAULT_GROUP','','server:\n  port: 10000\n\nspring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n      - id: api-a\n        uri: lb://service-a\n        predicates:\n        - Path=//**      \n      ','84efde721bbee09a70eb762016ed31a8','2020-05-20 07:57:10','2020-05-20 15:57:10',NULL,'172.19.0.1','U',''),(10,24,'gateway.yml','DEFAULT_GROUP','','server:\n  port: 10000\n\nspring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true','0f90915d0a03cfc7407d02bdbf04dd50','2020-05-20 08:23:05','2020-05-20 16:23:04',NULL,'172.19.0.1','U',''),(10,25,'gateway.yml','DEFAULT_GROUP','','server:\n  port: 10000\n\nspring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n      - id: hystrix_route        \n        predicates:\n        - Path=/**\n        filters:\n        - name: Hystrix\n          args:\n            name: fallbackcmd\n            fallbackUri: forward:/fallback       ','4fcef0b26d38189735092da26ab73392','2020-05-20 08:29:18','2020-05-20 16:29:18',NULL,'172.19.0.1','U',''),(10,26,'gateway.yml','DEFAULT_GROUP','','server:\n  port: 10000\n\nspring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n      - id: hystrix_route\n        uri: lb://service-a        \n        predicates:\n        - Path=/**\n        filters:\n        - name: Hystrix\n          args:\n            name: fallbackcmd\n            fallbackUri: forward:/fallback       ','dc332d78e6b69bac9885e31781faf901','2020-05-20 08:30:56','2020-05-20 16:30:56',NULL,'172.19.0.1','U',''),(10,27,'gateway.yml','DEFAULT_GROUP','','server:\n  port: 10000\n\nspring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n      - id: hystrix_route\n        uri: lb://service-a        \n        predicates:\n        - Path=/service-a/**\n        filters:\n        - name: Hystrix\n          args:\n            name: fallbackcmd\n            fallbackUri: forward:/fallback       ','7c8f0bd3fec38707f9bc1b8b0b98deaf','2020-05-20 08:32:59','2020-05-20 16:32:58',NULL,'172.19.0.1','U',''),(10,28,'gateway.yml','DEFAULT_GROUP','','server:\n  port: 10000\n\nspring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      ','4e5eeef626fc0626b74c1e2217999565','2020-05-20 08:37:22','2020-05-20 16:37:22',NULL,'172.19.0.1','U',''),(10,29,'gateway.yml','DEFAULT_GROUP','','server:\n  port: 10000\n\nspring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true','0f90915d0a03cfc7407d02bdbf04dd50','2020-05-20 08:37:38','2020-05-20 16:37:38',NULL,'172.19.0.1','U',''),(10,30,'gateway.yml','DEFAULT_GROUP','','server:\n  port: 10000\n\nspring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true','0f90915d0a03cfc7407d02bdbf04dd50','2020-05-20 08:38:38','2020-05-20 16:38:38',NULL,'172.19.0.1','U',''),(10,31,'gateway.yml','DEFAULT_GROUP','','server:\n  port: 10000\n\nspring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n      - id: hystrix_route\n        uri: lb://service-a        \n        predicates:\n        - Path=/service-a/**\n        filters:\n        - name: Hystrix\n          args:\n            name: fallbackcmd\n            fallbackUri: forward:/fallback       ','7c8f0bd3fec38707f9bc1b8b0b98deaf','2020-05-20 08:39:29','2020-05-20 16:39:29',NULL,'172.19.0.1','U',''),(10,32,'gateway.yml','DEFAULT_GROUP','','server:\n  port: 10000\n\nspring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n      - id: hystrix_route\n        uri: lb://service-a/service-a        \n        predicates:\n        - Path=/service-a/**\n        filters:\n        - name: Hystrix\n          args:\n            name: fallbackcmd\n            fallbackUri: forward:/fallback       ','8316708c0a97c8a822ab10f3be48ce44','2020-05-20 08:39:46','2020-05-20 16:39:46',NULL,'172.19.0.1','U',''),(10,33,'gateway.yml','DEFAULT_GROUP','','server:\n  port: 10000\n\nspring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n      - id: hystrix_route\n        uri: lb://service-a/service-a        \n        predicates:\n        - Path=/service-a/**\n        filters:\n        - name: Hystrix\n          args:\n            name: fallbackcmd\n            fallbackUri: forward:/fallback       ','8316708c0a97c8a822ab10f3be48ce44','2020-05-20 08:43:01','2020-05-20 16:43:01',NULL,'172.19.0.1','U',''),(10,34,'gateway.yml','DEFAULT_GROUP','','server:\n  port: 10000\n\nspring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n      - id: hystrix_route\n        uri: lb://service-a/\n        predicates:\n        - Path=/service-a/**\n        filters:\n        - name: Hystrix\n          args:\n            name: fallbackcmd\n            fallbackUri: forward:/fallback       ','676eba3ac50dc29169bb7b3cd3546f11','2020-05-20 08:44:31','2020-05-20 16:44:31',NULL,'172.19.0.1','U',''),(4,35,'service-b.yml','DEFAULT_GROUP','','server:\n  port: 9001\n  \nparams:\n  p2: 2222','b13942aa218b9797cd3c2b2a17c847ff','2020-05-20 08:44:44','2020-05-20 16:44:44',NULL,'172.19.0.1','U',''),(5,36,'service-a.yml','DEFAULT_GROUP','','server:\n  port: 9000\n\nfeign:\n  hystrix:\n    enabled: true\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: hystrix.stream,mappings\n  \nparams:\n  p1: 1111','f62b6b652e9b62682ddae96823507cd2','2020-05-20 08:44:58','2020-05-20 16:44:58',NULL,'172.19.0.1','U',''),(8,37,'hystrix-dashboard.yml','DEFAULT_GROUP','','server:\n  port: 9002\n\n','0414b33b9f256e62f0c7decdaa813a27','2020-05-20 08:45:27','2020-05-20 16:45:27',NULL,'172.19.0.1','U',''),(10,38,'gateway.yml','DEFAULT_GROUP','','server:\n  port: 10000\n  servlet:\n    context-path: /\n\nspring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n      - id: hystrix_route\n        uri: lb://service-a/\n        predicates:\n        - Path=/service-a/**\n        filters:\n        - name: Hystrix\n          args:\n            name: fallbackcmd\n            fallbackUri: forward:/fallback       ','ffce38c9f15ffa540791adae654cce78','2020-05-21 02:02:01','2020-05-21 10:02:01',NULL,'172.19.0.1','U',''),(5,39,'service-a.yml','DEFAULT_GROUP','','server:\n  port: 9000\n  servlet:\n    context-path: /service-a\n\nfeign:\n  hystrix:\n    enabled: true\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: hystrix.stream,mappings\n  \nparams:\n  p1: 1111','928a363e1704ddda6bfa17df38915765','2020-05-21 02:02:22','2020-05-21 10:02:22',NULL,'172.19.0.1','U',''),(4,40,'service-b.yml','DEFAULT_GROUP','','server:\n  port: 9001\n  servlet:\n    context-path: /service-b\n  \nparams:\n  p2: 2222','64fb92e14bf18d582b3bac8ae1e266f7','2020-05-21 02:02:40','2020-05-21 10:02:41',NULL,'172.19.0.1','U',''),(4,41,'service-b.yml','DEFAULT_GROUP','','server:\n  port: 9001\n  servlet:\n    context-path: /service-b\n\nspring:\n  zipkin:\n    baseUrl: http://127.0.0.1:9411/\n      \nparams:\n  p2: 2222','a866952e068c7bb049017aacf8349780','2020-05-21 02:05:09','2020-05-21 10:05:09',NULL,'172.19.0.1','U',''),(5,42,'service-a.yml','DEFAULT_GROUP','','server:\n  port: 9000\n  servlet:\n    context-path: /service-a\n\nspring:\n  zipkin:\n    baseUrl: http://127.0.0.1:9411/\n\nfeign:\n  hystrix:\n    enabled: true\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: hystrix.stream,mappings\n  \nparams:\n  p1: 1111','0202080e29605c5f6bba9382714714bf','2020-05-21 02:05:27','2020-05-21 10:05:27',NULL,'172.19.0.1','U',''),(10,43,'gateway.yml','DEFAULT_GROUP','','server:\n  port: 10000\n  servlet:\n    context-path: /\n\nspring:\n  zipkin:\n    baseUrl: http://127.0.0.1:9411/\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n      - id: hystrix_route\n        uri: lb://service-a/\n        predicates:\n        - Path=/service-a/**\n        filters:\n        - name: Hystrix\n          args:\n            name: fallbackcmd\n            fallbackUri: forward:/fallback       ','44d0b62530213d4b0d70b5de7eaef4d9','2020-05-21 02:05:37','2020-05-21 10:05:38',NULL,'172.19.0.1','U','');
/*!40000 ALTER TABLE `his_config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `resource` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('nacos','ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_capacity`
--

DROP TABLE IF EXISTS `tenant_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='租户容量信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_capacity`
--

LOCK TABLES `tenant_capacity` WRITE;
/*!40000 ALTER TABLE `tenant_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_info`
--

DROP TABLE IF EXISTS `tenant_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='tenant_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_info`
--

LOCK TABLES `tenant_info` WRITE;
/*!40000 ALTER TABLE `tenant_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('nacos','$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-21  2:29:41
