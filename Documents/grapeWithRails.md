### rails new XX_API --api

```ruby
source 'https://gems.ruby-china.com'
gem 'grape'
gem "rspec-rails"  # at group :development, :test
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

### testCase:
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
