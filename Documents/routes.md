## Routes,路由管理列表


[官方资料](https://ruby-china.github.io/rails-guides/routing.html)

#### 设置根：[资料](https://ruby-china.github.io/rails-guides/routing.html#using-root)
```ruby
root 'rootview#welcome'

# 还可以在命名空间和作用域中使用 root 方法，例如：
namespace :admin do
  root to: "admin#index"
end
root to: "home#index"
```

#### 在浏览器中查看所有路由信息
``` 
# 在控制台查看所有路由信息
rails routes
# 在浏览器中查看所有路由信息
http://localhost:3000/rails/info/routes
```
---

### 手动配置一般路由：[资料](https://ruby-china.github.io/rails-guides/routing.html#non-resourceful-routes)
```ruby
// http动作 view模版路径 , to: 控制器#动作
get 'root/kkk', to: 'root#myAction'

// 按rails约定原则，url内容与controller.action匹配时可以简写
get 'root/first'
```

#### 命名路由：[资料](https://ruby-china.github.io/rails-guides/routing.html#naming-routes)
```ruby
// 命名路由, 请求时直接使用路由名_path(参数)
get 'root/second', as: 'aaa' #:as => 'aaa'
```

#### 关于约束 '未完成'
* [HTTP 方法约束](https://ruby-china.github.io/rails-guides/routing.html#http-verb-constraints)
* [片段约束](https://ruby-china.github.io/rails-guides/routing.html#segment-constraints)
* [请求约束](https://ruby-china.github.io/rails-guides/routing.html#request-based-constraints)
* [高级约束](https://ruby-china.github.io/rails-guides/routing.html#advanced-constraints)
* [路由通配符和通配符片段](https://ruby-china.github.io/rails-guides/routing.html#route-globbing-and-wildcard-segments)

#### 重定向：[资料](https://ruby-china.github.io/rails-guides/routing.html#redirection)
'未完成'

---

### 资源路由：[资料](https://ruby-china.github.io/rails-guides/routing.html#resource-routing-the-rails-default)
```ruby
resources :books

# 同时定义多个资源路由
resources :images, :vedios, :pages
```

#### 增加资源动作：[资料](https://ruby-china.github.io/rails-guides/routing.html#adding-more-restful-actions)

`注意：当一个资源增加了多个动作时，就要考虑是否要新建一个资源了`

```ruby
# 成员路由,指向某条特定的记录，使用时要带参
resources :books do
  # 用on: :member方法增加一个动作
    get 'redef',on: :member     # => /books/:id/redef
  
  #用member do方法增加多个动作
  member do
    get 'act_x'     # => /books/:id/act_x
    get 'act_y'     # => /books/:id/act_y
  end
end


# 集合路由，指向一个记录的集合
resources :books{
  collection{
    get 'redef'     # => /books/redef
    get 'redef_k'
  }
}
```

#### 屏蔽部份资源动作：[资料](https://ruby-china.github.io/rails-guides/routing.html#restricting-the-routes-created)
`如果应用中有很多资源式路由，通过 :only 和 :except 选项，我们可以只生成实际需要的路由，这样可以减少内存使用、加速路由处理过程。`
```ruby
resources :photos, only: [:index, :show]
resources :photos, except: :destroy
```
#### 命名空间：[资料](https://ruby-china.github.io/rails-guides/routing.html#controller-namespaces-and-routing)
    如果想在命名空间代码块中使用另一个控制器命名空间，可以指定控制器的绝对路径，例如 get '/foo' => '/foo#index'。
    命名空间不会影响路由的辅助名称
```ruby
# 命名，url，控制器都带空间名
namespace :art{
  resources :books      # => art_books GET    /art/books(.:format)          art/books#index
}


# 把普通资源路由映射到带命名空间的控制器上
scope module: 'art' do
  resources :books      # => books GET    /books(.:format)          art/books#index
end
# 对于单个资源的情况，还可以这样声明：
resources :books, module: 'art' # 效果同上


# 让控制器使用带命名空间的URL
scope :art {
  resources :books    # => books GET    /art/books(.:format)          books#index
}
# 对于单个资源的情况，还可以这样声明：
resources :books, path: :art
```

#### 嵌套资源：[资料](https://ruby-china.github.io/rails-guides/routing.html#nested-resources)
```ruby
# 普通的一层嵌套
resources :groups{
  resources :photos
}


# 多级嵌套时，要使用浅嵌套
resources :groups{
  resources :photos, only: [:index, :new, :create]
}
resources :photos, only: [:show, :edit, :update, :destroy]
# 但这种写法比较麻烦，可以使用shallow（浅）简写为：
resources :groups{
  resources :photos, shallow: true
}


# 父资源有多个子级时
resources :books, shallow: true do
  resources :photos
  resources :images
end


# 有多个资源要分别嵌套时，用shallow定义一个区域，这个区域内不需要标记，就可以设置为嵌套
shallow{
  resources :books{
    resources :xhzd{
      resources :ch
    }
  }
  resources :pictruers{
    resources :sst
  }
}


# scope shallow_path 选项，可以为子级url路径加一个指定的前缀 ‘bt’
scope shallow_path: 'bt' do
  resources :books do
    resources :photos, shallow: true
  end
end


# shallow_prefix 选项会为具名辅助方法添加指定前缀：
scope shallow_prefix: 'bt' do
  resources :books do
    resources :photos, shallow: true
  end
end
```





