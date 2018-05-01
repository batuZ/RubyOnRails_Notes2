## Routes,路由管理列表


[Routes 中的配置示例]() | 
[view 中的使用示例]()

##### 设置首页
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