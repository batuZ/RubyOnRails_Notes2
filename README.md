# RubyOnRails_Notes2

### 常规模块
- [x] [forScaffold，资源套件关相](https://github.com/batuZ/RubyOnRails_Notes2/tree/master/forScaffold#scaffold-%E7%AE%A1%E7%90%86%E8%B5%84%E6%BA%90%E5%A5%97%E4%BB%B6%E7%9A%84%E5%87%BD%E6%95%B0)
- [ ] [Modle]()
- [ ] [View]()
- [ ] [Controller]()
---
### gem操作
官网资料：https://gems.ruby-china.org/
其它资料：http://www.runoob.com/ruby/ruby-rubygems.html

1､ 查看版本号，同时也是验证程序是否可用的方法
	gem -v
	ruby -v
	rails -v

2､ gem源 查看、变更
	gem sources 									#查看当前的源
	gem sources --add https://gems.ruby-china.org/	#添加源
	gem sources --remove https://rubygems.org/		#移除源

3､ 查看 gem包
	gem list -l 	#本地gem
	gem list --r 	#可用gem
4､ 安装，删除 gem包
	gem install XXX
	gem uninstall XXX

5､ Gemfile 
	gem 'rails'  				#使用最新版的 rails
	gem 'rails', '5.1.2'		#使用指定版本的 rails
	gem 'rails', '>=5.2'		#使用5.2或不低于5.2的 rails
	gem 'rails', '~>5.0'		#使用不小于5.0且不大于6.0版本的 rails
|---|---|
|gem update| 						#更新所有包|
|gem update --system| 			#更新RubyGems软件|
gem install rake 				#安装rake,从本地或远程服务器
gem install rake --remote 		#安装rake,从远程服务器
gem install watir -v 1.6.2		#指定安装版本的
gem uninstall rake 				#卸载rake包
gem list  						#列出本地包
gem list d 						#列出本地以d打头的包
gem query -n ''[0-9]'' --local 	#查找本地含有数字的包
gem search log --both 			#从本地和远程服务器上查找含有log字符串的包
gem search log --remoter 		#只从远程服务器上查找含有log字符串的包
gem search -r log 				#只从远程服务器上查找含有log字符串的包
gem help 						#提醒式的帮助
gem help install 				#列出install命令 帮助
gem help examples 				#列出gem命令使用一些例子
gem build rake.gemspec 			#把rake.gemspec编译成rake.gem
gem check -v pkg/rake-0.4.0.gem #检测rake是否有效
gem cleanup 					#清除所有包旧版本，保留最新版本
gem contents rake 				#显示rake包中所包含的文件
gem dependency rails -v 0.10.1 	#列出与rails相互依赖的包
gem environment 				#查看gem的环境
gem sources 					#查看镜像
