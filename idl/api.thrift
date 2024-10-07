namespace go api

struct User {
    1: string id //账号
    2: string username
    3: string major //专业
    4: string email //邮箱
    5: string avatar //头像
}

struct RegisterRequest {
    1: string username
    2: string password
    3: string email
    4: string major
    5: optional string avator
    6: string account
}

struct RegisterResponse {
}

struct LoginRequest {
    1: string account
    2: string password
}

struct LoginResponse {
    1: User user
}

struct Project {
    1: string title
    2: string description
    3: string username//发起人
    4: string numbers//参与人数
}

service UserService {
    RegisterResponse Register(1: RegisterRequest req) (api.post="book/user/register")
    LoginResponse Login(1: LoginRequest req) (api.post="book/user/login")
}