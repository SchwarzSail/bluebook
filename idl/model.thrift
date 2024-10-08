namespace go model

struct User {
    1: string account //账号
    2: string username
    3: string major //专业
    4: string email //邮箱
    5: string avatar //头像
}

struct Project {
    1: string title
    2: string description
    3: string username //发起人
    4: list<string> numbers //参与人
    5: list<string> types//专业类型
}