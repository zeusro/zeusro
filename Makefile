now 		  := $(shell date)
PREFIX		  ?= zeusro
APP_NAME      ?= kube-killer:latest
IMAGE		  ?= $(PREFIX)/$(APP_NAME)
MIRROR_IMAGE  ?= registry.cn-shenzhen.aliyuncs.com/
ARCH		  ?=amd64

auto_commit:   
	git add .
	git commit -am "$(now)"
	git pull
	git push