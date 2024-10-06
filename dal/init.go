package dal

import "bulebook/dal/db"

func Init() {
	db.InitMySQL()
}
