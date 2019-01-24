### Rake 入门

```
//查看可用的rake list
rake -T 

//创建一个rake task模板
rails g task mytasks  # => create  lib/tasks/mytasks.rake

```
在模板中编写具体任务内容
```ruby
namespace :mytasks do

	desc '这里是【任务A】的描述，执行方法： rails mytasks:task_a'
	task :task_a do
		puts '任务A被执行！'
	end

	desc '这里是【任务B】的描述，执行方法： rails mytasks:task_b'
	task 'task_b' do
		puts '任务B被执行！'
	end

	desc '这里通过依赖完成准备工作，或组合其它任务共同执行'
	task task_all: [:task_a, :task_b]

	desc '访问工程中的对象需要加载rails工程环境，依赖[:environment]'
	task show_user_count: [:environment] do
		puts "当前用户数量为：	#{User.count}"
	end
end
```
