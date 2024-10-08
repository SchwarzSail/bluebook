package service

import (
	"bulebook/biz/model/api"
	"bulebook/dal/db"
	utils "bulebook/pkg/util"
	"context"
	"fmt"
)

type UserService struct {
	ctx context.Context
}

// NewUserService new UserService
func NewUserService(ctx context.Context) *UserService {
	return &UserService{ctx: ctx}
}

func (s *UserService) Register(req *api.RegisterRequest) error {
	dao := db.NewDao(s.ctx)
	//加密🔐密码
	passwd, err := utils.SetPassword(req.Password)
	if err != nil {
		return fmt.Errorf("service.Register failed, err: %v", err)
	}
	//保证不出现空指针错误
	if req.Avator == nil {
		req.Avator = new(string)
		*req.Avator = ""
	}
	userModel := &db.User{
		Username: req.Username,
		Password: passwd,
		Avatar:   *req.Avator,
		Major:    req.Major,
		Email:    req.Email,
		Account:  req.Account,
	}
	err = dao.CreateUser(userModel)
	if err != nil {
		return fmt.Errorf("service.Register failed, err: %v", err)
	}
	return nil
}

func (s *UserService) Login(req *api.LoginRequest) (*db.User, error) {
	dao := db.NewDao(s.ctx)
	user, err := dao.GetUserByAccount(req.Account)
	if err != nil {
		return nil, fmt.Errorf("service.Login failed, err: %v", err)
	}
	//校验密码
	if !utils.CheckPassword(req.Password, user.Password) {
		return nil, fmt.Errorf("service.Login failed, err: %v", "invalid password")
	}
	return user, nil
}
