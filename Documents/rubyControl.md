## rails control(c)操作

* [官方资料](https://ruby-china.github.io/rails-guides/command_line.html#rails-console)
* [其它资料](https://www.cnblogs.com/Tommy-Yu/p/4141122.html)
---
    rails console
    执行 console 命令后，可以在命令行中与 Rails 应用交互。
    rails console 使用的是 IRB，在控制台里可以快速测试想法，
    或者修改服务器端数据，而无需在网站中操作。

```ruby
//进入控制台：在工程目录下运行
rails control           
rails c                 #默认进入development模式
rails c test            #进入test模式
rails c production      #进入production模式

// 创建一条记录
Book.new(title:'红楼梦',pages:4800)

// 格式化输出记录内容
pp hlm
# =>  id: nil,
# =>  title: "红楼梦",
# =>  pages: 777,
# =>  created_at: nil,
# =>  updated_at: nil>
# =>  <Book id: nil, title: "红楼梦", pages: 777, created_at: nil, updated_at: nil> 

// 获取记录变量，保存进数据库
hlm = Book.new(title:'红楼梦',pages:4800)
hlm.save        #返回true为保存成功

// 使用系统变量 _ 获取当前记录
Book.new(title:'红楼梦',pages:4800)
_.save

// 获取记录
Book.all        #返回全部实例集合
Book.find(2)    #返回id为2的实例对象

// 更新当前记录
// =赋值
hlm = Book.find(2)
hlm.pages = 5200
hlm.save

// 调函数修改记录单个属性，实例.update_attribute(field,value)
hlm.update_attribute(:pages,6700)

// 调函数修改记录多个属性，实例.update_attributes(hash)
hlm.update_attributes(:title=>'aaa',:pages=>4400)

// 从数据库删除记录
hlm.destroy     #返回被删除记录

```



