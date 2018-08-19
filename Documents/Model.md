# Model

  model 是对数据库操作方法的封装，除了创建、查询、更新、删除数据外，可以定义表之间的关系、约束等逻辑操作。
  
## modle的基础操作

#### 创建model

  rails g model Group g_name
  会在./app/models中生成一个group.rb文件，文件中定义了一个继承于ApplicationRecord的Group类,数据的交互方法都在这里
  会在./db/migrate中生成一个xxx_create_group.rb的文件，文件中定义了一个继承于ActiveRecord::Migration的CreateGroup类，用来创建数据库结构
  还会生成对应的test文件
  通过 rails db:migrate 将此内容同步到数据库中
  
#### 创建数据

  g = Group.new(name: 'grp_1') #=>先创建在内存中，再通过save存入库
  g.save
  
  Group.create(name:'grp_1') #=> 创建并直接塞入库
  
  # 也可以用块来初始化数据
  Group.Create do |grp| do
    grp.name = 'grp_1'
  end
  
#### 查询数据

  Group.all
  Group.first
  Group.first(3)
  Group.last
  Group.find(id)
  Group.find_by(name: 'grp_1')
  Group.where(id < 3)
  
#### 更新数据

  g = Group.find_by(name: 'grp_1')
  g.name = 'GRP_ONE'
  g.save
  # 简写方法
  g.update(name: 'GRP_ONE')
  
#### 删除数据
  
    g = Group.find_by(name: 'grp_1')
    g.destroy #=> 触发回调
    g.delete #=> 不触发
    
    
## 验证数据
 
触发验证的方法：爆炸方法（例如 save!）会在验证失败后抛出异常。验证失败后，非爆炸方法不会抛出异常，save 和 update 返回 false，create 返回对象本身。

    create
    create!
    save
    save!
    update
    update!
    
    
跳过验证：下列方法会跳过验证，不管验证是否通过都会把对象存入数据库，使用时要特别留意。

    decrement!
    decrement_counter
    increment!
    increment_counter
    toggle!
    touch
    update_all
    update_attribute
    update_column
    update_columns
    update_counters
      
    注意，使用 save 时如果传入 validate: false 参数，也会跳过验证。使用时要特别留意。
    save(validate: false)

主动执行验证：valid? 和 invalid?

     valid? 执行验证，通过为true 不通过为 false
     invalid? 功能与valid?相反，通过为false
     
    例：     
    class User < ApplicationRecord
      validates :name, presence: true # 不为空
    end
    # 通过验证
    u = User.Create(name: 'sam')  # => true
    u.errors.messages             # => {}  
    
    # 未通过验证
    u1 = User.new
    u1.valid?                     # => false  主动验证真
    u1.invalid?                   # => true   主动验证假
    u1.save!                      # => 修改数据库触发爆炸验证，报错！
    u1.errors.messages            # => {name:["can't be blank"]} 错误信息
    u1.save                       # => false  修改数据库触发验证，返回bool
    
    
    
    # 新记录？存！
    u.save if u.new_record?
    
    
  
