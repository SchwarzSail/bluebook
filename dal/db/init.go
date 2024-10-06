package db

import (
	"bulebook/config"
	"bulebook/pkg/logger"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/schema"
)

var DB *gorm.DB

func InitMySQL() {
	conf := config.Config.Mysql
	dsn := conf.UserName + ":" + conf.MysqlPassword + "@tcp(" + conf.DbHost + ":" + conf.DbPort + ")/" + conf.DbName + "?charset=utf8mb4&parseTime=True&loc=Local"
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{
		NamingStrategy: schema.NamingStrategy{SingularTable: true},
	})
	if err != nil {
		logger.Fatalf("db.InitMySQL: open mysql error: %v", err)
	}

	DB = db
}
