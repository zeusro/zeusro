# Detect OS
ifeq ($(OS),Windows_NT)
  # Windows（cmd / PowerShell 环境下）
  DATE_CMD = powershell -NoProfile -Command "Get-Date -Format 'yyyy-MM-dd_HH-mm-ss'"
else
  # 假定是 Unix / Linux / macOS 等
  DATE_CMD = date -u +"%Y-%m-%dT%H:%M:%SZ"
endif

now := $(shell $(DATE_CMD))

PREFIX ?= zeusro
APP_NAME ?= kube-killer:latest
IMAGE ?= $(PREFIX)/$(APP_NAME)

auto_commit:
	git add .
	git commit -am "$(now)"
	git pull
	git push