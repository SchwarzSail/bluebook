
CREATE TABLE bulebook.user
(
    `id`         INT AUTO_INCREMENT PRIMARY KEY,
    `username`   varchar(255),
    `password`   varchar(255),
    `avatar`     varchar(255),
    `email` varchar(255),
    `major` varchar(255),
) engine = InnoDB
  default charset = utf8mb4;
CREATE INDEX idx_username ON bulebook.user (username);

/*user_project 关系表*/
CREATE TABLE bulebook.user_project (
    `user_id` INT,
    `project_id` INT,
    PRIMARY KEY (`user_id`, `project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;