package service

import (
	"bulebook/biz/model/api"
	"bulebook/dal/db"
	"context"
	"github.com/bytedance/mockey"
	"github.com/stretchr/testify/assert"
	"testing"
)

func Test_Register(t *testing.T) {
	l := NewUserService(context.Background())
	// 模拟请求参数
	req := api.RegisterRequest{
		Account:  "123456",
		Username: "xxxx",
		Password: "123456",
		Email:    "",
		Majoy:    "",
		Avator:   nil,
	}
	// Mock the NewUserDao to return a pointer to a mocked DAO
	mockDao := new(db.UserDao)
	mockey.Mock(db.NewUserDao).Return(mockDao).Build()
	// Mock the CreateUser method to simulate successful user creation
	mockey.Mock((*db.UserDao).CreateUser).Return(nil).Build()

	err := l.Register(&req)
	assert.Nil(t, err)
}
