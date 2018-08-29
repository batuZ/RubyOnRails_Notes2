# User 相关

## 注册、登录

### 准备

    安装并应用 
    gem 'bcrypt'


    创建用户模型
    rails g model User name password_digest


    用户模型增加属性设置
    class User < ApplicationRecord
      has_secure_password
    end
    
    rails db:migrate
    
### 增加对应接口
``` ruby
	#
	# 用户注册
	#
	params do
		requires :name, type: String, desc: "User name."
		requires :password, type: String, desc: "Password."
	end
	post :login do 
  	user = User.find_by(name: params[:name]).try(:authenticate, params[:password])
  	user ? user : :null
	end

	#
	# 用户登录
	#
	params do
		requires :name, type: String, desc: "User name."
		requires :password, type: String, desc: "Password."
		requires :password_confirmation, type: String, desc: "password_confirmation."
		optional :tel, type: Integer, default: 18600009999
	end
	post :register do
		user = User.create(params)
		user.id ? user : :null
	end
```

### 调试

	# 注册
	post localhost:3000/register data{ name: 'userName', password: 123, password_confirmation: 123 }
	
	# 登录
	localhost:3000/register data{ name: 'userName', password: 123 }
