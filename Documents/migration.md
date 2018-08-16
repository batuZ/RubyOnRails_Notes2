# migration 迁移，数据库结构管理

	迁移工作的主体是 db/migrate 下的rb文件，可以用辅助命令来创建，更细节的内容需要在rb中编写。
	以下称这些迁移rb文件为 'migrate' ，称创建命令为 'migration'

### migration 命令结构

	rails g migration AddNameToPerson name:string age:integer
	|	固定部分		  |    名称部分    |        属性部分       |