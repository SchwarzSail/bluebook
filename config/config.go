package config

import (
	"bluebook/pkg/logger"

	"github.com/spf13/viper"
)

var Config Conf

type Conf struct {
	System *System `mapstructure:"system"`
	Mysql  `mapstructure:"mysql"`
}

type System struct {
	Domain string `mapstructure:"domain"`
	Host   string `mapstructure:"host"`
	Port   string `mapstructure:"port"`
}

type Mysql struct {
	UserName      string `mapstructure:"userName"`
	MysqlPassword string `mapstructure:"mysqlPassword"`
	DbName        string `mapstructure:"dbName"`
	DbHost        string `mapstructure:"dbHost"`
	DbPort        string `mapstructure:"dbPort"`
}

func Init() {
	viper.SetConfigName("config")
	viper.SetConfigType("yaml")
	viper.AddConfigPath("config")
	if err := viper.ReadInConfig(); err != nil {
		logger.Fatalf("config.Init: read config error: %v", err)
	}
	if err := viper.Unmarshal(&Config); err != nil {
		logger.Fatalf("config.Init: unmarshal config error: %v", err)
	}
}
