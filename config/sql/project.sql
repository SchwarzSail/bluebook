
CREATE TABLE bulebook.project
(
    `id`         INT AUTO_INCREMENT PRIMARY KEY,
    `title`       varchar(255),
    `description`   varchar(255),
    `username`  varchar(255),
    `numbers` INT
) engine = InnoDB
  default charset = utf8mb4;
