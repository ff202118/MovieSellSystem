/*
SQLyog Professional v12.08 (64 bit)
MySQL - 8.0.32 : Database - mydb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mydb`;

/*Table structure for table `movie` */

DROP TABLE IF EXISTS `movie`;

CREATE TABLE `movie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '未知',
  `direct` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '佚名',
  `publisher` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '未知',
  `sellPrice` double NOT NULL DEFAULT '0',
  `prePrice` double NOT NULL DEFAULT '0',
  `stock` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `movie` */

insert  into `movie`(`id`,`name`,`direct`,`publisher`,`sellPrice`,`prePrice`,`stock`) values (2,'指环王','彼得·杰克逊','华纳兄弟',40,35,85),(3,'泰坦尼克号','詹姆斯·卡梅隆','20世纪福斯',78,45,130),(4,'星球大战','乔治·卢卡斯','20世纪福斯',45,27,52),(5,'哈利·波特','克里斯·哥伦布','华纳兄弟',86,70,52),(6,'速度与激情','罗伯特·卢卡斯','环球影业',28.8,18,54),(7,'超人总动员','迈克尔·贝','派拉蒙影业',42,32,33),(8,'侏罗纪公园','蒂文·斯皮尔伯格','环球影业',36,35,400),(9,'霍比特人','彼得·杰克逊','华纳兄弟',58,49,59),(10,'包法利夫人','(法)福楼拜','人民文学出版社',28.8,14.3,44),(11,'史瑞克','安德鲁·亚当森','梦工厂',38,29,27),(12,'钢铁侠','乔恩·费儒','漫威影业和派拉蒙影业',39,29,53),(13,'神偷奶爸','皮艾尔·柯芬','环球影业',48,43,120),(14,'狮子王','罗杰·阿勒斯','华特迪士尼影业',86,45,460),(15,'变脸','约翰·吉尔伯特','派拉蒙影业',56,49,130),(18,'阿凡达','詹姆斯·卡梅隆','20世纪福斯',50,35,100);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT 'user',
  `password` varchar(20) NOT NULL DEFAULT '123456',
  `authority` int NOT NULL DEFAULT '0' COMMENT '0:普通用户 1:管理员',
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`password`,`authority`,`phone`,`email`) values (10000,'admin','admin123',1,'13805461334','admin@admin.com'),(10001,'user','1234567',0,'45343783783','374487867@af.com'),(10002,'5434','45345',0,'12125768378','86afa7378@dg.com'),(10004,'赵','159357',0,'45343876715','435786786@ai.com'),(10005,'我','123456',0,'57863543445','453738678@as.com'),(10007,'user1','1234567',0,NULL,NULL),(10008,'user2','123456',0,NULL,NULL),(10009,'user3','147852',0,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
