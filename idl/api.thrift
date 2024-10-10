namespace go api
include "model.thrift"

struct RegisterRequest {
    1: string username
    2: string password
    3: string email
    4: string major
    5: optional string avator
    6: string account
    7: string role
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

struct GetinfoRequest{
    1: string account
}

struct GetinfoResponse{
    1: model.User user
}

service UserService {
    RegisterResponse Register(1: RegisterRequest req) (api.post="book/user/register")
    LoginResponse Login(1: LoginRequest req) (api.post="book/user/login")
    GetinfoResponse Getinfo(1: GetinfoRequest req) (api.get="book/user/info")
}


struct PublishRequesnt {
    1: required string title
    2: required string username
    3: required string description
    4: required list<string> types
}

struct PublishResponse {

}

struct SearchProjectRequest {
    1: required string keyword
}

struct SearchProjectResponse {
    1: list<model.Project> projects
}

struct JoinProjectRequest {
    1: required string username
    2: required string email
    3: required string major
    4: optional string reasion
    5: required string project_id
}

struct JoinProjectResponse {

}

service ProjectService {
    PublishResponse Publish(1: PublishRequesnt req) (api.post="book/project/publish")
    SearchProjectResponse Search(1: SearchProjectRequest req) (api.get="book/project/search")
    JoinProjectResponse Join(1: JoinProjectRequest req) (api.post="book/project/join")
}
