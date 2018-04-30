## rails操作

* [官方资料](https://ruby-china.github.io/rails-guides/command_line.html)
* [其它资料](http://www.cnblogs.com/wang123/archive/2009/09/16/1567774.html)

##### 创建rails工程
```ruby
rails new Project

// 创建但不bundle，设置Gemfile源为：source 'https://gems.ruby-china.org'
rails new Project --skip-bundl

// 创建并指定数据库,mysql\oracle\postgresql\sqlite3(默认)
rails new Project -d=mysql
```

##### rake db 数据库
```ruby
// 创建数据库
rake db:create

// 迁移数据库
rake db:migrate

// 删除数据库
rake db:drop
```

##### rails 内容创建、反创建
```ruby
// 创建 
// 如：控制器、模型、视图、脚手架或其它什么
rails generate Something Name
// 别名
rails g Something Name

// 反创建
rails destroy Something Name
// 别名
rails d Something Name
```

##### rails Server 启动
```ruby
//本地启动
rails server

//别名
rails s

//带参数启动
rails s -b 192.168.1.21 -p 3310
	-p 指定服务端口
	-b 指定服务IP
	-c 使用自定义rackup
	-d 使用服务器运行时作为系统守护进程
	-u 启用debug模式
	-e 指定运行环境 devlopment(默认) \ test \ production
```

##### 查看路由信息
```ruby
rails routes
rake routes
```

##### 其它命令
```ruby
# 在命令行中与 Rails 应用交互 (IRB)
rails console(c)		
# ex: 
auser = User.new(userName => 'batu', email => 'batu@gvitech.com') 
#=> 返回user对象,对象保留在内存中
auser.save 	
#=> 返回true
auser.destroy 
User.destroy 'id'

# 以非交互的方式运行 Ruby 代码
rails runner(r)	
```
##### [种子文件](https://ruby-china.github.io/rails-guides/active_record_migrations.html#migrations-and-seed-data)
	使用 Rails 内置的“种子”特性可以快速简便地完成创建数据库后添加初始数据的任务。
	在开发和测试环境中，经常需要重新加载数据库，这时“种子”特性就更有用了。
	使用“种子”特性很容易，只要用 Ruby 代码填充 db/seeds.rb 文件，
	然后执行 rails db:seed 命令即可：
```ruby
rake seed
```
