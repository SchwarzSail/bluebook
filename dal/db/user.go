package db

import (
	"context"
	"fmt"
	"gorm.io/gorm"
)

type User struct {
	ID       string `gorm:"primaryKey"`
	Username string `gorm:"username"`
	Password string `gorm:"password"`
	Avatar   string `gorm:"avatar"`
	Email    string `gorm:"email"`
	Major    string `gorm:"major"`
}

type UserDao struct {
	*gorm.DB
}

func NewDBClient(ctx context.Context) *gorm.DB {
	db := DB
	return db.WithContext(ctx)
}

func (dao *UserDao) CreateUser(user *User) (err error) {
	err = dao.DB.Model(&User{}).Create(user).Error
	if err != nil {
		return fmt.Errorf("dal.CreateUser failed, err: %v", err)
	}
	return nil
}
