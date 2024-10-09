package errno

const (
	SuccessCode = 10000 + iota
	ServiceErrCode
	ParamErrCode
	PageOutOfRangeCode
	// user
	UserAlreadyExistErrCode
	UserNotExistErrCode
	AuthorizationFailedErrCode

	// utils
	UploadErrCode
)
