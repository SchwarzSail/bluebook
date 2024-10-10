package pack

import (
	"bluebook/biz/model/model"
	"bluebook/dal/db"
)

func BuildProject(p *db.Project) *model.Project {
	return &model.Project{
		Title:       p.Title,
		Description: p.Description,
		Username:    p.Username,
		Types:       p.Types,
		Numbers:     string(rune(p.Numbers)),
	}
}

func BuildProjectList(list []*db.Project) []*model.Project {
	resp := make([]*model.Project, len(list))
	for i, data := range list {
		resp[i] = BuildProject(data)
	}
	return resp
}
