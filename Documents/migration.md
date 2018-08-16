# migration 迁移，数据库结构管理

Migrations作用

	采用Ruby DSL的方式来管理数据库的设计模式
	通用RDB模式管理，方便在不同数据库之前使用
	支持版本管理和团队协作
	支持数据库rollback

	迁移工作的主体是 db/migrate 下的rb文件，可以用辅助命令来创建，更细节的内容需要在rb中编写。
	以下称这些迁移rb文件为 'migrate' ，称创建命令为 'migration'


## migration 

#### 命令结构

	rails g migration AddNameToPerson name:string age:integer
	|     固定部分    |    名称部分    |       属性部分       |

	固定部分：固定部分
	名称部分：【Add + 字段名 + 表名】，驼峰（必须），add是动作（必须），表名是目标（必须），字段名只是用来说明要做的事，实际内容是由后面的属性部份决定的
	属性部分：【字段名：类型{修饰}】 实际的操作内容，如果操作是由名称里的作动决定的，Add,Remove,create,

#### 常用的migration：
	
	//创建表 rails g migration Create[_表名] [字段，字段]
	rails g migration CreateBook name page:integer
	rails g migration Create_book name page:integer

	//创建互相关联的表
	rails g migration CreateJoinTable customer product
	rails g migration create_join_table_cust_prod customer product	//效果同上

	//创建字段
	rails g migration AddColorToBook color:string
	rails g migration add_color_to_book color

	//移除字段
	rails g migration RemoveNameAgeFromStudent name age:integer
	rails g migration remove_name_age_from_student name age:integer

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

	// 更多方法
	add_column
	add_foreign_key
	add_index
	add_reference
	add_timestamps
	change_column_default（必须提供 :from 和 :to 选项）
	change_column_null
	create_join_table
	create_table
	disable_extension
	drop_join_table
	drop_table（必须提供块）
	enable_extension
	remove_column（必须提供字段类型）
	remove_foreign_key（必须提供第二个数据表）
	remove_index
	remove_reference
	remove_timestamps
	rename_column
	rename_index
	rename_table

#### 字段修饰符

字段修饰符可以在创建或修改字段时使用：

	limit 修饰符：设置 string/text/binary/integer 字段的最大长度。
	precision 修饰符：定义 decimal 字段的精度，表示数字的总位数。
	scale 修饰符：定义 decimal 字段的标度，表示小数点后的位数。
	polymorphic 修饰符：为 belongs_to 关联添加 type 字段。
	null 修饰符：设置字段能否为 NULL 值。
	default 修饰符：设置字段的默认值。请注意，如果使用动态值（如日期）作为默认值，那么默认值只会在第一次使时（如应用迁移的日期）计算一次。
	index 修饰符：为字段添加索引。
	comment 修饰符：为字段添加注释。

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