# 这是一个保存账号密码的功能

config/credentials.yml.enc 是加密后的配置文件

config/master.key 是解密用的，要妥善保存，不能放到公开的地方

## 使用方法

#### 设置配置内容

  在终端输入 EDITOR=vim bin/rails credentials:edit 打开vim，按i进入编辑模式
  加入以下内容：
  
  启动模式,可以根据不同模式拿不同的内容
  
    development:
      database:
       name: MyDatabase
       passworld: 4321

    production:
     database:
      name: Produc_Name
      passworld: rasstie@123_up

    //下行空两格则成为子级，不空为同级内容
  
  编辑完成后按ESC, :wq 保存退出
  
    以上内容将被解析为：
    config:{
      development:{
        database:{
          name: MyDatabase,
          passworld: 4321
        }
      },
      production:{
        database:{
          name: Produc_Name,
          passworld: rasstie@123_up
        }
      }
    }
  
---

#### 使用加密配置

credentials.yml.enc / master.key 两个文件必须都存在

    在后台需要使用配置的地方输入：
      Rails.application.credentials.config[Rails.env][:database][:name] 
      可以获取当前启动模式下的名称，如果是development，得到的是 MyDatabase
    
