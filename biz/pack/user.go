package pack

import (
	"bulebook/biz/model/api"
	"bulebook/dal/db"
	"strconv"
)

func BuildUser(u *db.User) *api.User {
	return &api.User{
		ID:       strconv.Itoa(int(u.ID)),
		Username: u.Username,
		Avatar:   u.Avatar,
		Email:    u.Email,
		Major:    u.Major,
	}
}

func BuildUserList(list []*db.User) []*api.User {
	resp := make([]*api.User, len(list))
	for i, data := range list {
		resp[i] = BuildUser(data)
	}
	return resp
}
