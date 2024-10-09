package db

import (
	"bluebook/config"
	"bluebook/pkg/logger"
	"context"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/schema"
)

var DB *gorm.DB

type Dao struct {
	*gorm.DB
}

func NewDBClient(ctx context.Context) *gorm.DB {
	db := DB
	return db.WithContext(ctx)
}

func NewDao(ctx context.Context) *Dao {
	if ctx == nil {
		ctx = context.Background()
	}
	return &Dao{NewDBClient(ctx)}
}

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
