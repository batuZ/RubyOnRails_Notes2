Rails.application.routes.draw do
  
  	# 首页
	root 'root#welcome'

	# 一般路由设置方式
	# http动作 view模版路径 , to: 控制器#动作
	get 'root/kkk', to: 'root#myAction'

	# 按rails约定原则，url内容与controller.action匹配时可以简写
	get 'root/first'

	# 命名路由, 请求时直接使用路由名_path(参数)
  	get 'root/second', as: 'aaa' #:as => 'aaa'

  	# 资源路由
  	# resources :books

#   	    Prefix Verb   URI Pattern         Controller#Action
#      books GET    /books(.:format)          books#index
#            POST   /books(.:format)          books#create
#   new_book GET    /books/new(.:format)      books#new
#  edit_book GET    /books/:id/edit(.:format) books#edit
#       book GET    /books/:id(.:format)      books#show
#            PATCH  /books/:id(.:format)      books#update
#            PUT    /books/:id(.:format)      books#update
#            DELETE /books/:id(.:format)      books#destroy

  	# 扩展资源路由
  	# resources :books do

  	# 	#单个扩展
  	# 	get 'picked', :on => :member
  	# 	get 'search', :on => :collection

  	# 	#多个扩展
  	# 	collection do 
  	# 		get 'search_a'
  	# 		get 'search_b'
  	# 	end
	# end
	# 扩展路由的两种类型：
	# collection 集合路由，books/search，复数成员
	# member 成员路由，books/:id/search，单个成员

#    picked_book GET    /books/:id/picked(.:format) books#picked
#   search_books GET    /books/search(.:format)     books#search
# search_a_books GET    /books/search_a(.:format)   books#search_a
# search_b_books GET    /books/search_b(.:format)   books#search_b
#          books GET    /books(.:format)            books#index
#                POST   /books(.:format)            books#create
#       new_book GET    /books/new(.:format)        books#new
#      edit_book GET    /books/:id/edit(.:format)   books#edit
#           book GET    /books/:id(.:format)        books#show
#                PATCH  /books/:id(.:format)        books#update
#                PUT    /books/:id(.:format)        books#update
#                DELETE /books/:id(.:format)        books#destroy

	# 排除资源路由中的部份动作
	#单个排除
  	# resources :books, :except => :show #except: 'show'
  	resources :books do 
  		:except => :show
 	end

 	 # resources :books do
 	 # end
end





