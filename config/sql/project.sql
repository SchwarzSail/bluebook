
CREATE TABLE bulebook.project
(
    `id`         INT AUTO_INCREMENT PRIMARY KEY,
    `title`       varchar(255),
    `description`   varchar(255),
    `username`  varchar(255),
    `numbers` INT,
    `types` TEXT #考虑使用ENUM类型
) engine = InnoDB
  default charset = utf8mb4;
