## Routes,路由管理列表


[官方资料](https://ruby-china.github.io/rails-guides/routing.html) | 
[Routes 中的配置示例](https://github.com/batuZ/RubyOnRails_Notes2/blob/master/forRoutes/config/routes.rb) | 
[view 中的使用示例](https://github.com/batuZ/RubyOnRails_Notes2/blob/master/forRoutes/app/views/root/welcome.html.erb)

##### [设置首页](https://ruby-china.github.io/rails-guides/routing.html#using-root)
```ruby
root 'rootview#welcome'
```

##### 手动配置一般路由[]
```ruby
// http动作 view模版路径 , to: 控制器#动作
get 'root/kkk', to: 'root#myAction'

// 按rails约定原则，url内容与controller.action匹配时可以简写
get 'root/first'
```

##### 命名路由
```ruby
// 命名路由, 请求时直接使用路由名_path(参数)
get 'root/second', as: 'aaa' #:as => 'aaa'

##### 资源路由

```
