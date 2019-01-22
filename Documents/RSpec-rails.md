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
