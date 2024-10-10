package service

import (
	"bluebook/biz/model/api"
	"bluebook/dal/db"
	"context"
	"fmt"
	"strings"
)

type ProjectService struct {
	ctx context.Context
}

func NewProjectService(ctx context.Context) *ProjectService {
	return &ProjectService{ctx: ctx}
}

func (s *ProjectService) CreateProject(req *api.PublishRequesnt) error {
	dao := db.NewDao(s.ctx)
	projectModel := &db.Project{
		Title:       req.Title,
		Description: req.Description,
		Username:    req.Username,
		Types:       strings.Join(req.Types, ","),
		Numbers:     1,
	}
	err := dao.CreateProject(projectModel)
	if err != nil {
		return fmt.Errorf("service.CreateProject failed, err: %v", err)
	}
	return nil
}

func (s *ProjectService) Search(req *api.SearchProjectRequest) ([]*db.Project, error) {
	dao := db.NewDao(s.ctx)
	projects, err := dao.SearchProjectByTypes(req.Keyword)
	if err != nil {
		return nil, fmt.Errorf("service.Search failed, err: %v", err)
	}
	return projects, nil
}
