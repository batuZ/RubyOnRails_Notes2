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
	属性部分：【字段名：类型[修饰]】 实际的操作内容，如果操作是由名称里的作动决定的，Add,Remove,create,

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







	前辈说：
		永远不要修改已经提交的migrations
		这句话这么理解了？为什么这么说？
		我们知道迁移文件是根据时间戳命名的，这个时间戳只会一直往前，如果一个文件已经迁移了，这时你在已经迁移过的
		文件中修改，你再去rake db:migrate 是没有效果的，rails是自动去根据时间戳去寻找迁移的文件，如果找到了这个时间
		戳，不会再进行相应的迁移处理，如果你真想修改这个文件内容，请新建一个迁移文件进行修改并进行迁移，这样才能
		达到预期的效果，也是我们团队所需要的。