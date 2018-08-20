# migration 迁移，数据库结构管理
参考资料：Ruby on Rails 实战圣经  https://ihower.tw/rails/migrations-cn.html

Migrations作用

	采用Ruby DSL的方式来管理数据库的设计模式
	通用RDB模式管理，方便在不同数据库之前使用
	支持版本管理和团队协作
	支持数据库rollback

	迁移工作的主体是 db/migrate 下的rb文件，可以用辅助命令来创建，更细节的内容需要在rb中编写。
	以下称这些迁移rb文件为 'migrate' ，称创建命令为 'migration'

Model\migrate\migration之间的关系

	Model：
		通俗的说，就是数据库的操作类，它并不包含表或字段的定义。
		在Model工作时，动态的与数据库交互，交互的结果将记录在数据库中。
		Model的【基类】提供了数据库操作、关联、约束的大部分方法，同时还制定了与各类操作相关的回调函数、错误信息反馈机制。
		在Model类中调用这此方法，来管理产品数据。例如：约束某个Model的name属性不为空
```			
			class Account < ApplicationRecord
			  validates :name, presence: true
			end
```		

	Migrate:
		用来管理数据库结构和关系的方式，操作结果会直接影响数据库结构或关系。
		migrate的【基类】封装了多种数据库的操作，而用户通过这些功能可以制定数据库表和字段的创建、关联、约束。
		与 Model不同，migrate管理结构关系，而model管理内容。
		与 Model相同，migrate也可以设置关联和约束，但主体是数据库本身的功能。Model的关联和约束功能主体在其【基类Active Record】中。
		 例如: t.string :name, null: true 也是设置name字段不能为空
```
			class CreateUser < ActiveRecord::Migration[5.2]
			  def change
			    create_table :users do |t|
			      t.string :name, null: true
			    end
			  end
			end
```
		相同的功能，migrate的null: true由数据库实现，Model的 presence: true 由Active Record实现。
		1、migrate设置数据库关系可以提高安全系数，执行效率比model高，可以通过./db/schema.rb文件查看和管理
		2、model中的设置，更灵活，便于管理，有辅助方法配合可以实现更多需求，如回调、错误信息等
		3、同时启用，可以让数据库更安全，但成倍增加了工作量，也不易维护。
		两者并没有直接关系，或者说用哪个都行，包括约束、关联的其它设置也是一样，那这部分工作应该放在哪里？
		1、适合只用model定义关系约束,migrate只负责结构的情况：项目前期、产品原型、个人或小团队、频繁变更需求
		2、适合同时启用的情况：对操作安全、性能要求高，且有专人负责数据库
		
	Migreation:
		用来创建以上两种文件的工具，可以简单实现一些功能的定义
		官方的说法：Migreation只是Active Record的第一步，更多的工作在migrate里。
		
		
	
## migration 是通过Ruby代码构建migrate文件的工具，用来管理构建数据库的过程

#### 命令结构

	rails g migration AddNameToPerson name:string age:integer
	|     固定部分    |    名称部分    |       属性部分       |

	固定部分：固定部分
	名称部分：【Add + 字段名 + 表名】，驼峰（必须），add是动作（必须），表名是目标（必须），字段名只是用来说明要做的事，实际内容是由后面的属性部份决定的
	属性部分：【字段名：类型{修饰}】 实际的操作内容，如果操作是由名称里的作动决定的，Add,Remove,create,



#### 例：
	
	//创建表 rails g migration Create[_表名] [字段，字段]
	rails g migration CreateBook name
		# => class CreateBooks < ActiveRecord::Migration[5.2]
		# =>    def change
		# =>      create_table :books do |t|
		# =>        t.string :name
		# =>      end
		# =>    end
		# =>  end
	ps: 除非必要，大多数是通过 rails g model Book name 来创建books表
		# => class CreateBooks < ActiveRecord::Migration[5.2]
		# =>   def change
		# =>     create_table :books do |t|
		# =>       t.string :name
		# => 
		# =>       t.timestamps
		# =>     end
		# =>   end
		# => end
	同时创建model
		# => class Book < ApplicationRecord
		# => end


	//创建表，同时带入字段类型修饰符
	rails d model Car 'price:decimal{5,2}' supplier:belongs_to{polymorphic}
		# class CreateCars < ActiveRecord::Migration[5.2]
		#   def change
		#     create_table :cars do |t|
		#       t.decimal :price, precision: 5, scale: 2
		#       t.references :supplier, polymorphic: true
		#       t.timestamps
		#     end
		#   end
		# end
	car.rb
		# class Car < ApplicationRecord
		#   belongs_to :supplier, polymorphic: true
		# end
	
	
	//创建互相关联的表，两种写法效果相同
	rails g migration CreateJoinCarColor car color
	rails g migration create_join_table_car_color car color
		# class CreateJoinTableCarColor < ActiveRecord::Migration[5.2]
		#   def change
		#     create_join_table :cars, :colors do |t|
		#       # t.index [:car_id, :color_id]
		#       # t.index [:color_id, :car_id]
		#     end
		#   end
		# end
		
		
	//创建字段
	rails g migration add_color_to_book color
		# class AddColorToBook < ActiveRecord::Migration[5.2]
		#   def change
		#     add_column :books, :color, :integer
		#   end
		# end
		
		
	//创建字段,同时创建索引
?	rails g migration add_color_to_book color:string:index
		# class AddColorToBook < ActiveRecord::Migration[5.2]
		#   def change
		#     add_column :books, :color, :string
		#     add_index :books, :color
		#   end
		# end
	
	
	//移除字段
	rails g migration remove_name_age_from_student name age:integer
		# class RemoveColorFromBook < ActiveRecord::Migration[5.2]
		#   def change
		#     remove_column :books, :color, :integer
		#   end
		# end


?	//为字段添加外键，两种写法效果相同
	rails g migration add_color_to_book color:references
	rails g migration add_color_to_book color:belongs_to
		# class AddPosToBook < ActiveRecord::Migration[5.2]
		#   def change
		#     add_reference :books, :color, foreign_key: true
		#   end
		# end


		
## migrate

#### migrate 结构
	
	//空的 migrate ,所有的操作都在 change 方法里
	class RenameAgeFromBook < ActiveRecord::Migration[5.2]
		def change
			# do something...
		end
	end
	
	// 创建一个名为pos的表，自动包含id和时间戳
	class CreatePos < ActiveRecord::Migration[5.2]
	  def change
	    create_table :pos do |t|
	      t.double :x
	      t.double :y
	      t.double :z
	      t.integer :p_id

	      t.timestamps
	    end
	  end
	end	

#### 编写 migrate
	
	//创建数据表
	create_table :products do |t|
		t.string :name
	end

	//创建联结数据表
	create_join_table :products, :categories

	//修改数据表
	change_table :products do |t|
	  t.remove :description, :name 		# 移除description、name字段
	  t.string :part_number				# 增加part_number字段
	  t.index :part_number				# 为part_number字段增加索引
	  t.rename :upccode, :upc_code		# 重名upccode为upc_code
	end	

	//修改字段, 把 products 数据表的 part_number 字段修改为 :text 字段
	change_column :products, :part_number, :text


#### 常用的migratie in def change：
	
表操作:

	create_table(name, options) 新增表
	drop_table(name) 移除表
	rename_table(old_name, new_name) 修改表名称
	change_table 修改表字段

字段操作:

	add_column(table, column, type, options) 新增一个字段
	rename_column(table, old_column_name, new_column_name) 修改字段名称
	change_column(table, column, type, options) 修改字段的类型(type)
	remove_column(table , column) 移除字段

索引:

	add_index(table, columns, options) 新增索引
	remove_index(table, index) 移除索引
	
	options 可为空，或是:unique => true表示这是唯一。

外键:

	add_foreign_key(from_table, to_table, options)
	remove_foreign_key(from_table, to_table, options)
	
	options 可为空,或是可自定:
	column => from_table_foreign_key_column (默认是{to_table}_id)
	和:primary_key => to_table_primary_key_column(默认是id)。

更多方法：

	add_reference
	remove_reference

	add_timestamps
	remove_timestamps

	change_column_default（必须提供 :from 和 :to 选项）
	change_column_null

	create_join_table
	drop_join_table

	enable_extension
	disable_extension


#### 字段修饰符

字段修饰符可以在创建或修改字段时使用：

	:null 是否允许NULL，默认是允许，即true
	:default 默认值
	:limit 用于string、text、integer、binary指定最大值
	:index => true 直接加上索引
	:index => { :unique => true } 加上唯一索引
	:foreign_key => true 加上外部键限制
	:precision 修饰符：定义 decimal 字段的精度，表示数字的总位数。
	:scale 修饰符：定义 decimal 字段的标度，表示小数点后的位数。
	:polymorphic 修饰符：为 belongs_to 关联添加 type 字段。
	:comment 修饰符：为字段添加注释。
	:unique: true 设置唯一

#### 字段类型

Rails|说明|MySQL|Postgres|SQLite3
---|---|---|---|---
:string|有限长度字串|varchar(255)|character varying(255)|varchar(255)
:text|不限长度文字|text|text|text
:integer|整数|int(4)|integer|integer
:float|浮点数|float|float|float
:decimal|十进制数|decimal|decimal|decimal
:datetime|日期时间|datetime|timestamp|datetime
:timestamp|时间戳章|datetime|timestamp|datetime
:time|时间|time|time|datetime
:date|日期|date|date|date
:binary|二进制|blob|bytea|blob
:boolean|布林值|tinyint|boolean|boolean
:references|用来参照到其他Table的外部键|int(4)|integer|integer




#### rails db:migrate

	前辈说：
		永远不要修改已经提交的migrations
		这句话这么理解了？为什么这么说？
		我们知道迁移文件是根据时间戳命名的，这个时间戳只会一直往前，如果一个文件已经迁移了，这时你在已经迁移过的
		文件中修改，你再去rake db:migrate 是没有效果的，rails是自动去根据时间戳去寻找迁移的文件，如果找到了这个时间
		戳，不会再进行相应的迁移处理，如果你真想修改这个文件内容，请新建一个迁移文件进行修改并进行迁移，这样才能
		达到预期的效果，也是我们团队所需要的。





## 其它

	db/schema.rb 是迁移产生的总结性文件，描述当前数据库结构，与migration不同的是它没有了版本变化，但条理更清淅
	db/seed.rb 是种子文件，在构建数据库的同时把定制数据一起塞进数据库
	以上两个文件都通过rails db:setup 执行

	rails db:setup 任务用于创建数据库，加载数据库模式，并使用种子数据初始化数据库。
	rails db:rollback 回滚
	rails db:reset 任务用于删除并重新创建数据库，其功能相当于 rails db:drop db:setup。
