package utils

import (
	"bulebook/pkg/constants"
	"github.com/golang-jwt/jwt"
	"time"
)

type Claims struct {
	ID       string
	UserName string
	jwt.StandardClaims
}

// GenerateToken 签发token
func GenerateToken(uid string, username string) (accessToken string, err error) {
	claims := &Claims{
		ID:       uid,
		UserName: username,
		StandardClaims: jwt.StandardClaims{
			ExpiresAt: (time.Now().Add(24 * 30 * time.Hour)).Unix(),
			Issuer:    "bulebook",
		},
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	accessToken, err = token.SignedString([]byte(constants.JwtSecret))
	if err != nil {
		return "", err
	}
	return accessToken, nil
}

func ParseToken(token string) (*Claims, bool, error) {
	tokenClaims, err := jwt.ParseWithClaims(token, &Claims{}, func(token *jwt.Token) (interface{}, error) {
		return []byte(constants.JwtSecret), nil
	})
	if tokenClaims != nil {
		if claims, ok := tokenClaims.Claims.(*Claims); ok && tokenClaims.Valid {
			return claims, true, nil
		}
	}
	return nil, false, err
}
