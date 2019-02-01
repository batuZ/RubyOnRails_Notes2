参考：https://www.jianshu.com/p/ac925476d86c

### ruby 环境
```
#先更新一下yum
yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel

#安装rvm
参考：https://ruby-china.org/wiki/rvm-guide
#  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3   这是下载key的
# \curl -sSL https://get.rvm.io | bash -s stable   注意 这里  \   一定加上   加入你操作没有反应的话  也可以试试 不加 \   通常都是卡在这一步的
#  source ~/.bashrc
#  source ~/.bash_profile   

#安装ruby
rvm install ruby 2.4.2

#换源
gem source -r https://rubygems.org/
gem source -a https://gems.ruby-china.com

#更新gem
gem update

#安装rails
gem install rails


```

### 同步代码
```
#安装Git
yum –y install git

# 选个文件夹，初始化git
git init

#clone 文件
git clone https://github.com/xxx/xxxx_test.git
```

### centOS 安装 MYSQL
参考资料：https://www.cnblogs.com/silentdoer/articles/7258232.html#tag1
