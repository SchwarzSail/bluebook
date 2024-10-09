package db

import (
	"fmt"
)

type User struct {
	ID       uint   `gorm:"primaryKey"`
	Account  string `gorm:"account"`
	Username string `gorm:"username"`
	Password string `gorm:"password"`
	Avatar   string `gorm:"avatar"`
	Email    string `gorm:"email"`
	Major    string `gorm:"major"`
	Role     string `gorm:"role"`
}

func (dao *Dao) CreateUser(user *User) (err error) {
	//先判断是不是已经创建过了
	_, err = dao.GetUserByAccount(user.Account)
	if err == nil {
		return fmt.Errorf("dal.CreateUser failed, err: %v", "user existed")
	}
	err = dao.DB.Create(user).Error
	if err != nil {
		return fmt.Errorf("dal.CreateUser failed, err: %v", err)
	}
	return nil
}

func (dao *Dao) GetUserByAccount(account string) (*User, error) {
	user := new(User)
	err := dao.DB.Where("account = ?", account).First(&user).Error
	if err != nil {
		return nil, fmt.Errorf("dal.GetUserByAccount failed, err: %v", err)
	}
	return user, nil
}

func (dao *Dao) GetUserByUsername(username string) (*User, error) {
	user := new(User)
	err := dao.DB.Where("username = ?", username).First(&user).Error
	if err != nil {
		return nil, fmt.Errorf("dal.GetUserByUsername failed, err: %v", err)
	}
	return user, nil
}

func (dao *Dao) GetUserByUid(uid int) (*User, error) {
	user := new(User)
	err := dao.DB.Where("id = ?", uid).First(&user).Error
	if err != nil {
		return nil, fmt.Errorf("dal.GetUserByUid failed, err: %v", err)
	}
	return user, nil
}
