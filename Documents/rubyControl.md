## rails control(c)操作

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
rails s                 #退出时回滚对数据库的所有操作

//重新加载，相当于退出重进rails c,代码更新时用
>> reload!

// 创建一条记录
Book.new(title:'红楼梦',pages:4800)

// 获取记录变量，保存进数据库
hlm = Book.new(title:'红楼梦',pages:4800)
hlm.save        #返回true为保存成功

// 使用系统变量 _ 获取当前记录
Book.new(title:'红楼梦',pages:4800)
_.save

//创建成功后直接塞进数据库，不需要save
Book.create(title:'红楼梦',pages:4800)

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

// 格式化输出记录内容 pp 变量名
pp hlm
# =>  id: nil,
# =>  title: "红楼梦",
# =>  pages: 4800,
# =>  created_at: nil,
# =>  updated_at: nil>
# =>  <Book id: nil, title: "红楼梦", pages: 4800, created_at: nil, updated_at: nil> 
```

---
##### 在console中模拟http请求
    ActionController::Integration::Session在script/console的console_app中，
    使用的句柄是app，返回ActionController::Integration::Session的一个实例
```ruby
app.get '/books/12'

# => Processing by BooksController#show as HTML
# =>   Parameters: {"id"=>"12"}
# =>   Book Load (0.3ms)  SELECT  "books".* FROM "books" WHERE "books"."id" = ? LIMIT ?  [["id", 12 ["LIMIT", 1]]
# =>   Rendering books/show.html.erb within layouts/application
# =>   Rendered books/show.html.erb within layouts/application (0.7ms)
# => Completed 200 OK in 28ms (Views: 21.7ms | ActiveRecord: 0.3ms)
# => 200


app.https!  
app.https?

app.get('/my/path')  

#If you want to put or post to a URL there are also methods for that. 
#You can copy/paste the parameters exactly as they are displayed in your Rails production log:  
app.post('/foo', {"this" => "that", "items" => ["bar", "baz"]})  
app.put('/foo', {"this" => "that", "items" => ["bar", "baz"]})  

#If you want to sent a custom header, you can add an optional third parameter:  
app.post('/foo', {:this => "that", :items => ["bar", "baz"]}, {"X-Do-Something" => "yes"}) 
```
```
    其它请求
    delete
    delete_via_redirect
    follow_redirect!
    get
    get_via_redirect
    head
    host!
    https!
    https?
    new
    post
    post_via_redirect
    put
    put_via_redirect
    redirect?
    request_via_redirect
    reset!
    url_for
    xhr
    xml_http_request
```


---
##### 通过调用.rb代替在console的操作

    在model文件夹或工程根目录中创建一个.rb文件，例如：console.rb
    在console.rb写些测试命令，保存，例如：puts 'is this used ...'
    OK,在控制台或终端重新启动 rails console,输入 load 'console.rb'
    修改console.rb的内容,不需要重启rails console,再试一下输入 load 'console.rb'
    ps:在工程的其它位置也可以，但调用要带上相对路径，比如在./test下建的console.rb，用load './test/console.rb'调用
    
console.rb：
``` ruby 

    # 查表中数据数量
    p "Person.all.count :#{Person.all.count}"
    p "Car.all.count :#{Car.all.count}"

    # 模拟请求，只能返回状态，返回内容可以在controller或API里puts
    app.get 'http://localhosh:3000/person/1'

```
    
更懒的方法：

    还是建个空的console.rb文件
    然后在 ./config/environments/development.rb 文件中加一个函数，如下：
``` ruby
def run
    load 'console.rb'
end
```
    现在就有了一个全局的 run 函数，可以在 rails console 里随时调
    
