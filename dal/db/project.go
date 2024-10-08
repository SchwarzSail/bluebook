package db

import (
	"fmt"
)

type Project struct {
	ID          uint   `gorm:"primaryKey;autoIncrement"`
	Title       string `gorm:"title"`
	Description string `gorm:"description"`
	Username    string `gorm:"username"`
	Types       string `gorm:"types"`
	Numbers     int    `gorm:"numbers"`
}

func (dao *Dao) CreateProject(project *Project) error {
	err := dao.DB.Create(project).Error
	if err != nil {
		return fmt.Errorf("dal.CreateProject failed, err: %v", err)
	}
	return nil
}

// GetProjectByUsername 找出该user创建的所有project
func (dao *Dao) GetProjectByUsername(username string) ([]Project, error) {
	var projects []Project
	err := dao.DB.Where("username = ?", username).Find(&projects).Error
	if err != nil {
		return nil, fmt.Errorf("dal.GetProjectByUsername failed, err: %v", err)
	}
	return projects, nil
}

// GetAllProjectByUsername 找出user所参加的所有projects
func (dao *Dao) GetAllProjectByUsername(username string) ([]Project, error) {
	var projects []Project
	err := dao.DB.Raw(`
		SELECT p.*
		FROM projects p
		JOIN user_project up ON p.id = up.project_id
		WHERE up.username = ?
	`, username).Scan(&projects).Error
	if err != nil {
		return nil, fmt.Errorf("dal.GetAllProjectByUsername failed, err: %v", err)
	}
	return projects, nil
}
