package middleware

import (
	"bluebook/biz/model"
	"bluebook/biz/pack"
	"bluebook/pkg/errno"
	"bluebook/pkg/logger"
	utils "bluebook/pkg/util"
	"context"

	"github.com/cloudwego/hertz/pkg/app"
)

func JWT() app.HandlerFunc {
	return func(ctx context.Context, c *app.RequestContext) {
		token := string(c.GetHeader("token"))
		if token == "" {
			logger.Error("middleware.JWT token is empty")
			pack.RespError(c, errno.AuthorizationFailedErr)
			c.Abort()
			return
		}

		_, valid, _ := utils.ParseToken(token)

		// 过期，需要重新登录
		if !valid {
			logger.Error("middleware.JWT token is invalid")
			pack.RespError(c, errno.AuthorizationFailedErr)
			c.Abort()
			return
		}
		c.Header("token", token)
		claims, _, _ := utils.ParseToken(token)
		ctx = model.NewContext(ctx, &model.UserInfo{ID: claims.ID, UserName: claims.UserName})
		c.Next(ctx)
	}
}
