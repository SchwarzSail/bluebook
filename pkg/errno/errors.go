package errno

var (
	Success        = NewErrNo(SuccessCode, "success")
	ServiceErr     = NewErrNo(ServiceErrCode, "Service is unable to start successfully")
	ParamErr       = NewErrNo(ParamErrCode, "Wrong Parameter has been given")
	PageOutOfRange = NewErrNo(PageOutOfRangeCode, "分页查询超出范围")
	// user
	UserAlreadyExistErr    = NewErrNo(UserAlreadyExistErrCode, "User already exists")
	UserNotExist           = NewErrNo(UserNotExistErrCode, "User doesn't exists")
	AuthorizationFailedErr = NewErrNo(AuthorizationFailedErrCode, "Authorization failed")

	// utils
	UploadErr = NewErrNo(UploadErrCode, "Upload failed")
)
