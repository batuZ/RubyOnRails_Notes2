rails new XX_API --api

```ruby
source 'https://gems.ruby-china.com'
gem 'grape'
gem "rspec-rails"  # at group :development, :test
```
```
set startUp at `config.ru` like `run API`
```
create file and test api ./app/apis/api.rb like:
```ruby
class API < Grape::API
	format :json
	params do
		requires(:name, type: String) 
	end
	get 'test' do
		{message: "#{params['name']}"}
	end
end
```
start Up
```
rails s
```

testCase:
```
# create
rails g rspec:install
```

```
# run
rspec spec/apis/api_spec.rb  # or rspec spec/apis/* --formate doc
```
