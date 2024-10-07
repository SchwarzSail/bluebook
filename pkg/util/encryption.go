package utils

import (
	"fmt"
	"golang.org/x/crypto/bcrypt"
)

func SetPassword(password string) (string, error) {
	bytes, err := bcrypt.GenerateFromPassword([]byte(password), 12)
	if err != nil {
		return "", fmt.Errorf("utils.SetPassword failed, err: %v", err)
	}
	return string(bytes), nil
}

// CheckPassword dest代表用户发过来的，src代表数据库中保存的
func CheckPassword(password, hashPassword string) bool {
	err := bcrypt.CompareHashAndPassword([]byte(hashPassword), []byte(password))
	return err == nil
}
