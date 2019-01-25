### rails new API --api
- 翻译版文档：http://xiajian.github.io/2014/10/24/grade
- 示例工程： https://github.com/batuZ/Rails_GrapeAPI/tree/master/v2
```ruby
source 'https://gems.ruby-china.com'
gem 'jwt'		# token
gem 'grape'		# api
gem 'grape-entity'	# object to json
gem "rspec-rails"  	# at group :development, :test
```
```
set startUp at `config.ru` like `run API`
set routes `mount API => '/'`
```

### create file and test api ./app/apis/api.rb like:
```ruby
class API < Grape::API
	format :json
	params do
		requires(:message, type: String) 
	end
	get 'test' do
		status 200
		{message: "#{params['message']}"}
	end
end
```
start Up
```
rails s
```

### RSpec:
```
# create
rails g rspec:install
```
create testFile: ./spec/apis/api_spec.rb like:
```ruby
require 'rails_helper'

# test target
RSpec.describe API, type: :request do

	# test action
	describe '#GET /test' do

		# run before all it '' do
 		before :each do
			get '/test', :params => {:message => 'testName'}
		end

		# test
		it 'status should be 200' do
			expect(response.status).to be == 200
		end

		it 'should return message' do
			body = JSON.parse(response.body)
			expect(body['message']).to be == 'testName'
		end
		
	end
end
```
```
# run
rspec spec/apis/api_spec.rb  # or rspec spec/apis/* --formate doc

# =>  API
# =>    #GET /test
# =>      status should be 200
# =>      should return message

# =>  Finished in 0.06046 seconds (files took 2.01 seconds to load)
# =>  2 examples, 0 failures
```

### grape-entity 格式化返回信息
`gem 'grape-entity'`

entities.rb
```ruby
class SoundEnt < Grape::Entity
	expose :uuid, :url
end

class UserEnt < Grape::Entity
	expose :userName, :userBio
	expose :sounds,  using: SoundEnt 
end
```
api.rb
```ruby
require 'Entities.rb'
# 测试 grape-entity
get :users do
	present User.all, with: SoundEnt
end
```
