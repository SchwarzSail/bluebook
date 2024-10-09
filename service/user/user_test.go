package service

import (
	"bluebook/biz/model/api"
	"bluebook/dal/db"
	"context"
	"testing"

	"github.com/bytedance/mockey"
	"github.com/stretchr/testify/assert"
)

func Test_Register(t *testing.T) {
	l := NewUserService(context.Background())
	// 模拟请求参数
	req := api.RegisterRequest{
		Account:  "123456",
		Username: "xxxx",
		Password: "123456",
		Email:    "",
		Major:    "",
		Avator:   nil,
	}
	// Mock the NewUserDao to return a pointer to a mocked DAO
	mockDao := new(db.Dao)
	mockey.Mock(db.NewDao).Return(mockDao).Build()
	// Mock the CreateUser method to simulate successful user creation
	mockey.Mock((*db.Dao).CreateUser).Return(nil).Build()

	err := l.Register(&req)
	assert.Nil(t, err)
}
