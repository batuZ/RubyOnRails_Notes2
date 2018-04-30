## rails操作

* [官方资料](https://ruby-china.github.io/rails-guides/command_line.html)
* [其它资料](http://www.cnblogs.com/wang123/archive/2009/09/16/1567774.html)

##### 创建rails工程
```ruby
rails new Project

// 创建但不bundle，设置Gemfile源为：source 'https://gems.ruby-china.org'
rails new Project --skip-bundl

// 创建并指定数据库,mysql\oracle\postgresql\sqlite3	(默认)
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
