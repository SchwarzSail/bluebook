CREATE DATABASE IF NOT EXISTS bulebook;
CREATE TABLE bulebook.user
(
    `id`       INT AUTO_INCREMENT PRIMARY KEY,
    `username` varchar(255),
    `password` varchar(255),
    `avatar`   varchar(255),
    `email`    varchar(255),
    `major`    varchar(255),
    `account`  varchar(255)
) engine = InnoDB
  default charset = utf8mb4;
CREATE INDEX idx_username ON bulebook.user (username);
CREATE INDEX idx_account ON bulebook.user (account);
CREATE TABLE bulebook.user_project
(
    `username`   varchar(255),
    `project_id` INT,
    PRIMARY KEY (`username`, `project_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;