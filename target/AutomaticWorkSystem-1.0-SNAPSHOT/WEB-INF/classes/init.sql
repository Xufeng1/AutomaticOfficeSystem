CREATE SCHEMA IF NOT EXISTS `office_sys`
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE `office_sys`;

CREATE TABLE IF NOT EXISTS `user` (
  `id`              INT UNSIGNED       NOT NULL AUTO_INCREMENT                  COMMENT 'id',
  `name`            VARCHAR(50)        NOT NULL DEFAULT ''                      COMMENT '用户名',
  `email`           VARCHAR(20)        NOT NULL DEFAULT ''                      COMMENT '邮箱',
  `phone`           VARCHAR(11)        NOT NULL DEFAULT ''                      COMMENT '手机号',
  `address`         VARCHAR(50)        NOT NULL DEFAULT ''                      COMMENT '联系地址',
  `department_id`   INT                NOT NULL DEFAULT 0                       COMMENT '用户所属部门id',
  `password`        VARCHAR(6)         NOT NULL DEFAULT ''                      COMMENT '登录密码',
  `user_type`       INT                NOT NULL DEFAULT 0                       COMMENT '用户类型 0-普通用户 1-管理员用户',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email`(`email`)
) ENGINE InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '用户信息';

CREATE TABLE IF NOt EXISTS `leave`(
  `id`                  INT UNSIGNED         NOT NULL AUTO_INCREMENT                    COMMENT 'id',
  `user_id`             INT                  NOT NULL DEFAULT 0                         COMMENT '请假员工id',
  `application_time`    TIMESTAMP            NOT NULL DEFAULT '0000-00-00 00:00:00'     COMMENT '请假申请时间',
  `leave_time`          DATE                 NOT NULL DEFAULT '0000-00-00'              COMMENT '离开日期',
  `bace_time`           DATE                 NOT NULL DEFAULT '0000-00-00'              COMMENT '返回日期',
  `reason`              VARCHAR(50)          NOT NULL DEFAULT ''                        COMMENT '请假原因',
  `status`              INT                  NOT NULL DEFAULT 0                         COMMENT '请假申请状态 0-等待通过 1-通过 2-未通过',
  PRIMARY KEY (`id`)
) ENGINE InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '请假信息';

CREATE TABLE IF NOt EXISTS `meeting`(
  `id`                  INT UNSIGNED         NOT NULL AUTO_INCREMENT                    COMMENT 'id',
  `users`               VARCHAR(255)         NOT NULL DEFAULT ''                        COMMENT '参与员工id 以","分隔',
  `title`               VARCHAR(50)          NOT NULL DEFAULT ''                        COMMENT '会议标题',
  `content`             VARCHAR(1000)        NOT NULL DEFAULT ''                        COMMENT '会议内容',
  `start_time`          TIMESTAMP            NOT NULL DEFAULT '0000-00-00 00:00:00'     COMMENT '开始时间',
  PRIMARY KEY (`id`)
) ENGINE InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '会议信息';

CREATE TABLE IF NOt EXISTS `notice`(
  `id`                  INT UNSIGNED         NOT NULL AUTO_INCREMENT                    COMMENT 'id',
  `users`               VARCHAR(255)         NOT NULL DEFAULT ''                        COMMENT '通知员工 以","分隔',
  `title`               VARCHAR(50)          NOT NULL DEFAULT ''                        COMMENT '通知标题',
  `content`             VARCHAR(1000)        NOT NULL DEFAULT ''                        COMMENT '通知内容',
  `start_time`          TIMESTAMP            NOT NULL DEFAULT '0000-00-00 00:00:00'     COMMENT '通知时间',
  PRIMARY KEY (`id`)
) ENGINE InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '通知';


CREATE TABLE IF NOT EXISTS `login_log` (
  `id`                INT UNSIGNED       NOT NULL AUTO_INCREMENT                  COMMENT 'id',
  `user_id`           INT                NOT NULL DEFAULT 0                       COMMENT '用户id',
  `login_time`        TIMESTAMP          NOT NULL DEFAULT '0000-00-00 00:00:00'   COMMENT '操作时间',
  `login_type`        TINYINT UNSIGNED   NOT NULL DEFAULT 1                       COMMENT '操作类型,1代表登录,0代表退出',
  PRIMARY KEY (`id`)
) ENGINE InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '用户登录登出信息表';

CREATE TABLE IF NOT EXISTS `bulletin` (
  `id`                       INT UNSIGNED   NOT NULL AUTO_INCREMENT                  COMMENT 'id',
  `title`                    VARCHAR(50)    NOT NULL DEFAULT ''                      COMMENT '公告标题',
  `content`                  VARCHAR(1000)  NOT NULL DEFAULT ''                      COMMENT '公告内容',
  `owner_id`                 INT            NOT NULL DEFAULT 0                       COMMENT '公告发布者的id',
  `last_modifier_id`         INT            NOT NULL DEFAULT 0                       COMMENT '这个公告最后一个修改者的id',
  `release_time`             TIMESTAMP      NOT NULL DEFAULT '0000-00-00 00:00:00'   COMMENT '公告的发布时间',
  `last_modification_time`   TIMESTAMP      NOT NULL DEFAULT '0000-00-00 00:00:00'   COMMENT '公告的最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '公告表';