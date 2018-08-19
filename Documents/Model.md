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

  class User < ApplicationRecord
  end
  
  u=User.Create(name: 'sam')
  
  
  
