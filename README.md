# fanta-book

[![Gitter](https://img.shields.io/gitter/room/nwjs/nw.js.svg)](https://gitter.im/fanta-books/Lobby)


### 运行项目


创建配置文件

	cp .env.example .env
	
准备工作

	docker-compose build
	docker-compose run app bundle install
	docker-compose run app rails db:setup
	
启动服务

	docker-compose up -d
	
	
运行监控

	docker exec -it <APP_CONTAINER_ID> bundle exec guard
	
访问项目

	http://127.0.0.1:3000