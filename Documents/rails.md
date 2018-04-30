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

```
