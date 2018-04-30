# RubyOnRails_Notes2

### 常规模块
- [x] [forScaffold，资源套件关相](https://github.com/batuZ/RubyOnRails_Notes2/tree/master/forScaffold#scaffold-%E7%AE%A1%E7%90%86%E8%B5%84%E6%BA%90%E5%A5%97%E4%BB%B6%E7%9A%84%E5%87%BD%E6%95%B0)
- [ ] [Modle]()
- [ ] [View]()
- [ ] [Controller]()
- [x] [gem 操作](https://github.com/batuZ/RubyOnRails_Notes2/blob/master/README.md#gem-%E6%93%8D%E4%BD%9C)
- [ ] [rails 操作](https://github.com/batuZ/RubyOnRails_Notes2/blob/master/README.md#rails%E6%93%8D%E4%BD%9C)
- [ ] [ruby 控制台]()
---
### gem 操作

* [官网资料](https://gems.ruby-china.org/)
* [菜鸟教程](http://www.runoob.com/ruby/ruby-rubygems.html)

1､ 查看版本号，同时也是验证程序是否可用的方法
```ruby
gem -v
ruby -v
rails -v
```
2､ gem源 查看、变更
```ruby
gem sources 					#查看当前的源
gem sources --add https://gems.ruby-china.org/	#添加源
gem sources --remove https://rubygems.org/	#移除源
```
3､ 查看 gem包
```ruby
gem list -l 	#本地gem
gem list --r 	#可用gem
```
4､ 安装，删除 gem包
```ruby
gem install XXX
gem uninstall XXX
```
5､ Gemfile 
```ruby
gem 'rails'  			#使用最新版的 rails
gem 'rails', '5.1.2'		#使用指定版本的 rails
gem 'rails', '>=5.2'		#使用5.2或不低于5.2的 rails
gem 'rails', '~>5.0'		#使用不小于5.0且不大于6.0版本的 rails
```
##### 更多操作：

| 命令 | 描述 |
| :------------- | :----------- |
|**gem** _update_ | #更新所有包 |
|**gem** _update_ --system | #更新RubyGems软件 |
|**gem** _install_ rake | #安装rake,从本地或远程服务器 |
|**gem** _install_ rake --remote | #安装rake,从远程服务器 |
|**gem** _install_ watir -v 1.6.2|#指定安装版本|
|**gem** _uninstall_ rake|#卸载rake包|
|**gem** _list_|#列出本地包|
|**gem** _list_ d|#列出本地以d打头的包|
|**gem** _query_ -n ''[0-9]'' --local|#查找本地含有数字的包|
|**gem** _search_ log --bot|#从本地和远程服务器上查找含有log字符串的包|
|**gem** _search_ log --remoter|#只从远程服务器上查找含有log字符串的包|
|**gem** _search_ -r log|#只从远程服务器上查找含有log字符串的包|
|**gem** _help_|#提醒式的帮助|
**gem** _help_ install|#列出install命令 帮助
**gem** _help_ examples|#列出gem命令使用一些例子
**gem** _build_ rake.gemspec|#把rake.gemspec编译成rake.gem
**gem** _check_ -v pkg/rake-0.4.0.gem|#检测rake是否有效
**gem** _cleanup_|#清除所有包旧版本，保留最新版本
**gem** _contents_ rake|#显示rake包中所包含的文件
**gem** _dependency_ rails -v 0.10.1|#列出与rails相互依赖的包
**gem** _environment_|#查看gem的环境
**gem** _sources_|#查看镜像

---
### rails操作



