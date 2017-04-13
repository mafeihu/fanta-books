# Fanta


### 运行项目


创建配置文件

	cp .env.example .env
	
准备工作

	docker-compose build
	docker-compose run app bundle install
	docker-compose run app rails db:setup
	
启动服务

	docker-compose up -d
	
访问项目

	http://127.0.0.1:3000