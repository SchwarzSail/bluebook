namespace go api
include "model.thrift"


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
    1: model.User user
}

service UserService {
    RegisterResponse Register(1: RegisterRequest req) (api.post="book/user/register")
    LoginResponse Login(1: LoginRequest req) (api.post="book/user/login")
}


struct PublishRequesnt {
    1: required string title
    2: required string username
    3: required string description
    4: required list<string> types
}

struct PublishResponse {

}

service ProjectService {
    PublishResponse Publish(1: PublishRequesnt req) (api.post="book/project/publish")
}
