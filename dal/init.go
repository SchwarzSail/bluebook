package dal

import "bluebook/dal/db"

func Init() {
	db.InitMySQL()
}
