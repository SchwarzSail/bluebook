package pack

import (
	"bluebook/biz/model/model"
	"bluebook/dal/db"
)

func BuildUser(u *db.User) *model.User {
	return &model.User{
		Account:  u.Account,
		Username: u.Username,
		Avatar:   u.Avatar,
		Email:    u.Email,
		Major:    u.Major,
	}
}

func BuildUserList(list []*db.User) []*model.User {
	resp := make([]*model.User, len(list))
	for i, data := range list {
		resp[i] = BuildUser(data)
	}
	return resp
}
