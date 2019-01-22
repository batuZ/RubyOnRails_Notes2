```
# RSpec 单元测试
# grape api单元测试
# https://blog.csdn.net/shiralwz/article/details/49075307
# https://github.com/rspec/rspec-rails
# https://relishapp.com/rspec/rspec-rails/docs

```

gem 'rspec-rails'

`$ rails g rspec:install`

`$ rspec spec/*`

 -API
```runy
class API < Grape::API
	format :json
	get :test do 
		{name: "#{params[:name]}"}
	end
end 
```


 -RSpec
```ruby
require 'rails_helper'

RSpec.describe API do
	describe '#AAA' do
		it 'should return zhang', type: :request do
			get '/test', :params => {:name => 'fd'}
			expect(response.status).to be == 200
			body = JSON.parse(response.body)
			expect(body['name']).to be == 'fdd'
		end
	end
end
```
