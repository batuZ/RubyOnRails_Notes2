## Scaffold 管理资源套件的函数

#### 准备工作

```ruby
rails new Project --skip-bundle
source 'https://gems.ruby-china.org'
bundle
cd Project
```

#### 创建、删除
```ruby
// 互反操作
rails g scaffold ABC
rails d scaffold ABC
```

#### 带参创建
```ruby
// 创建名为ABC的资源，其中包括name(string时可以不标注类型)，number,size属性
rails g scaffold ABC name number:integer size:float
```

#### 迁移到数据库
```ruby
// 如果没有创建数据库
rake db:create

// 迁移
rake db:migrate
```
ps:
* 创建过程和`Modled`非常相似，名称都是单数形式`User`，只是得到的结果不同
* 更多高级操作可以参考`Modle`,或就在`Modle`中操作

#### 创建的内容
* 1、向数据库迁移的配置文件：[db/migrate/20180430105653_create_abcs.rb](https://github.com/batuZ/RubyOnRails_Notes2/blob/master/forScaffold/db/migrate/20180430115148_create_abcs.rb)
* 2、资源模型：[app/models/abc.rb](https://github.com/batuZ/RubyOnRails_Notes2/blob/master/forScaffold/app/models/abc.rb)
* 3、向[路由](https://github.com/batuZ/RubyOnRails_Notes2/blob/master/forScaffold/config/routes.rb)中增加资源路由：resources :abcs
* 4、资源控制器：[app/controllers/ab_cs_controller.rb](https://github.com/batuZ/RubyOnRails_Notes2/blob/master/forScaffold/app/controllers/ab_cs_controller.rb)
* 5、资源视图套装：[app/views/ab_cs/*.*](https://github.com/batuZ/RubyOnRails_Notes2/tree/master/forScaffold/app/views/ab_cs)
* 6、tests\helper\assets.coffee\assets.scss...
