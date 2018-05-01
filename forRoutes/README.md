## Routes,路由管理列表


[官方资料](https://ruby-china.github.io/rails-guides/routing.html) | 
[Routes 中的配置示例](https://github.com/batuZ/RubyOnRails_Notes2/blob/master/forRoutes/config/routes.rb) | 
[view 中的使用示例](https://github.com/batuZ/RubyOnRails_Notes2/blob/master/forRoutes/app/views/root/welcome.html.erb)

##### 设置根：[资料](https://ruby-china.github.io/rails-guides/routing.html#using-root)
```ruby
root 'rootview#welcome'

# 还可以在命名空间和作用域中使用 root 方法，例如：
namespace :admin do
  root to: "admin#index"
end
root to: "home#index"
```

##### 手动配置一般路由：[资料](https://ruby-china.github.io/rails-guides/routing.html#non-resourceful-routes)
```ruby
// http动作 view模版路径 , to: 控制器#动作
get 'root/kkk', to: 'root#myAction'

// 按rails约定原则，url内容与controller.action匹配时可以简写
get 'root/first'
```

##### 命名路由：[资料](https://ruby-china.github.io/rails-guides/routing.html#naming-routes)
```ruby
// 命名路由, 请求时直接使用路由名_path(参数)
get 'root/second', as: 'aaa' #:as => 'aaa'
```

##### 关于约束
* [HTTP 方法约束](https://ruby-china.github.io/rails-guides/routing.html#http-verb-constraints)
* [片段约束](https://ruby-china.github.io/rails-guides/routing.html#segment-constraints)
* [请求约束](https://ruby-china.github.io/rails-guides/routing.html#request-based-constraints)
* [高级约束](https://ruby-china.github.io/rails-guides/routing.html#advanced-constraints)
* [路由通配符和通配符片段](https://ruby-china.github.io/rails-guides/routing.html#route-globbing-and-wildcard-segments)

##### 重定向：[资料](https://ruby-china.github.io/rails-guides/routing.html#redirection)
  
---

##### 资源路由：[资料](https://ruby-china.github.io/rails-guides/routing.html#resource-routing-the-rails-default)
```ruby
resources :books
```
##### 增加资源动作：[资料]()

##### 屏蔽部份资源动作：[资料]()

##### 命名空间：[资料](https://ruby-china.github.io/rails-guides/routing.html#controller-namespaces-and-routing)


##### 嵌套资源：[资料](https://ruby-china.github.io/rails-guides/routing.html#nested-resources)






