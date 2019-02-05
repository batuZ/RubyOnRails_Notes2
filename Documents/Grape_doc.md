![grape logo](grape.png)

[![Gem Version](https://badge.fury.io/rb/grape.svg)](http://badge.fury.io/rb/grape)
[![Build Status](https://travis-ci.org/ruby-grape/grape.svg?branch=master)](https://travis-ci.org/ruby-grape/grape)
[![Code Climate](https://codeclimate.com/github/ruby-grape/grape.svg)](https://codeclimate.com/github/ruby-grape/grape)
[![Coverage Status](https://coveralls.io/repos/github/ruby-grape/grape/badge.svg?branch=master)](https://coveralls.io/github/ruby-grape/grape?branch=master)
[![Inline docs](https://inch-ci.org/github/ruby-grape/grape.svg)](https://inch-ci.org/github/ruby-grape/grape)
[![git.legal](https://git.legal/projects/1364/badge.svg "Number of libraries approved")](https://git.legal/projects/1364)
[![Join the chat at https://gitter.im/ruby-grape/grape](https://badges.gitter.im/ruby-grape/grape.svg)](https://gitter.im/ruby-grape/grape?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Table of Contents

- [What is Grape?](#what-is-grape)
- [Stable Release](#stable-release)
- [Project Resources](#project-resources)
- [Installation](#installation)
- [Basic Usage](#basic-usage)
- [Mounting](#mounting)
  - [Rack](#rack)
  - [ActiveRecord without Rails](#activerecord-without-rails)
  - [Alongside Sinatra (or other frameworks)](#alongside-sinatra-or-other-frameworks)
  - [Rails](#rails)
  - [Modules](#modules)
- [Remounting](#remounting)
  - [Mount Configuration](#mount-configuration)
- [Versioning](#versioning)
  - [Path](#path)
  - [Header](#header)
  - [Accept-Version Header](#accept-version-header)
  - [Param](#param)
- [Describing Methods](#describing-methods)
- [Configuration](#configuration)
- [Parameters](#parameters)
  - [Params Class](#params-class)
  - [Declared](#declared)
  - [Include Parent Namespaces](#include-parent-namespaces)
  - [Include Missing](#include-missing)
- [Parameter Validation and Coercion](#parameter-validation-and-coercion)
  - [Supported Parameter Types](#supported-parameter-types)
  - [Integer/Fixnum and Coercions](#integerfixnum-and-coercions)
  - [Custom Types and Coercions](#custom-types-and-coercions)
  - [Multipart File Parameters](#multipart-file-parameters)
  - [First-Class JSON Types](#first-class-json-types)
  - [Multiple Allowed Types](#multiple-allowed-types)
  - [Validation of Nested Parameters](#validation-of-nested-parameters)
  - [Dependent Parameters](#dependent-parameters)
  - [Group Options](#group-options)
  - [Alias](#alias)
  - [Built-in Validators](#built-in-validators)
    - [allow_blank](#allow_blank)
    - [values](#values)
    - [except_values](#except_values)
    - [same_as](#same_as)
    - [regexp](#regexp)
    - [mutually_exclusive](#mutually_exclusive)
    - [exactly_one_of](#exactly_one_of)
    - [at_least_one_of](#at_least_one_of)
    - [all_or_none_of](#all_or_none_of)
    - [Nested mutually_exclusive, exactly_one_of, at_least_one_of, all_or_none_of](#nested-mutually_exclusive-exactly_one_of-at_least_one_of-all_or_none_of)
  - [Namespace Validation and Coercion](#namespace-validation-and-coercion)
  - [Custom Validators](#custom-validators)
  - [Validation Errors](#validation-errors)
  - [I18n](#i18n)
  - [Custom Validation messages](#custom-validation-messages)
    - [presence, allow_blank, values, regexp](#presence-allow_blank-values-regexp)
    - [same_as](#same_as-1)
    - [all_or_none_of](#all_or_none_of-1)
    - [mutually_exclusive](#mutually_exclusive-1)
    - [exactly_one_of](#exactly_one_of-1)
    - [at_least_one_of](#at_least_one_of-1)
    - [Coerce](#coerce)
    - [With Lambdas](#with-lambdas)
    - [Pass symbols for i18n translations](#pass-symbols-for-i18n-translations)
    - [Overriding Attribute Names](#overriding-attribute-names)
    - [With Default](#with-default)
- [Headers](#headers)
- [Routes](#routes)
- [Helpers](#helpers)
- [Path Helpers](#path-helpers)
- [Parameter Documentation](#parameter-documentation)
- [Cookies](#cookies)
- [HTTP Status Code](#http-status-code)
- [Redirecting](#redirecting)
- [Recognizing Path](#recognizing-path)
- [Allowed Methods](#allowed-methods)
- [Raising Exceptions](#raising-exceptions)
  - [Default Error HTTP Status Code](#default-error-http-status-code)
  - [Handling 404](#handling-404)
- [Exception Handling](#exception-handling)
    - [Rescuing exceptions inside namespaces](#rescuing-exceptions-inside-namespaces)
    - [Unrescuable Exceptions](#unrescuable-exceptions)
    - [Exceptions that should be rescued explicitly](#exceptions-that-should-be-rescued-explicitly)
  - [Rails 3.x](#rails-3x)
- [Logging](#logging)
- [API Formats](#api-formats)
  - [JSONP](#jsonp)
  - [CORS](#cors)
- [Content-type](#content-type)
- [API Data Formats](#api-data-formats)
- [JSON and XML Processors](#json-and-xml-processors)
- [RESTful Model Representations](#restful-model-representations)
  - [Grape Entities](#grape-entities)
  - [Hypermedia and Roar](#hypermedia-and-roar)
  - [Rabl](#rabl)
  - [Active Model Serializers](#active-model-serializers)
- [Sending Raw or No Data](#sending-raw-or-no-data)
- [Authentication](#authentication)
  - [Basic and Digest Auth](#basic-and-digest-auth)
  - [Register custom middleware for authentication](#register-custom-middleware-for-authentication)
- [Describing and Inspecting an API](#describing-and-inspecting-an-api)
- [Current Route and Endpoint](#current-route-and-endpoint)
- [Before and After](#before-and-after)
- [Anchoring](#anchoring)
- [Using Custom Middleware](#using-custom-middleware)
  - [Grape Middleware](#grape-middleware)
  - [Rails Middleware](#rails-middleware)
  - [Remote IP](#remote-ip)
- [Writing Tests](#writing-tests)
  - [Writing Tests with Rack](#writing-tests-with-rack)
    - [RSpec](#rspec)
    - [Airborne](#airborne)
    - [MiniTest](#minitest)
  - [Writing Tests with Rails](#writing-tests-with-rails)
    - [RSpec](#rspec-1)
    - [MiniTest](#minitest-1)
  - [Stubbing Helpers](#stubbing-helpers)
- [Reloading API Changes in Development](#reloading-api-changes-in-development)
  - [Reloading in Rack Applications](#reloading-in-rack-applications)
  - [Reloading in Rails Applications](#reloading-in-rails-applications)
- [Performance Monitoring](#performance-monitoring)
  - [Active Support Instrumentation](#active-support-instrumentation)
    - [endpoint_run.grape](#endpoint_rungrape)
    - [endpoint_render.grape](#endpoint_rendergrape)
    - [endpoint_run_filters.grape](#endpoint_run_filtersgrape)
    - [endpoint_run_validators.grape](#endpoint_run_validatorsgrape)
    - [format_response.grape](#format_responsegrape)
  - [Monitoring Products](#monitoring-products)
- [Contributing to Grape](#contributing-to-grape)
- [License](#license)
- [Copyright](#copyright)

## What is Grape?

Grape是Ruby的类似REST的API框架。 它设计用于在Rackor上运行，通过提供简单的DSL来轻松开发RESTful API，从而补充现有的Web应用程序框架，如Rails和Sinatra。 它内置了对常见约定的支持，包括多种格式，子域/前缀限制，内容协商，版本控制等等。

## Stable Release

您正在阅读下一版Grape的文档，该版本应为** 1.2.4 **。
从先前版本升级时，请阅读[UPGRADING]（UPGRADING.md）。
目前的稳定版本是[1.2.3]（https://github.com/ruby-grape/grape/blob/v1.2.3/README.md）。

## Project Resources

* [Grape Website](http://www.ruby-grape.org)
* [Documentation](http://www.rubydoc.info/gems/grape)
* Need help? Try [Grape Google Group](http://groups.google.com/group/ruby-grape) or [Gitter](https://gitter.im/ruby-grape/grape)
* [Follow us on Twitter](https://twitter.com/grapeframework)

## Installation

Grape is available as a gem, to install it just install the gem:

    gem install grape

If you're using Bundler, add the gem to Gemfile.

    gem 'grape'

Run `bundle install`.

## Basic Usage

Grape API是通过子类化“Grape :: API”创建的Rack应用程序。
下面是一个简单的例子，展示了Grape的一些更常见的功能
重新创建Twitter API部分的上下文。

```ruby
module Twitter
  class API < Grape::API
    version 'v1', using: :header, vendor: 'twitter'
    format :json
    prefix :api

    helpers do
      def current_user
        @current_user ||= User.authorize!(env)
      end

      def authenticate!
        error!('401 Unauthorized', 401) unless current_user
      end
    end

    resource :statuses do
      desc 'Return a public timeline.'
      get :public_timeline do
        Status.limit(20)
      end

      desc 'Return a personal timeline.'
      get :home_timeline do
        authenticate!
        current_user.statuses.limit(20)
      end

      desc 'Return a status.'
      params do
        requires :id, type: Integer, desc: 'Status id.'
      end
      route_param :id do
        get do
          Status.find(params[:id])
        end
      end

      desc 'Create a status.'
      params do
        requires :status, type: String, desc: 'Your status.'
      end
      post do
        authenticate!
        Status.create!({
          user: current_user,
          text: params[:status]
        })
      end

      desc 'Update a status.'
      params do
        requires :id, type: String, desc: 'Status ID.'
        requires :status, type: String, desc: 'Your status.'
      end
      put ':id' do
        authenticate!
        current_user.statuses.find(params[:id]).update({
          user: current_user,
          text: params[:status]
        })
      end

      desc 'Delete a status.'
      params do
        requires :id, type: String, desc: 'Status ID.'
      end
      delete ':id' do
        authenticate!
        current_user.statuses.find(params[:id]).destroy
      end
    end
  end
end
```

## Mounting

### Rack

上面的示例创建了一个可以从rackup`config.ru`文件运行的Rack应用程序
与`rackup`：

```ruby
run Twitter::API
```

And would respond to the following routes:

    GET /api/statuses/public_timeline
    GET /api/statuses/home_timeline
    GET /api/statuses/:id
    POST /api/statuses
    PUT /api/statuses/:id
    DELETE /api/statuses/:id

Grape还会自动响应所有GET的HEAD和OPTIONS，以及所有其他路线的OPTIONS。

### ActiveRecord without Rails

如果要在Grape中使用ActiveRecord，则需要确保正确处理ActiveRecord的连接池。

实现这一目标的最简单方法是在安装Grape之前使用ActiveRecord的`config.ru`中的`ConnectionManagement`中间件，例如：

```ruby
use ActiveRecord::ConnectionAdapters::ConnectionManagement

run Twitter::API
```

### Alongside Sinatra (or other frameworks)

如果您希望将Grape与另一个Rack框架（如Sinatra）一起安装，您可以使用`Rack :: Cascade`轻松完成：

```ruby
# Example config.ru

require 'sinatra'
require 'grape'

class API < Grape::API
  get :hello do
    { hello: 'world' }
  end
end

class Web < Sinatra::Base
  get '/' do
    'Hello world.'
  end
end

use Rack::Session::Cookie
run Rack::Cascade.new [API, Web]
```

### Rails

将API文件放入`app / api`。 Rails需要一个与Ruby模块名称匹配的子目录和一个与该类名称匹配的文件名。 在我们的示例中，`Twitter :: API`的文件名位置和目录应为`app / api / twitter / api.rb`。

Modify `application.rb`:

```ruby
config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]
```

Modify `config/routes`:

```ruby
mount Twitter::API => '/'
```

有关在开发中重新加载API更改的其他代码，请参阅[下面]（＃reloading-api-changes-in-development）。

### Modules

You can mount multiple API implementations inside another one. These don't have to be different versions, but may be components of the same API.
您可以在另一个API实现中安装多个API实现。 这些不必是不同的版本，但可以是相同API的组件。

```ruby
class Twitter::API < Grape::API
  mount Twitter::APIv1
  mount Twitter::APIv2
end
```
You can also mount on a path, which is similar to using prefix inside the mounted API itself.
您也可以在路径上安装，这类似于在已安装的API本身内使用`prefix`。

```ruby
class Twitter::API < Grape::API
  mount Twitter::APIv1 => '/v1'
end
```
Keep in mind such declarations as before/after/rescue_from must be placed before mount in a case where they should be inherited.
请记住，在应该继承它们的情况下，必须在`mount`之前放置`之前/之后/ rescue_from`这样的声明。

```ruby
class Twitter::API < Grape::API
  before do
    header 'X-Base-Header', 'will be defined for all APIs that are mounted below'
  end

  mount Twitter::Users
  mount Twitter::Search
end
```

## Remounting

You can mount the same endpoints in two different locations.
您可以在两个不同的位置安装相同的端点。

```ruby
class Voting::API < Grape::API
  namespace 'votes' do
    get do
      # Your logic
    end

    post do
      # Your logic
    end
  end
end

class Post::API < Grape::API
  mount Voting::API
end

class Comment::API < Grape::API
  mount Voting::API
end
```

Assuming that the post and comment endpoints are mounted in `/posts` and `/comments`, you should now be able to do `get /posts/votes`, `post /posts/votes`, `get /comments/votes`.
假设post和comment端点安装在`/ posts`和`/ comments`中，你现在应该可以做`get / posts / votes`，`post / posts / votes`，`get / comments / votes`。
### Mount Configuration

You can configure remountable endpoints to change small details according to where they are mounted.
您可以配置可重新安装的端点，以根据安装位置更改小细节。
```ruby
class Voting::API < Grape::API
  namespace 'votes' do
    desc "Vote for your #{configuration[:votable]}"
    get do
      # Your logic
    end
  end
end

class Post::API < Grape::API
  mount Voting::API, with: { votable: 'posts' }
end

class Comment::API < Grape::API
  mount Voting::API, with: { votable: 'comments' }
end
```

## Versioning

There are four strategies in which clients can reach your API's endpoints: `:path`,
`:header`, `:accept_version_header` and `:param`. The default strategy is `:path`.
客户端可以通过四种策略访问API端点：`：path`，`：header`，`：accept version header`和`：param`。 默认策略是`：path`。

### Path

```ruby
version 'v1', using: :path
```

Using this versioning strategy, clients should pass the desired version in the URL.
使用此版本控制策略，客户端应在URL中传递所需的版本。

    curl http://localhost:9292/v1/statuses/public_timeline

### Header

```ruby
version 'v1', using: :header, vendor: 'twitter'
```

Currently, Grape only supports versioned media types in the following format:
目前，Grape仅支持以下格式的版本化媒体类型：

```
vnd.vendor-and-or-resource-v1234+format
```

Basically all tokens between the final `-` and the `+` will be interpreted as the version.
基本上，最终的`-`和`+`之间的所有标记都将被解释为版本。

Using this versioning strategy, clients should pass the desired version in the HTTP `Accept` head.
使用此版本控制策略，客户端应在HTTP“Accept”头中传递所需的版本。

    curl -H Accept:application/vnd.twitter-v1+json http://localhost:9292/statuses/public_timeline

By default, the first matching version is used when no `Accept` header is
supplied. This behavior is similar to routing in Rails. To circumvent this default behavior,
one could use the `:strict` option. When this option is set to `true`, a `406 Not Acceptable` error
is returned when no correct `Accept` header is supplied.
默认情况下，在未提供“Accept”标头时使用第一个匹配版本。 此行为类似于Rails中的路由。 为了规避这种默认行为，可以使用`：strict`选项。 当此选项设置为“true”时，如果未提供正确的“Accept”标头，则返回“406 Not Acceptable”错误。

When an invalid `Accept` header is supplied, a `406 Not Acceptable` error is returned if the `:cascade`
option is set to `false`. Otherwise a `404 Not Found` error is returned by Rack if no other route
matches.
当提供无效的`Accept`标头时，如果`：cascade`选项设置为`false`，则返回'406 Not Acceptable`错误。 否则，如果没有其他路由匹配，则Rack会返回“404 Not Found”错误。

### Accept-Version Header

```ruby
version 'v1', using: :accept_version_header
```

Using this versioning strategy, clients should pass the desired version in the HTTP `Accept-Version` header.
使用此版本控制策略，客户端应在HTTP“Accept-Version”标头中传递所需的版本。

    curl -H "Accept-Version:v1" http://localhost:9292/statuses/public_timeline

By default, the first matching version is used when no `Accept-Version` header is
supplied. This behavior is similar to routing in Rails. To circumvent this default behavior,
one could use the `:strict` option. When this option is set to `true`, a `406 Not Acceptable` error
is returned when no correct `Accept` header is supplied and the `:cascade` option is set to `false`.
Otherwise a `404 Not Found` error is returned by Rack if no other route matches.
默认情况下，在未提供“Accept-Version”标头时使用第一个匹配版本。 此行为类似于Rails中的路由。 为了规避这种默认行为，可以使用`：strict`选项。 当此选项设置为“true”时，如果未提供正确的“Accept”标头且“：cascade”选项设置为“false”，则返回“406 Not Acceptable”错误。 否则，如果没有其他路由匹配，则Rack会返回“404 Not Found”错误。

### Param

```ruby
version 'v1', using: :param
```

Using this versioning strategy, clients should pass the desired version as a request parameter,
either in the URL query string or in the request body.
使用此版本控制策略，客户端应将所需版本作为请求参数传递到URL查询字符串或请求正文中。

    curl http://localhost:9292/statuses/public_timeline?apiver=v1

The default name for the query parameter is 'apiver' but can be specified using the `:parameter` option.
查询参数的默认名称是'apiver'，但可以使用`：parameter`选项指定。

```ruby
version 'v1', using: :param, parameter: 'v'
```

    curl http://localhost:9292/statuses/public_timeline?v=v1


## Describing Methods

You can add a description to API methods and namespaces. The description would be used by [grape-swagger][grape-swagger] to generate swagger compliant documentation.
您可以向API方法和命名空间添加描述。 描述将由[grape-swagger] [grape-swagger]用于生成符合swagger标准的文档。

Note: Description block is only for documentation and won't affects API behavior.
注意：描述块仅用于文档，不会影响API行为。

```ruby
desc 'Returns your public timeline.' do
  summary 'summary'
  detail 'more details'
  params  API::Entities::Status.documentation
  success API::Entities::Entity
  failure [[401, 'Unauthorized', 'Entities::Error']]
  named 'My named route'
  headers XAuthToken: {
            description: 'Validates your identity',
            required: true
          },
          XOptionalHeader: {
            description: 'Not really needed',
            required: false
          }
  hidden false
  deprecated false
  is_array true
  nickname 'nickname'
  produces ['application/json']
  consumes ['application/json']
  tags ['tag1', 'tag2']
end
get :public_timeline do
  Status.limit(20)
end
```

* `detail`: A more enhanced description
* `params`: Define parameters directly from an `Entity`
* `success`: (former entity) The `Entity` to be used to present by default this route
* `failure`: (former http_codes) A definition of the used failure HTTP Codes and Entities
* `named`: A helper to give a route a name and find it with this name in the documentation Hash
* `headers`: A definition of the used Headers
* Other options can be found in [grape-swagger][grape-swagger]

*`detail`：更加强化的描述
*`params`：直接从`Entity`定义参数
*`success` :(前实体）用于默认显示此路线的`Entity`
*`failure` :(以前的http_codes）使用的失败HTTP代码和实体的定义
*`named`：一个帮助器，为路由提供一个名称，并在文档Hash中使用此名称查找它
*`headers`：使用的标题的定义
*其他选项可以在[grape-swagger][grape-swagger]中找到

[grape-swagger]: https://github.com/ruby-grape/grape-swagger

## Configuration

Use `Grape.configure` to set up global settings at load time.
Currently the configurable settings are:
使用`Grape.configure`在加载时设置全局设置。目前可配置的设置是：

* `param_builder`: Sets the [Parameter Builder](#parameters), defaults to `Grape::Extensions::ActiveSupport::HashWithIndifferentAccess::ParamBuilder`.
*`param_builder`：设置[Parameter Builder](#parameters)，默认为`Grape::Extensions::ActiveSupport:: HashWithIndifferentAccess :: ParamBuilder`。

To change a setting value make sure that at some point during load time the following code runs
要更改设置值，请确保在加载时间的某个时刻运行以下代码

```ruby
Grape.configure do |config|
  config.setting = value
end
```

For example, for the `param_builder`, the following code could run in an initializer:
例如，对于`param_builder`，以下代码可以在初始化程序中运行：

```ruby
Grape.configure do |config|
  config.param_builder = Grape::Extensions::Hashie::Mash::ParamBuilder
end
```

## Parameters

Request parameters are available through the `params` hash object. This includes `GET`, `POST`
and `PUT` parameters, along with any named parameters you specify in your route strings.
请求参数可通过`params`哈希对象获得。 这包括`GET`，`POST` 和`PUT`参数，以及您在路径字符串中指定的任何命名参数。

```ruby
get :public_timeline do
  Status.order(params[:sort_by])
end
```

Parameters are automatically populated from the request body on `POST` and `PUT` for form input, JSON and
XML content-types.
从`POST`和`PUT`上的请求体自动填充参数，用于表单输入，JSON和XML内容类型。

The request:

```
curl -d '{"text": "140 characters"}' 'http://localhost:9292/statuses' -H Content-Type:application/json -v
```

The Grape endpoint:

```ruby
post '/statuses' do
  Status.create!(text: params[:text])
end
```

Multipart POSTs and PUTs are supported as well.
还支持多部分POST和PUT。

The request:

```
curl --form image_file='@image.jpg;type=image/jpg' http://localhost:9292/upload
```

The Grape endpoint:

```ruby
post 'upload' do
  # file in params[:image_file]
end
```

In the case of conflict between either of:
如果两者之间发生冲突：

* route string parameters
* `GET`, `POST` and `PUT` parameters
* the contents of the request body on `POST` and `PUT`
* 路由字符串参数
* `GET`，`POST`和`PUT`参数
* 请求正文的内容在`POST`和`PUT`

Route string parameters will have precedence.
路由字符串参数将具有优先权。

### Params Class

By default parameters are available as `ActiveSupport::HashWithIndifferentAccess`. This can be changed to, for example, Ruby `Hash` or `Hashie::Mash` for the entire API.
默认情况下，参数可用作“ActiveSupport :: HashWithIndifferentAccess”。 
对于整个API，这可以改为例如Ruby`Hash`或`Hashie :: Mash`。

```ruby
class API < Grape::API
  include Grape::Extensions::Hashie::Mash::ParamBuilder

  params do
    optional :color, type: String
  end
  get do
    params.color # instead of params[:color]
  end
```

The class can also be overridden on individual parameter blocks using `build_with` as follows.
也可以使用`build_with`在各个参数块上覆盖该类，如下所示。

```ruby
params do
  build_with Grape::Extensions::Hash::ParamBuilder
  optional :color, type: String
end
```

Or globally with the [Configuration](#configuration) `Grape.configure.param_builder`.
或全局使用[Configuration](#configuration) `Grape.configure.param_builder`。

In the example above, `params["color"]` will return `nil` since `params` is a plain `Hash`.
在上面的例子中，`params [“color”]`将返回`nil`，因为`params`是一个普通的`Hash`。

Available parameter builders are `Grape::Extensions::Hash::ParamBuilder`, `Grape::Extensions::ActiveSupport::HashWithIndifferentAccess::ParamBuilder` and `Grape::Extensions::Hashie::Mash::ParamBuilder`.
可用的参数构建器是`Grape :: Extensions :: Hash :: ParamBuilder`，`Grape :: Extensions :: ActiveSupport :: HashWithIndifferentAccess :: ParamBuilder`和`Grape :: Extensions :: Hashie :: Mash :: ParamBuilder`。

### Declared

Grape allows you to access only the parameters that have been declared by your `params` block. It filters out the params that have been passed, but are not allowed. Consider the following API endpoint:
Grape允许您只访问`params`块声明的参数。 它过滤掉已经通过的参数，但是不允许。 考虑以下API端点：

````ruby
format :json

post 'users/signup' do
  { 'declared_params' => declared(params) }
end
````

If you do not specify any parameters, `declared` will return an empty hash.
如果你没有指定任何参数，`declared`将返回一个空哈希。

**Request**

````bash
curl -X POST -H "Content-Type: application/json" localhost:9292/users/signup -d '{"user": {"first_name":"first name", "last_name": "last name"}}'
````

**Response**

````json
{
  "declared_params": {}
}

````

Once we add parameters requirements, grape will start returning only the declared parameters.
一旦我们添加参数要求，葡萄将开始仅返回声明的参数。

````ruby
format :json

params do
  requires :user, type: Hash do
    requires :first_name, type: String
    requires :last_name, type: String
  end
end

post 'users/signup' do
  { 'declared_params' => declared(params) }
end
````

**Request**

````bash
curl -X POST -H "Content-Type: application/json" localhost:9292/users/signup -d '{"user": {"first_name":"first name", "last_name": "last name", "random": "never shown"}}'
````

**Response**

````json
{
  "declared_params": {
    "user": {
      "first_name": "first name",
      "last_name": "last name"
    }
  }
}
````

The returned hash is an `ActiveSupport::HashWithIndifferentAccess`.
返回的哈希是一个`ActiveSupport :: HashWithIndifferentAccess`。

The `#declared` method is not available to `before` filters, as those are evaluated prior to parameter coercion.
``declaration`方法不适用于`before`过滤器，因为它们在强制参数之前被评估。

### Include Parent Namespaces

By default `declared(params)` includes parameters that were defined in all parent namespaces. If you want to return only parameters from your current namespace, you can set `include_parent_namespaces` option to `false`.
默认情况下，`declared（params）`包含在所有父命名空间中定义的参数。 如果只想从当前命名空间返回参数，可以将`include_parent_namespaces`选项设置为`false`。

````ruby
format :json

namespace :parent do
  params do
    requires :parent_name, type: String
  end

  namespace ':parent_name' do
    params do
      requires :child_name, type: String
    end
    get ':child_name' do
      {
        'without_parent_namespaces' => declared(params, include_parent_namespaces: false),
        'with_parent_namespaces' => declared(params, include_parent_namespaces: true),
      }
    end
  end
end
````

**Request**

````bash
curl -X GET -H "Content-Type: application/json" localhost:9292/parent/foo/bar
````

**Response**

````json
{
  "without_parent_namespaces": {
    "child_name": "bar"
  },
  "with_parent_namespaces": {
    "parent_name": "foo",
    "child_name": "bar"
  },
}
````

### Include Missing

By default `declared(params)` includes parameters that have `nil` values. If you want to return only the parameters that are not `nil`, you can use the `include_missing` option. By default, `include_missing` is set to `true`. Consider the following API:
默认情况下`declared（params）`包含具有`nil`值的参数。 如果只想返回非“nil”的参数，可以使用`include_missing`选项。 默认情况下，`include_missing`设置为`true`。 请考虑以下API：

````ruby
format :json

params do
  requires :first_name, type: String
  optional :last_name, type: String
end

post 'users/signup' do
  { 'declared_params' => declared(params, include_missing: false) }
end
````

**Request**

````bash
curl -X POST -H "Content-Type: application/json" localhost:9292/users/signup -d '{"user": {"first_name":"first name", "random": "never shown"}}'
````

**Response with include_missing:false**

````json
{
  "declared_params": {
    "user": {
      "first_name": "first name"
    }
  }
}
````

**Response with include_missing:true**

````json
{
  "declared_params": {
    "first_name": "first name",
    "last_name": null
  }
}
````

It also works on nested hashes:
它也适用于嵌套哈希：

````ruby
format :json

params do
  requires :user, type: Hash do
    requires :first_name, type: String
    optional :last_name, type: String
    requires :address, type: Hash do
      requires :city, type: String
      optional :region, type: String
    end
  end
end

post 'users/signup' do
  { 'declared_params' => declared(params, include_missing: false) }
end
````

**Request**

````bash
curl -X POST -H "Content-Type: application/json" localhost:9292/users/signup -d '{"user": {"first_name":"first name", "random": "never shown", "address": { "city": "SF"}}}'
````

**Response with include_missing:false**

````json
{
  "declared_params": {
    "user": {
      "first_name": "first name",
      "address": {
        "city": "SF"
      }
    }
  }
}
````

**Response with include_missing:true**

````json
{
  "declared_params": {
    "user": {
      "first_name": "first name",
      "last_name": null,
      "address": {
        "city": "Zurich",
        "region": null
      }
    }
  }
}
````

Note that an attribute with a `nil` value is not considered *missing* and will also be returned
when `include_missing` is set to `false`:
请注意，具有“nil”值的属性不被视为* missing *，并且当`include_missing`设置为“false”时也将返回：

**Request**

````bash
curl -X POST -H "Content-Type: application/json" localhost:9292/users/signup -d '{"user": {"first_name":"first name", "last_name": null, "address": { "city": "SF"}}}'
````

**Response with include_missing:false**

````json
{
  "declared_params": {
    "user": {
      "first_name": "first name",
      "last_name": null,
      "address": { "city": "SF"}
    }
  }
}
````

## Parameter Validation and Coercion

You can define validations and coercion options for your parameters using a `params` block.
您可以使用`params`块为参数定义验证和强制选项。

```ruby
params do
  requires :id, type: Integer
  optional :text, type: String, regexp: /\A[a-z]+\z/
  group :media, type: Hash do
    requires :url
  end
  optional :audio, type: Hash do
    requires :format, type: Symbol, values: [:mp3, :wav, :aac, :ogg], default: :mp3
  end
  mutually_exclusive :media, :audio
end
put ':id' do
  # params[:id] is an Integer
end
```

When a type is specified an implicit validation is done after the coercion to ensure
the output type is the one declared.
指定类型时，在强制执行后执行隐式验证，以确保输出类型是声明的输出类型。

Optional parameters can have a default value.
可选参数可以具有默认值。

```ruby
params do
  optional :color, type: String, default: 'blue'
  optional :random_number, type: Integer, default: -> { Random.rand(1..100) }
  optional :non_random_number, type: Integer, default:  Random.rand(1..100)
end
```

Note that default values will be passed through to any validation options specified.
The following example will always fail if `:color` is not explicitly provided.
请注意，默认值将传递给指定的任何验证选项。如果未明确提供`：color`，以下示例将始终失败。

Default values are eagerly evaluated. Above `:non_random_number` will evaluate to the same
number for each call to the endpoint of this `params` block. To have the default evaluate
lazily with each request use a lambda, like `:random_number` above.
急切地评估默认值。 上面`：non_random_number`将为每个调用此`params`块的端点计算相同的数字。 要使用每个请求延迟评估默认值，请使用lambda，如上面的`：random_number`。

```ruby
params do
  optional :color, type: String, default: 'blue', values: ['red', 'green']
end
```

The correct implementation is to ensure the default value passes all validations.
正确的实现是确保默认值通过所有验证。

```ruby
params do
  optional :color, type: String, default: 'blue', values: ['blue', 'red', 'green']
end
```

### Supported Parameter Types

The following are all valid types, supported out of the box by Grape:
以下是Grape支持的所有有效类型：
* Integer
* Float
* BigDecimal
* Numeric
* Date
* DateTime
* Time
* Boolean
* String
* Symbol
* Rack::Multipart::UploadedFile (alias `File`)
* JSON

### Integer/Fixnum and Coercions

Please be aware that the behavior differs between Ruby 2.4 and earlier versions.
In Ruby 2.4, values consisting of numbers are converted to Integer, but in earlier versions it will be treated as Fixnum.
请注意，Ruby 2.4和早期版本之间的行为有所不同。
在Ruby 2.4中，由数字组成的值将转换为Integer，但在早期版本中，它将被视为Fixnum。

```ruby
params do
  requires :integers, type: Hash do
    requires :int, coerce: Integer
  end
end
get '/int' do
  params[:integers][:int].class
end

...

get '/int' integers: { int: '45' }
  #=> Integer in ruby 2.4
  #=> Fixnum in earlier ruby versions
```

### Custom Types and Coercions

Aside from the default set of supported types listed above, any class can be
used as a type as long as an explicit coercion method is supplied. If the type
implements a class-level `parse` method, Grape will use it automatically.
This method must take one string argument and return an instance of the correct
type, or raise an exception to indicate the value was invalid. E.g.,
除了上面列出的默认支持类型集之外，只要提供了显式强制方法，任何类都可以用作类型。 如果类型实现了类级别的“parse”方法，Grape将自动使用它。
此方法必须使用一个字符串参数并返回正确类型的实例，或者引发异常以指示该值无效。 例如。，

```ruby
class Color
  attr_reader :value
  def initialize(color)
    @value = color
  end

  def self.parse(value)
    fail 'Invalid color' unless %w(blue red green).include?(value)
    new(value)
  end
end

params do
  requires :color, type: Color, default: Color.new('blue')
  requires :more_colors, type: Array[Color] # Collections work
  optional :unique_colors, type: Set[Color] # Duplicates discarded
end

get '/stuff' do
  # params[:color] is already a Color.
  params[:color].value
end
```

Alternatively, a custom coercion method may be supplied for any type of parameter
using `coerce_with`. Any class or object may be given that implements a `parse` or
`call` method, in that order of precedence. The method must accept a single string
parameter, and the return value must match the given `type`.
或者，可以使用`coerce_with`为任何类型的参数提供自定义强制方法。 
可以按照优先顺序给出任何实现“parse”或“call”方法的类或对象。 
该方法必须接受单个字符串参数，并且返回值必须与给定的`type`匹配。

```ruby
params do
  requires :passwd, type: String, coerce_with: Base64.method(:decode64)
  requires :loud_color, type: Color, coerce_with: ->(c) { Color.parse(c.downcase) }

  requires :obj, type: Hash, coerce_with: JSON do
    requires :words, type: Array[String], coerce_with: ->(val) { val.split(/\s+/) }
    optional :time, type: Time, coerce_with: Chronic
  end
end
```

Example of use of `coerce_with` with a lambda (a class with a `parse` method could also have been used)
It will parse a string and return an Array of Integers, matching the `Array[Integer]` `type`.
使用带有lambda的`coerce_with`的示例（也可以使用带有`parse`方法的类）它将解析一个字符串并返回一个整数数组，匹配`Array [Integer]``type`。

```ruby
params do
  requires :values, type: Array[Integer], coerce_with: ->(val) { val.split(/\s+/).map(&:to_i) }
end
```

Grape will assert that coerced values match the given `type`, and will reject the request
if they do not. To override this behaviour, custom types may implement a `parsed?` method
that should accept a single argument and return `true` if the value passes type validation.
Grape将断言强制值与给定的`type`匹配，如果不这样做，将拒绝该请求。 要覆盖此行为，自定义类型可以实现一个`parsed？`方法，该方法应接受单个参数，如果值通过类型验证则返回“true”。

```ruby
class SecureUri
  def self.parse(value)
    URI.parse value
  end

  def self.parsed?(value)
    value.is_a? URI::HTTPS
  end
end

params do
  requires :secure_uri, type: SecureUri
end
```

### Multipart File Parameters

Grape makes use of `Rack::Request`'s built-in support for multipart file parameters. Such parameters can be declared with `type: File`:
Grape利用`Rack :: Request`对多部分文件参数的内置支持。 这些参数可以用`type：File`声明：

```ruby
params do
  requires :avatar, type: File
end
post '/' do
  params[:avatar][:filename] # => 'avatar.png'
  params[:avatar][:type] # => 'image/png'
  params[:avatar][:tempfile] # => #<File>
end
```

### First-Class `JSON` Types

Grape supports complex parameters given as JSON-formatted strings using the special `type: JSON`
declaration. JSON objects and arrays of objects are accepted equally, with nested validation
rules applied to all objects in either case:
Grape支持使用特殊的`type：JSON`声明以JSON格式的字符串给出的复杂参数。
JSON对象和对象数组被同等接受，在任何一种情况下都将嵌套验证规则应用于所有对象：

```ruby
params do
  requires :json, type: JSON do
    requires :int, type: Integer, values: [1, 2, 3]
  end
end
get '/' do
  params[:json].inspect
end

client.get('/', json: '{"int":1}') # => "{:int=>1}"
client.get('/', json: '[{"int":"1"}]') # => "[{:int=>1}]"

client.get('/', json: '{"int":4}') # => HTTP 400
client.get('/', json: '[{"int":4}]') # => HTTP 400
```

Additionally `type: Array[JSON]` may be used, which explicitly marks the parameter as an array
of objects. If a single object is supplied it will be wrapped.
另外，可以使用`type：Array [JSON]`，它将参数显式标记为对象数组。 如果提供单个对象，它将被包装。
```ruby
params do
  requires :json, type: Array[JSON] do
    requires :int, type: Integer
  end
end
get '/' do
  params[:json].each { |obj| ... } # always works
end
```
For stricter control over the type of JSON structure which may be supplied,
use `type: Array, coerce_with: JSON` or `type: Hash, coerce_with: JSON`.
为了更严格地控制可能提供的JSON结构的类型，使用`type：Array，coerce_with：JSON`或`type：Hash，coerce_with：JSON`。

### Multiple Allowed Types

Variant-type parameters can be declared using the `types` option rather than `type`:
可以使用`types`选项而不是`type`声明变量类型参数：

```ruby
params do
  requires :status_code, types: [Integer, String, Array[Integer, String]]
end
get '/' do
  params[:status_code].inspect
end

client.get('/', status_code: 'OK_GOOD') # => "OK_GOOD"
client.get('/', status_code: 300) # => 300
client.get('/', status_code: %w(404 NOT FOUND)) # => [404, "NOT", "FOUND"]
```

As a special case, variant-member-type collections may also be declared, by
passing a `Set` or `Array` with more than one member to `type`:
作为一种特殊情况，也可以通过将带有多个成员的`Set`或`Array`传递给`type`来声明variant-member-type集合：

```ruby
params do
  requires :status_codes, type: Array[Integer,String]
end
get '/' do
  params[:status_codes].inspect
end

client.get('/', status_codes: %w(1 two)) # => [1, "two"]
```

### Validation of Nested Parameters

Parameters can be nested using `group` or by calling `requires` or `optional` with a block.
参数可以使用`group`嵌套，也可以使用块调用`requires`或`optional`。

In the [above example](#parameter-validation-and-coercion), this means `params[:media][:url]` is required along with `params[:id]`,and `params[:audio][:format]` is required only if `params[:audio]` is present.
在[above example](#parameter-validation-and-coercion)中，这意味着需要`params[:media][:url]`以及`params[:id]`和`params[:audio][:format]`仅当`params[:audio]`存在时才需要。

With a block, `group`, `requires` and `optional` accept an additional option `type` which can
be either `Array` or `Hash`, and defaults to `Array`. Depending on the value, the nested
parameters will be treated either as values of a hash or as values of hashes in an array.
使用块，`group`，`requires`和`optional`接受一个额外的选项`type`，它可以是`Array`或`Hash`，默认为`Array`。 根据值，嵌套参数将被视为散列值或数组中散列值。

```ruby
params do
  optional :preferences, type: Array do
    requires :key
    requires :value
  end

  requires :name, type: Hash do
    requires :first_name
    requires :last_name
  end
end
```

### Dependent Parameters

Suppose some of your parameters are only relevant if another parameter is given;
Grape allows you to express this relationship through the `given` method in your
parameters block, like so:
假设您的某些参数仅在给出另一个参数时才相关; Grape允许您通过参数块中的`given`方法表达这种关系，如下所示：

```ruby
params do
  optional :shelf_id, type: Integer
  given :shelf_id do
    requires :bin_id, type: Integer
  end
end
```

In the example above Grape will use `blank?` to check whether the `shelf_id` param is present.
在上面的例子中，Grape将使用`blank？`来检查`shelf_id`参数是否存在。

`given` also takes a `Proc` with custom code. Below, the param `description` is required only if the value of `category` is equal `foo`:
`given`也带有自定义代码的`Proc`。 下面，只有当`category`的值等于`foo`时才需要param`description`：

```ruby
params do
  optional :category
  given category: ->(val) { val == 'foo' } do
    requires :description
  end
end
```

You can set alias for parameter:
您可以为参数设置别名：

```ruby
params do
  optional :category, as: :type
  given type: ->(val) { val == 'foo' } do
    requires :description
  end
end
```

Note: param in `given` should be the aliased one. In the example, it should be `type`, not `category`.
注意：`given`中的param应该是别名的。 在示例中，它应该是`type`，而不是`category`。

### Group Options

Parameters options can be grouped. It can be useful if you want to extract
common validation or types for several parameters. The example below presents a
typical case when parameters share common options.
参数选项可以分组。 如果要为多个参数提取常见验证或类型，它可能很有用。 以下示例介绍了参数共享公共选项时的典型情况。

```ruby
params do
  requires :first_name, type: String, regexp: /w+/, desc: 'First name'
  requires :middle_name, type: String, regexp: /w+/, desc: 'Middle name'
  requires :last_name, type: String, regexp: /w+/, desc: 'Last name'
end
```

Grape allows you to present the same logic through the `with` method in your
parameters block, like so:
Grape允许您通过参数块中的`with`方法呈现相同的逻辑，如下所示：

```ruby
params do
  with(type: String, regexp: /w+/) do
    requires :first_name, desc: 'First name'
    requires :middle_name, desc: 'Middle name'
    requires :last_name, desc: 'Last name'
  end
end
```

### Alias
(别名)

You can set an alias for parameters using `as`, which can be useful when refactoring existing APIs:
您可以使用`as`为参数设置别名，这在重构现有API时非常有用：

```ruby
resource :users do
  params do
    requires :email_address, as: :email
    requires :password
  end
  post do
    User.create!(declared(params)) # User takes email and password
  end
end
```

The value passed to `as` will be the key when calling `params` or `declared(params)`.
传递给`as`的值将是调用`params`或`declared（params）`时的键。

### Built-in Validators
（内置验证器）
#### `allow_blank`
（允许为空）

Parameters can be defined as `allow_blank`, ensuring that they contain a value. By default, `requires`
only validates that a parameter was sent in the request, regardless its value. With `allow_blank: false`,
empty values or whitespace only values are invalid.
参数可以定义为`allow_blank`，确保它们包含一个值。 默认情况下，`requires`仅验证请求中是否发送了参数，无论其值如何。 对于`allow_blank：false`，空值或空格仅值无效。

`allow_blank` can be combined with both `requires` and `optional`. If the parameter is required, it has to contain
a value. If it's optional, it's possible to not send it in the request, but if it's being sent, it has to have
some value, and not an empty string/only whitespaces.
`allow_blank`可以与`requires`和`optional`结合使用。 如果参数是必需的，则必须包含值。 如果它是可选的，则可以不在请求中发送它，但如果它被发送，它必须有一些值，而不是空字符串/只有空格。

```ruby
params do
  requires :username, allow_blank: false
  optional :first_name, allow_blank: false
end
```

#### `values`

Parameters can be restricted to a specific set of values with the `:values` option.
可以使用`：values`选项将参数限制为一组特定值。

```ruby
params do
  requires :status, type: Symbol, values: [:not_started, :processing, :done]
  optional :numbers, type: Array[Integer], default: 1, values: [1, 2, 3, 5, 8]
end
```

Supplying a range to the `:values` option ensures that the parameter is (or parameters are) included in that range (using `Range#include?`).
为`：values`选项提供一个范围可确保参数是（或参数）包含在该范围内（使用`Range #include？`）。

```ruby
params do
  requires :latitude, type: Float, values: -90.0..+90.0
  requires :longitude, type: Float, values: -180.0..+180.0
  optional :letters, type: Array[String], values: 'a'..'z'
end
```

Note that *both* range endpoints have to be a `#kind_of?` your `:type` option (if you don't supply the `:type` option, it will be guessed to be equal to the class of the range's first endpoint). So the following is invalid:
注意*两个*范围端点必须是`#kind_of？`你的`：type`选项（如果你不提供`：type`选项，它将被猜测等于范围的第一个类终点）。 所以以下内容无效：

```ruby
params do
  requires :invalid1, type: Float, values: 0..10 # 0.kind_of?(Float) => false
  optional :invalid2, values: 0..10.0 # 10.0.kind_of?(0.class) => false
end
```

The `:values` option can also be supplied with a `Proc`, evaluated lazily with each request.
If the Proc has arity zero (i.e. it takes no arguments) it is expected to return either a list
or a range which will then be used to validate the parameter.
`:values`选项也可以提供一个'Proc`，随着每个请求懒惰地评估。如果Proc的arity为零（即它不带参数），它应该返回一个列表或一个范围，然后它将是 用于验证参数。

For example, given a status model you may want to restrict by hashtags that you have
previously defined in the `HashTag` model.
例如，给定状态模型，您可能希望通过先前在“HashTag”模型中定义的主题标签进行限制。

```ruby
params do
  requires :hashtag, type: String, values: -> { Hashtag.all.map(&:tag) }
end
```

Alternatively, a Proc with arity one (i.e. taking one argument) can be used to explicitly validate
each parameter value.  In that case, the Proc is expected to return a truthy value if the parameter
value is valid. The parameter will be considered invalid if the Proc returns a falsy value or if it
raises a StandardError.
或者，可以使用具有arity one（即采用一个参数）的Proc来明确地验证每个参数值。 在这种情况下，如果参数值有效，则Proc应返回真值。 如果Proc返回一个假值或者它引发了StandardError，则该参数将被视为无效。

```ruby
params do
  requires :number, type: Integer, values: ->(v) { v.even? && v < 25 }
end
```

While Procs are convenient for single cases, consider using [Custom Validators](#custom-validators) in cases where a validation is used more than once.
虽然Procs对于单个案例很方便，但在多次使用验证的情况下，请考虑使用[Custom Validators]（#custom-validators）。

#### `except_values`
(排除值)

Parameters can be restricted from having a specific set of values with the `:except_values` option.
可以使用`：except_values选项限制参数具有一组特定值。

The `except_values` validator behaves similarly to the `values` validator in that it accepts either
an Array, a Range, or a Proc.  Unlike the `values` validator, however, `except_values` only accepts
Procs with arity zero.
`except_values`验证器的行为类似于`values`验证器，因为它接受Array，Range或Proc。 然而，与`values`验证器不同，`except_values`只接受arity为零的Proc。

```ruby
params do
  requires :browser, except_values: [ 'ie6', 'ie7', 'ie8' ]
  requires :port, except_values: { value: 0..1024, message: 'is not allowed' }
  requires :hashtag, except_values: -> { Hashtag.FORBIDDEN_LIST }
end
```

#### `same_as`

A `same_as` option can be given to ensure that values of parameters match.
可以给出`same_as`选项以确保参数值匹配。

```ruby
params do
  requires :password
  requires :password_confirmation, same_as: :password
end
```

#### `regexp`

Parameters can be restricted to match a specific regular expression with the `:regexp` option. If the value
does not match the regular expression an error will be returned. Note that this is true for both `requires`
and `optional` parameters.
可以限制参数以使特定的正则表达式与`：regexp`选项匹配。 如果该值与正则表达式不匹配，则将返回错误。 请注意，对于`requires`和`optional`参数都是如此。

```ruby
params do
  requires :email, regexp: /.+@.+/
end
```

The validator will pass if the parameter was sent without value. To ensure that the parameter contains a value, use `allow_blank: false`.
如果参数是在没有值的情况下发送的，验证器将通过。 要确保参数包含值，请使用`allow_blank：false`。

```ruby
params do
  requires :email, allow_blank: false, regexp: /.+@.+/
end
```

#### `mutually_exclusive`
（互斥）

Parameters can be defined as `mutually_exclusive`, ensuring that they aren't present at the same time in a request.
参数可以定义为“mutual_exclusive”，确保它们不会同时出现在请求中。

```ruby
params do
  optional :beer
  optional :wine
  mutually_exclusive :beer, :wine
end
```

Multiple sets can be defined:
可以定义多个集合：

```ruby
params do
  optional :beer
  optional :wine
  mutually_exclusive :beer, :wine
  optional :scotch
  optional :aquavit
  mutually_exclusive :scotch, :aquavit
end
```

**Warning**: Never define mutually exclusive sets with any required params. Two mutually exclusive required params will mean params are never valid, thus making the endpoint useless. One required param mutually exclusive with an optional param will mean the latter is never valid.
**警告**：永远不要用任何所需的参数来定义互斥集。 两个相互排斥的必需参数将意味着参数永远无效，从而使端点无用。 与可选参数互斥的一个必需参数将意味着后者永远无效。

#### `exactly_one_of`

Parameters can be defined as 'exactly_one_of', ensuring that exactly one parameter gets selected.
参数可以定义为'exact_one_of'，确保只选择一个参数。

```ruby
params do
  optional :beer
  optional :wine
  exactly_one_of :beer, :wine
end
```

Note that using `:default` with `mutually_exclusive` will cause multiple parameters to always have a default value and raise a `Grape::Exceptions::Validation` mutually exclusive exception.
请注意，使用带有`mutual_exclusive`的`：default`将导致多个参数始终具有默认值并引发`Grape :: Exceptions :: Validation`互斥异常。

#### `at_least_one_of`

Parameters can be defined as 'at_least_one_of', ensuring that at least one parameter gets selected.
参数可以定义为'at_least_one_of'，确保至少选择一个参数。

```ruby
params do
  optional :beer
  optional :wine
  optional :juice
  at_least_one_of :beer, :wine, :juice
end
```

#### `all_or_none_of`

Parameters can be defined as 'all_or_none_of', ensuring that all or none of parameters gets selected.
参数可以定义为'all_or_none_of'，确保选择所有参数或不参数。

```ruby
params do
  optional :beer
  optional :wine
  optional :juice
  all_or_none_of :beer, :wine, :juice
end
```

#### Nested `mutually_exclusive`, `exactly_one_of`, `at_least_one_of`, `all_or_none_of`

All of these methods can be used at any nested level.
所有这些方法都可以在任何嵌套级别使用。

```ruby
params do
  requires :food, type: Hash do
    optional :meat
    optional :fish
    optional :rice
    at_least_one_of :meat, :fish, :rice
  end
  group :drink, type: Hash do
    optional :beer
    optional :wine
    optional :juice
    exactly_one_of :beer, :wine, :juice
  end
  optional :dessert, type: Hash do
    optional :cake
    optional :icecream
    mutually_exclusive :cake, :icecream
  end
  optional :recipe, type: Hash do
    optional :oil
    optional :meat
    all_or_none_of :oil, :meat
  end
end
```

### Namespace Validation and Coercion

Namespaces allow parameter definitions and apply to every method within the namespace.
命名空间允许参数定义并应用于命名空间中的每个方法。

```ruby
namespace :statuses do
  params do
    requires :user_id, type: Integer, desc: 'A user ID.'
  end
  namespace ':user_id' do
    desc "Retrieve a user's status."
    params do
      requires :status_id, type: Integer, desc: 'A status ID.'
    end
    get ':status_id' do
      User.find(params[:user_id]).statuses.find(params[:status_id])
    end
  end
end
```

The `namespace` method has a number of aliases, including: `group`, `resource`,
`resources`, and `segment`. Use whichever reads the best for your API.
`namespace`方法有许多别名，包括：`group`，`resource`，`resources`和`segment`。 使用最适合您API的读取方式。

You can conveniently define a route parameter as a namespace using `route_param`.
您可以使用`route_param`方便地将路由参数定义为命名空间。

```ruby
namespace :statuses do
  route_param :id do
    desc 'Returns all replies for a status.'
    get 'replies' do
      Status.find(params[:id]).replies
    end
    desc 'Returns a status.'
    get do
      Status.find(params[:id])
    end
  end
end
```

You can also define a route parameter type by passing to `route_param`'s options.
您还可以通过传递给“route_param”的选项来定义路由参数类型。

```ruby
namespace :arithmetic do
  route_param :n, type: Integer do
    desc 'Returns in power'
    get 'power' do
      params[:n] ** params[:n]
    end
  end
end
```

### Custom Validators

```ruby
class AlphaNumeric < Grape::Validations::Base
  def validate_param!(attr_name, params)
    unless params[attr_name] =~ /\A[[:alnum:]]+\z/
      fail Grape::Exceptions::Validation, params: [@scope.full_name(attr_name)], message: 'must consist of alpha-numeric characters'
    end
  end
end
```

```ruby
params do
  requires :text, alpha_numeric: true
end
```

You can also create custom classes that take parameters.
您还可以创建带参数的自定义类。

```ruby
class Length < Grape::Validations::Base
  def validate_param!(attr_name, params)
    unless params[attr_name].length <= @option
      fail Grape::Exceptions::Validation, params: [@scope.full_name(attr_name)], message: "must be at the most #{@option} characters long"
    end
  end
end
```

```ruby
params do
  requires :text, length: 140
end
```

You can also create custom validation that use request to validate the attribute. For example if you want to have parameters that are available to only admins, you can do the following.
您还可以创建使用请求来验证属性的自定义验证。 
例如，如果您想拥有仅供管理员使用的参数，则可以执行以下操作。

```ruby
class Admin < Grape::Validations::Base
  def validate(request)
    # return if the param we are checking was not in request
    # @attrs is a list containing the attribute we are currently validating
    # in our sample case this method once will get called with
    # @attrs being [:admin_field] and once with @attrs being [:admin_false_field]
    return unless request.params.key?(@attrs.first)
    # check if admin flag is set to true
    return unless @option
    # check if user is admin or not
    # as an example get a token from request and check if it's admin or not
    fail Grape::Exceptions::Validation, params: @attrs, message: 'Can not set admin-only field.' unless request.headers['X-Access-Token'] == 'admin'
  end
end
```

And use it in your endpoint definition as:
并在端点定义中使用它：

```ruby
params do
  optional :admin_field, type: String, admin: true
  optional :non_admin_field, type: String
  optional :admin_false_field, type: String, admin: false
end
```

Every validation will have it's own instance of the validator, which means that the validator can have a state.
每个验证都有自己的验证器实例，这意味着验证器可以具有状态。

### Validation Errors

Validation and coercion errors are collected and an exception of type `Grape::Exceptions::ValidationErrors` is raised. If the exception goes uncaught it will respond with a status of 400 and an error message. The validation errors are grouped by parameter name and can be accessed via `Grape::Exceptions::ValidationErrors#errors`.
收集验证和强制错误，并引发类型为“Grape :: Exceptions :: ValidationErrors”的异常。 如果异常未被捕获，它将以状态400和错误消息进行响应。 
验证错误按参数名称分组，可以通过`Grape :: Exceptions :: ValidationErrors＃errors`访问。

The default response from a `Grape::Exceptions::ValidationErrors` is a humanly readable string, such as "beer, wine are mutually exclusive", in the following example.
来自`Grape :: Exceptions :: ValidationErrors`的默认响应是一个人类可读的字符串，例如“啤酒，葡萄酒是互斥的”，在下面的示例中。

```ruby
params do
  optional :beer
  optional :wine
  optional :juice
  exactly_one_of :beer, :wine, :juice
end
```

You can rescue a `Grape::Exceptions::ValidationErrors` and respond with a custom response or turn the response into well-formatted JSON for a JSON API that separates individual parameters and the corresponding error messages. The following `rescue_from` example produces `[{"params":["beer","wine"],"messages":["are mutually exclusive"]}]`.
您可以拯救`Grape :: Exceptions :: ValidationErrors`并使用自定义响应进行响应，
或者将响应转换为格式良好的JSON，以获取用于分隔各个参数和相应错误消息的JSON API。 
以下`rescue_from`示例生成`[{"params":["beer","wine"],"messages":["are mutually exclusive"]}]`。

```ruby
format :json
subject.rescue_from Grape::Exceptions::ValidationErrors do |e|
  error! e, 400
end
```

`Grape::Exceptions::ValidationErrors#full_messages` returns the validation messages as an array. `Grape::Exceptions::ValidationErrors#message` joins the messages to one string.
`Grape :: Exceptions :: ValidationErrors＃full_messages`将验证消息作为数组返回。 `Grape :: Exceptions :: ValidationErrors＃message`将消息加入一个字符串。

For responding with an array of validation messages, you can use `Grape::Exceptions::ValidationErrors#full_messages`.
要使用一组验证消息进行响应，可以使用`Grape :: Exceptions :: ValidationErrors＃full_messages`。

```ruby
format :json
subject.rescue_from Grape::Exceptions::ValidationErrors do |e|
  error!({ messages: e.full_messages }, 400)
end
```

Grape returns all validation and coercion errors found by default.
To skip all subsequent validation checks when a specific param is found invalid, use `fail_fast: true`.
Grape返回默认发现的所有验证和强制错误。要在发现特定参数无效时跳过所有后续验证检查，请使用`fail_fast：true`。

The following example will not check if `:wine` is present unless it finds `:beer`.
以下示例不会检查`：wine`是否存在，除非它找到`：beer`。

```ruby
params do
  required :beer, fail_fast: true
  required :wine
end
```
The result of empty params would be a single `Grape::Exceptions::ValidationErrors` error.
空params的结果将是单个`Grape :: Exceptions :: ValidationErrors`错误。

Similarly, no regular expression test will be performed if `:blah` is blank in the following example.
同样，如果`：blah`在以下示例中为空，则不会执行正则表达式测试。

```ruby
params do
  required :blah, allow_blank: false, regexp: /blah/, fail_fast: true
end
```

### I18n

Grape supports I18n for parameter-related error messages, but will fallback to English if
translations for the default locale have not been provided. See [en.yml](lib/grape/locale/en.yml) for message keys.
Grape支持I18n用于参数相关的错误消息，但如果是，则会回退到英语
尚未提供默认语言环境的翻译。 有关消息键，请参阅[en.yml]（lib / grape / locale / en.yml）。

In case your app enforces available locales only and :en is not included in your available locales, Grape cannot fall back to English and will return the translation key for the error message. To avoid this behaviour, either provide a translation for your default locale or add :en to your available locales.
如果您的应用仅强制执行可用的区域设置，并且：en未包含在您的可用区域设置中，则Grape无法回退到英语并将返回错误消息的翻译密钥。 要避免此行为，请为您的默认语言环境提供翻译，或者将en添加到您的可用语言环境中。

### Custom Validation messages

Grape supports custom validation messages for parameter-related and coerce-related error messages.
Grape支持与参数相关和与胁迫相关的错误消息的自定义验证消息。

#### `presence`, `allow_blank`, `values`, `regexp`

```ruby
params do
  requires :name, values: { value: 1..10, message: 'not in range from 1 to 10' }, allow_blank: { value: false, message: 'cannot be blank' }, regexp: { value: /^[a-z]+$/, message: 'format is invalid' }, message: 'is required'
end
```

#### `same_as`
（与...一样）
```ruby
params do
  requires :password
  requires :password_confirmation, same_as: { value: :password, message: 'not match' }
end
```

#### `all_or_none_of`
（全或空）
```ruby
params do
  optional :beer
  optional :wine
  optional :juice
  all_or_none_of :beer, :wine, :juice, message: "all params are required or none is required"
end
```

#### `mutually_exclusive`
（互斥）
```ruby
params do
  optional :beer
  optional :wine
  optional :juice
  mutually_exclusive :beer, :wine, :juice, message: "are mutually exclusive cannot pass both params"
end
```

#### `exactly_one_of`
（其中之一）
```ruby
params do
  optional :beer
  optional :wine
  optional :juice
  exactly_one_of :beer, :wine, :juice, message: { exactly_one: "are missing, exactly one parameter is required", mutual_exclusion: "are mutually exclusive, exactly one parameter is required" }
end
```

#### `at_least_one_of`
（至少有一个）
```ruby
params do
  optional :beer
  optional :wine
  optional :juice
  at_least_one_of :beer, :wine, :juice, message: "are missing, please specify at least one param"
end
```

#### `Coerce`

```ruby
params do
  requires :int, type: { value: Integer, message: "type cast is invalid" }
end
```

#### `With Lambdas`

```ruby
params do
  requires :name, values: { value: -> { (1..10).to_a }, message: 'not in range from 1 to 10' }
end
```

#### `Pass symbols for i18n translations`
（传递i18n翻译的符号）
You can pass a symbol if you want i18n translations for your custom validation messages.

```ruby
params do
  requires :name, message: :name_required
end
```
```ruby
# en.yml

en:
  grape:
    errors:
      format: ! '%{attributes} %{message}'
      messages:
        name_required: 'must be present'
```

#### Overriding Attribute Names
（覆盖属性名称）
You can also override attribute names.
您还可以覆盖属性名称。

```ruby
# en.yml

en:
  grape:
    errors:
      format: ! '%{attributes} %{message}'
      messages:
        name_required: 'must be present'
      attributes:
        name: 'Oops! Name'
```
Will produce 'Oops! Name must be present'

#### With Default

You cannot set a custom message option for Default as it requires interpolation `%{option1}: %{value1} is incompatible with %{option2}: %{value2}`. You can change the default error message for Default by changing the `incompatible_option_values` message key inside [en.yml](lib/grape/locale/en.yml)
您无法为Default设置自定义消息选项，因为它需要插值`％{option1}：％{value1}与％{option2}不兼容：％{value2}`。 您可以通过更改[en.yml]中的`incompatible_option_values`消息键来更改Default的默认错误消息（lib / grape / locale / en.yml）

```ruby
params do
  requires :name, values: { value: -> { (1..10).to_a }, message: 'not in range from 1 to 10' }, default: 5
end
```

## Headers

Request headers are available through the `headers` helper or from `env` in their original form.
请求头可以通过`headers`帮助器或原始形式的`env`获得。

```ruby
get do
  error!('Unauthorized', 401) unless headers['Secret-Password'] == 'swordfish'
end
```

```ruby
get do
  error!('Unauthorized', 401) unless env['HTTP_SECRET_PASSWORD'] == 'swordfish'
end
```

You can set a response header with `header` inside an API.
您可以在API中设置带有“header”的响应头。

```ruby
header 'X-Robots-Tag', 'noindex'
```

When raising `error!`, pass additional headers as arguments.
在引发`error！`时，将其他标头作为参数传递。

```ruby
error! 'Unauthorized', 401, 'X-Error-Detail' => 'Invalid token.'
```

## Routes

Optionally, you can define requirements for your named route parameters using regular
expressions on namespace or endpoint. The route will match only if all requirements are met.
（可选）您可以使用命名空间或端点上的正则表达式定义命名路由参数的要求。 只有满足所有要求时，路线才会匹配。

```ruby
get ':id', requirements: { id: /[0-9]*/ } do
  Status.find(params[:id])
end

namespace :outer, requirements: { id: /[0-9]*/ } do
  get :id do
  end

  get ':id/edit' do
  end
end
```

## Helpers

You can define helper methods that your endpoints can use with the `helpers`
macro by either giving a block or an array of modules.
您可以通过给出块或模块数组来定义端点可以与`helpers`宏一起使用的辅助方法。

```ruby
module StatusHelpers
  def user_info(user)
    "#{user} has statused #{user.statuses} status(s)"
  end
end

module HttpCodesHelpers
  def unauthorized
    401
  end
end

class API < Grape::API
  # define helpers with a block
  helpers do
    def current_user
      User.find(params[:user_id])
    end
  end

  # or mix in an array of modules
  helpers StatusHelpers, HttpCodesHelpers

  before do
    error!('Access Denied', unauthorized) unless current_user
  end

  get 'info' do
    # helpers available in your endpoint and filters
    user_info(current_user)
  end
end
```

You can define reusable `params` using `helpers`.
您可以使用`helpers`定义可重用的`params`。

```ruby
class API < Grape::API
  helpers do
    params :pagination do
      optional :page, type: Integer
      optional :per_page, type: Integer
    end
  end

  desc 'Get collection'
  params do
    use :pagination # aliases: includes, use_scope
  end
  get do
    Collection.page(params[:page]).per(params[:per_page])
  end
end
```

You can also define reusable `params` using shared helpers.
您还可以使用共享助手定义可重用的`params`。

```ruby
module SharedParams
  extend Grape::API::Helpers

  params :period do
    optional :start_date
    optional :end_date
  end

  params :pagination do
    optional :page, type: Integer
    optional :per_page, type: Integer
  end
end

class API < Grape::API
  helpers SharedParams

  desc 'Get collection.'
  params do
    use :period, :pagination
  end

  get do
    Collection
      .from(params[:start_date])
      .to(params[:end_date])
      .page(params[:page])
      .per(params[:per_page])
  end
end
```

Helpers support blocks that can help set default values. The following API can return a collection sorted by `id` or `created_at` in `asc` or `desc` order.
助手支持可以帮助设置默认值的块。 以下API可以在`asc`或`desc`顺序中返回按`id`或`created_at`排序的集合。

```ruby
module SharedParams
  extend Grape::API::Helpers

  params :order do |options|
    optional :order_by, type: Symbol, values: options[:order_by], default: options[:default_order_by]
    optional :order, type: Symbol, values: %i(asc desc), default: options[:default_order]
  end
end

class API < Grape::API
  helpers SharedParams

  desc 'Get a sorted collection.'
  params do
    use :order, order_by: %i(id created_at), default_order_by: :created_at, default_order: :asc
  end

  get do
    Collection.send(params[:order], params[:order_by])
  end
end
```

## Path Helpers

If you need methods for generating paths inside your endpoints, please see the [grape-route-helpers](https://github.com/reprah/grape-route-helpers) gem.
如果您需要在端点内生成路径的方法，请参阅[grape-route-helpers](https://github.com/reprah/grape-route-helpers) gem.

## Parameter Documentation

You can attach additional documentation to `params` using a `documentation` hash.
您可以使用`documentation`哈希将附加文档附加到`params`。

```ruby
params do
  optional :first_name, type: String, documentation: { example: 'Jim' }
  requires :last_name, type: String, documentation: { example: 'Smith' }
end
```

## Cookies

You can set, get and delete your cookies very simply using `cookies` method.
您可以使用`cookies`方法非常简单地设置，获取和删除您的cookie。

```ruby
class API < Grape::API
  get 'status_count' do
    cookies[:status_count] ||= 0
    cookies[:status_count] += 1
    { status_count: cookies[:status_count] }
  end

  delete 'status_count' do
    { status_count: cookies.delete(:status_count) }
  end
end
```

Use a hash-based syntax to set more than one value.
使用基于散列的语法设置多个值。

```ruby
cookies[:status_count] = {
  value: 0,
  expires: Time.tomorrow,
  domain: '.twitter.com',
  path: '/'
}

cookies[:status_count][:value] +=1
```

Delete a cookie with `delete`.
使用`delete`删除cookie。

```ruby
cookies.delete :status_count
```

Specify an optional path.
指定可选路径。

```ruby
cookies.delete :status_count, path: '/'
```

## HTTP Status Code

By default Grape returns a 201 for `POST`-Requests, 204 for `DELETE`-Requests that don't return any content, and 200 status code for all other Requests.
You can use `status` to query and set the actual HTTP Status Code
默认情况下，Grape为`POST`-Requests返回201，为不返回任何内容的`DELETE`-Requests返回204，为所有其他请求返回200状态代码。
您可以使用`status`来查询和设置实际的HTTP状态代码

```ruby
post do
  status 202

  if status == 200
     # do some thing
  end
end
```

You can also use one of status codes symbols that are provided by [Rack utils](http://www.rubydoc.info/github/rack/rack/Rack/Utils#HTTP_STATUS_CODES-constant)
您还可以使用[Rack utils]提供的状态代码符号之一（[Rack utils](http://www.rubydoc.info/github/rack/rack/Rack/Utils#HTTP_STATUS_CODES-constant)

```ruby
post do
  status :no_content
end
```

## Redirecting

You can redirect to a new url temporarily (302) or permanently (301).
您可以临时（302）或永久（301）重定向到新网址。

```ruby
redirect '/statuses'
```

```ruby
redirect '/statuses', permanent: true
```

## Recognizing Path

You can recognize the endpoint matched with given path.
您可以识别与给定路径匹配的端点。

This API returns an instance of `Grape::Endpoint`.
此API返回`Grape :: Endpoint`的实例。

```ruby
class API < Grape::API
  get '/statuses' do
  end
end

API.recognize_path '/statuses'
```

## Allowed Methods

When you add a `GET` route for a resource, a route for the `HEAD`
method will also be added automatically. You can disable this
behavior with `do_not_route_head!`.
当您为资源添加`GET`路由时，也会自动添加`HEAD`方法的路由。 您可以使用`do_not_route_head！`禁用此行为。

```ruby
class API < Grape::API
  do_not_route_head!

  get '/example' do
    # only responds to GET
  end
end
```

When you add a route for a resource, a route for the `OPTIONS`
method will also be added. The response to an OPTIONS request will
include an "Allow" header listing the supported methods. If the resource
has `before` and `after` callbacks they will be executed, but no other callbacks will
run.
为资源添加路由时，还将添加“OPTIONS”方法的路由。 对OPTIONS请求的响应将包括列出支持的方法的“允许”标题。 如果资源有`before`和`after`回调，它们将被执行，但不会运行其他回调。

```ruby
class API < Grape::API
  get '/rt_count' do
    { rt_count: current_user.rt_count }
  end

  params do
    requires :value, type: Integer, desc: 'Value to add to the rt count.'
  end
  put '/rt_count' do
    current_user.rt_count += params[:value].to_i
    { rt_count: current_user.rt_count }
  end
end
```

``` shell
curl -v -X OPTIONS http://localhost:3000/rt_count

> OPTIONS /rt_count HTTP/1.1
>
< HTTP/1.1 204 No Content
< Allow: OPTIONS, GET, PUT
```

You can disable this behavior with `do_not_route_options!`.
您可以使用`do_not_route_options！`禁用此行为。

If a request for a resource is made with an unsupported HTTP method, an
HTTP 405 (Method Not Allowed) response will be returned. If the resource
has `before` callbacks they will be executed, but no other callbacks will
run.
如果使用不受支持的HTTP方法请求资源，则将返回HTTP 405（Method Not Allowed）响应。 如果资源具有`before`回调，它们将被执行，但不会运行其他回调。

``` shell
curl -X DELETE -v http://localhost:3000/rt_count/

> DELETE /rt_count/ HTTP/1.1
> Host: localhost:3000
>
< HTTP/1.1 405 Method Not Allowed
< Allow: OPTIONS, GET, PUT
```

## Raising Exceptions

You can abort the execution of an API method by raising errors with `error!`.
您可以通过`error!`引发错误来中止API方法的执行。

```ruby
error! 'Access Denied', 401
```

Anything that responds to `#to_s` can be given as a first argument to `error!`.
响应`#to_s`的任何内容都可以作为`error！`的第一个参数给出。

```ruby
error! :not_found, 404
```

You can also return JSON formatted objects by raising error! and passing a hash
instead of a message.
您还可以通过引发错误返回JSON格式的对象！ 并传递哈希而不是消息。

```ruby
error!({ error: 'unexpected error', detail: 'missing widget' }, 500)
```

You can present documented errors with a Grape entity using the the [grape-entity](https://github.com/ruby-grape/grape-entity) gem.
您可以使用[grape-entity](https://github.com/ruby-grape/grape-entity) gem向Grape实体提供记录的错误。

```ruby
module API
  class Error < Grape::Entity
    expose :code
    expose :message
  end
end
```

The following example specifies the entity to use in the `http_codes` definition.
以下示例指定要在`http_codes`定义中使用的实体。

```ruby
desc 'My Route' do
 failure [[408, 'Unauthorized', API::Error]]
end
error!({ message: 'Unauthorized' }, 408)
```

The following example specifies the presented entity explicitly in the error message.
以下示例在错误消息中明确指定所呈现的实体。

```ruby
desc 'My Route' do
 failure [[408, 'Unauthorized']]
end
error!({ message: 'Unauthorized', with: API::Error }, 408)
```

### Default Error HTTP Status Code

By default Grape returns a 500 status code from `error!`. You can change this with `default_error_status`.
默认情况下，Grape从`error！`返回500状态代码。 您可以使用`default_error_status`更改此设置。

```ruby
class API < Grape::API
  default_error_status 400
  get '/example' do
    error! 'This should have http status code 400'
  end
end
```

### Handling 404

For Grape to handle all the 404s for your API, it can be useful to use a catch-all.
In its simplest form, it can be like:
对于Grape来处理API的所有404，使用catch-all会很有用。在最简单的形式中，它可以是：

```ruby
route :any, '*path' do
  error! # or something else
end
```

It is very crucial to __define this endpoint at the very end of your API__, as it
literally accepts every request.
在API__的最末端__define这个端点非常重要，因为它实际上接受了每个请求。

## Exception Handling

Grape can be told to rescue all `StandardError` exceptions and return them in the API format.
可以告诉Grape抢救所有`StandardError`异常并以API格式返回它们。

```ruby
class Twitter::API < Grape::API
  rescue_from :all
end
```

This mimics [default `rescue` behaviour](https://ruby-doc.org/core/StandardError.html) when an exception type is not provided.
当未提供异常类型时，这会模仿[default `rescue` behaviour](https://ruby-doc.org/core/StandardError.html).

Any other exception should be rescued explicitly, see [below](#exceptions-that-should-be-rescued-explicitly).
应明确拯救任何其他例外，见[below](#exceptions-that-should-be-rescued-explicitly).

Grape can also rescue from all exceptions and still use the built-in exception handing.
Grape还可以从所有异常中解救，仍然使用内置的异常处理。

This will give the same behavior as `rescue_from :all` with the addition that Grape will use the exception handling defined by all Exception classes that inherit `Grape::Exceptions::Base`.
这将提供与`rescue_from：all`相同的行为，并且Grape将使用继承`Grape :: Exceptions :: Base`的所有Exception类定义的异常处理。

The intent of this setting is to provide a simple way to cover the most common exceptions and return any unexpected exceptions in the API format.
此设置的目的是提供一种简单的方法来覆盖最常见的异常并返回API格式中的任何意外异常。

```ruby
class Twitter::API < Grape::API
  rescue_from :grape_exceptions
end
```

You can also rescue specific exceptions.
您还可以拯救特定的例外。

```ruby
class Twitter::API < Grape::API
  rescue_from ArgumentError, UserDefinedError
end
```

In this case ```UserDefinedError``` must be inherited from ```StandardError```.
在这种情况下，```UserDefinedError```必须从```StandardError```继承。

Notice that you could combine these two approaches (rescuing custom errors takes precedence). For example, it's useful for handling all exceptions except Grape validation errors.
请注意，您可以将这两种方法结合起来（抢救自定义错误优先）。 例如，它对于处理除Grape验证错误之外的所有异常非常有用。

```ruby
class Twitter::API < Grape::API
  rescue_from Grape::Exceptions::ValidationErrors do |e|
    error!(e, 400)
  end

  rescue_from :all
end
```

The error format will match the request format. See "Content-Types" below.
错误格式将与请求格式匹配。 请参阅下面的“内容类型”。

Custom error formatters for existing and additional types can be defined with a proc.
可以使用proc定义现有和其他类型的自定义错误格式化程序。

```ruby
class Twitter::API < Grape::API
  error_formatter :txt, ->(message, backtrace, options, env, original_exception) {
    "error: #{message} from #{backtrace}"
  }
end
```

You can also use a module or class.
您还可以使用模块或类。

```ruby
module CustomFormatter
  def self.call(message, backtrace, options, env, original_exception)
    { message: message, backtrace: backtrace }
  end
end

class Twitter::API < Grape::API
  error_formatter :custom, CustomFormatter
end
```

You can rescue all exceptions with a code block. The `error!` wrapper automatically sets the default error code and content-type.
您可以使用代码块来挽救所有异常。 `error！`包装器自动设置默认错误代码和内容类型。


```ruby
class Twitter::API < Grape::API
  rescue_from :all do |e|
    error!("rescued from #{e.class.name}")
  end
end
```

Optionally, you can set the format, status code and headers.
（可选）您可以设置格式，状态代码和标题。

```ruby
class Twitter::API < Grape::API
  format :json
  rescue_from :all do |e|
    error!({ error: 'Server error.' }, 500, { 'Content-Type' => 'text/error' })
  end
end
```

You can also rescue all exceptions with a code block and handle the Rack response at the lowest level.
（可选）您可以设置格式，状态代码和标题。

```ruby
class Twitter::API < Grape::API
  rescue_from :all do |e|
    Rack::Response.new([ e.message ], 500, { 'Content-type' => 'text/error' })
  end
end
```

Or rescue specific exceptions.
或拯救特定的例外。

```ruby
class Twitter::API < Grape::API
  rescue_from ArgumentError do |e|
    error!("ArgumentError: #{e.message}")
  end

  rescue_from NoMethodError do |e|
    error!("NoMethodError: #{e.message}")
  end
end
```

By default, `rescue_from` will rescue the exceptions listed and all their subclasses.
默认情况下，`rescue_from`将挽救列出的异常及其所有子类。

Assume you have the following exception classes defined.
假设您定义了以下异常类。

```ruby
module APIErrors
  class ParentError < StandardError; end
  class ChildError < ParentError; end
end
```

Then the following `rescue_from` clause will rescue exceptions of type `APIErrors::ParentError` and its subclasses (in this case `APIErrors::ChildError`).
然后，以下`rescue_from`子句将挽救类型`APIErrors :: ParentError`及其子类（在本例中为'APIErrors :: ChildError`）的异常。

```ruby
rescue_from APIErrors::ParentError do |e|
    error!({
      error: "#{e.class} error",
      message: e.message
    }, e.status)
end
```

To only rescue the base exception class, set `rescue_subclasses: false`.
The code below will rescue exceptions of type `RuntimeError` but _not_ its subclasses.
要仅救出基本异常类，请设置`rescue_subclasses：false`。
下面的代码将挽救类型为“RuntimeError”的异常，但是_not_它的子类。

```ruby
rescue_from RuntimeError, rescue_subclasses: false do |e|
    error!({
      status: e.status,
      message: e.message,
      errors: e.errors
    }, e.status)
end
```

Helpers are also available inside `rescue_from`.
助手也可以在`rescue_from`里面找到。

```ruby
class Twitter::API < Grape::API
  format :json
  helpers do
    def server_error!
      error!({ error: 'Server error.' }, 500, { 'Content-Type' => 'text/error' })
    end
  end

  rescue_from :all do |e|
    server_error!
  end
end
```

The `rescue_from` handler must return a `Rack::Response` object, call `error!`, or raise an exception (either the original exception or another custom one). The exception raised in `rescue_from` will be handled outside Grape. For example, if you mount Grape in Rails, the exception will be handle by [Rails Action Controller](https://guides.rubyonrails.org/action_controller_overview.html#rescue).
`rescue_from`处理程序必须返回一个`Rack :: Response`对象，调用`error！`，或者引发异常（原始异常或另一个自定义异常）。 
`rescue_from`中引发的异常将在Grape外部处理。 例如，如果您在Rails中安装Grape，则[Rails Action Controller]（https://guides.rubyonrails.org/action_controller_overview.html#rescue）将处理该异常。

Alternately, use the `with` option in `rescue_from` to specify a method or a `proc`.
或者，使用`rescue_from`中的`with`选项指定方法或`proc`。

```ruby
class Twitter::API < Grape::API
  format :json
  helpers do
    def server_error!
      error!({ error: 'Server error.' }, 500, { 'Content-Type' => 'text/error' })
    end
  end

  rescue_from :all,          with: :server_error!
  rescue_from ArgumentError, with: -> { Rack::Response.new('rescued with a method', 400) }
end
```

#### Rescuing exceptions inside namespaces

You could put `rescue_from` clauses inside a namespace and they will take precedence over ones
defined in the root scope:
您可以将`rescue_from`子句放在命名空间中，它们将优先于根范围中定义的子句：

```ruby
class Twitter::API < Grape::API
  rescue_from ArgumentError do |e|
    error!("outer")
  end

  namespace :statuses do
    rescue_from ArgumentError do |e|
      error!("inner")
    end
    get do
      raise ArgumentError.new
    end
  end
end
```

Here `'inner'` will be result of handling occured `ArgumentError`.
这里''inner'将是处理发生的'ArgumentError`的结果。

#### Unrescuable Exceptions

`Grape::Exceptions::InvalidVersionHeader`, which is raised when the version in the request header doesn't match the currently evaluated version for the endpoint, will _never_ be rescued from a `rescue_from` block (even a `rescue_from :all`) This is because Grape relies on Rack to catch that error and try the next versioned-route for cases where there exist identical Grape endpoints with different versions.
`Grape :: Exceptions :: InvalidVersionHeader`，当请求标头中的版本与端点的当前评估版本不匹配时引发，将从`rescue_from`块（甚至是`rescue_from：all`）中获取。 ）这是因为Grape依赖Rack来捕获该错误并尝试下一个版本路由，以用于存在具有不同版本的相同Grape端点的情况。

#### Exceptions that should be rescued explicitly

Any exception that is not subclass of `StandardError` should be rescued explicitly.
Usually it is not a case for an application logic as such errors point to problems in Ruby runtime.
This is following [standard recommendations for exceptions handling](https://ruby-doc.org/core/Exception.html).
任何不是“StandardError”子类的异常都应该明确地被拯救。
通常不是应用程序逻辑的情况，因为这样的错误指向Ruby运行时中的问题。
这是[异常处理的标准建议]（https://ruby-doc.org/core/Exception.html）。

### Rails 3.x

When mounted inside containers, such as Rails 3.x, errors such as "404 Not Found" or
"406 Not Acceptable" will likely be handled and rendered by Rails handlers. For instance,
accessing a nonexistent route "/api/foo" raises a 404, which inside rails will ultimately
be translated to an `ActionController::RoutingError`, which most likely will get rendered
to a HTML error page.
安装在容器（例如Rails 3.x）中时，会出现“404 Not Found”等错误
Rails处理程序可能会处理和呈现“406 Not Acceptable”。 例如，
访问一个不存在的路由“/ api / foo”会引发一个404，最终会在rails内部
被转换为`ActionController :: RoutingError`，很可能会被渲染
到HTML错误页面。

Most APIs will enjoy preventing downstream handlers from handling errors. You may set the
`:cascade` option to `false` for the entire API or separately on specific `version` definitions,
which will remove the `X-Cascade: true` header from API responses.
大多数API都会喜欢阻止下游处理程序处理错误。 您可以将整个API的`：cascade`选项设置为`false`，或者单独设置特定的`version`定义，这将从API响应中删除`X-Cascade：true`标头。

```ruby
cascade false
```

```ruby
version 'v1', using: :header, vendor: 'twitter', cascade: false
```

## Logging

`Grape::API` provides a `logger` method which by default will return an instance of the `Logger`
class from Ruby's standard library.
`Grape :: API`提供了一个`logger`方法，默认情况下会从Ruby的标准库中返回一个`Logger`类的实例。

To log messages from within an endpoint, you need to define a helper to make the logger
available in the endpoint context.
要从端点内记录消息，您需要定义一个帮助程序，以使记录器在端点上下文中可用。

```ruby
class API < Grape::API
  helpers do
    def logger
      API.logger
    end
  end
  post '/statuses' do
    logger.info "#{current_user} has statused"
  end
end
```

To change the logger level.
要更改记录器级别。

```ruby
class API < Grape::API
  self.logger.level = Logger::INFO
end
```

You can also set your own logger.
您也可以设置自己的记录器。

```ruby
class MyLogger
  def warning(message)
    puts "this is a warning: #{message}"
  end
end

class API < Grape::API
  logger MyLogger.new
  helpers do
    def logger
      API.logger
    end
  end
  get '/statuses' do
    logger.warning "#{current_user} has statused"
  end
end
```

For similar to Rails request logging try the [grape_logging](https://github.com/aserafin/grape_logging) or [grape-middleware-logger](https://github.com/ridiculous/grape-middleware-logger) gems.
对于类似于Rails请求记录，请尝试[grape_logging](https://github.com/aserafin/grape_logging) or [grape-middleware-logger](https://github.com/ridiculous/grape-middleware-logger) gems.

## API Formats

Your API can declare which content-types to support by using `content_type`. If you do not specify any, Grape will support
_XML_, _JSON_, _BINARY_, and _TXT_ content-types. The default format is `:txt`; you can change this with `default_format`.
Essentially, the two APIs below are equivalent.
您的API可以使用`content_type`声明要支持的内容类型。 如果您未指定任何内容，Grape将支持_XML_，_JSON_，_BINARY_和_TXT_内容类型。 默认格式为`：txt`; 你可以用`default_format`改变它。
基本上，下面的两个API是等效的。

```ruby
class Twitter::API < Grape::API
  # no content_type declarations, so Grape uses the defaults
end

class Twitter::API < Grape::API
  # the following declarations are equivalent to the defaults

  content_type :xml, 'application/xml'
  content_type :json, 'application/json'
  content_type :binary, 'application/octet-stream'
  content_type :txt, 'text/plain'

  default_format :txt
end
```

If you declare any `content_type` whatsoever, the Grape defaults will be overridden. For example, the following API will only
support the `:xml` and `:rss` content-types, but not `:txt`, `:json`, or `:binary`. Importantly, this means the `:txt`
default format is not supported! So, make sure to set a new `default_format`.
如果您声明任何`content_type`，将覆盖Grape默认值。 例如，以下API仅支持`：xml`和`：rss`内容类型，但不支持`：txt`，`：json`或`：binary`。 重要的是，这意味着不支持`：txt`默认格式！ 所以，确保设置一个新的`default_format`。

```ruby
class Twitter::API < Grape::API
  content_type :xml, 'application/xml'
  content_type :rss, 'application/xml+rss'

  default_format :xml
end
```

Serialization takes place automatically. For example, you do not have to call `to_json` in each JSON API endpoint
implementation. The response format (and thus the automatic serialization) is determined in the following order:
序列化自动进行。 例如，您不必在每个JSON API端点实现中调用`to_json`。 响应格式（以及自动序列化）按以下顺序确定：

* Use the file extension, if specified. If the file is .json, choose the JSON format.
* Use the value of the `format` parameter in the query string, if specified.
* Use the format set by the `format` option, if specified.
* Attempt to find an acceptable format from the `Accept` header.
* Use the default format, if specified by the `default_format` option.
* Default to `:txt`.
* 如果指定，请使用文件扩展名。 如果文件是.json，请选择JSON格式。
* 如果指定，则使用查询字符串中`format`参数的值。
* 如果指定，使用`format`选项设置的格式。
* 尝试从“Accept”标题中找到可接受的格式。
* 如果使用`default_format`选项指定，则使用默认格式。
* 默认为`：txt`。

For example, consider the following API.
例如，请考虑以下API。

```ruby
class MultipleFormatAPI < Grape::API
  content_type :xml, 'application/xml'
  content_type :json, 'application/json'

  default_format :json

  get :hello do
    { hello: 'world' }
  end
end
```

* `GET /hello` (with an `Accept: */*` header) does not have an extension or a `format` parameter, so it will respond with
  JSON (the default format).
* `GET /hello.xml` has a recognized extension, so it will respond with XML.
* `GET /hello?format=xml` has a recognized `format` parameter, so it will respond with XML.
* `GET /hello.xml?format=json` has a recognized extension (which takes precedence over the `format` parameter), so it will
  respond with XML.
* `GET /hello.xls` (with an `Accept: */*` header) has an extension, but that extension is not recognized, so it will respond
  with JSON (the default format).
* `GET /hello.xls` with an `Accept: application/xml` header has an unrecognized extension, but the `Accept` header
  corresponds to a recognized format, so it will respond with XML.
* `GET /hello.xls` with an `Accept: text/plain` header has an unrecognized extension *and* an unrecognized `Accept` header,
  so it will respond with JSON (the default format).

*`GET / hello`（带有`Accept：* / *`标题）没有扩展名或`format`参数，因此它将以JSON（默认格式）响应。
*`GET / hello.xml`具有可识别的扩展名，因此它将使用XML进行响应。
*`GET / hello？format = xml`有一个公认的`format`参数，所以它会用XML响应。
*`GET /hello.xml？format = json`有一个公认的扩展名（优先于`format`参数），所以它会用XML响应。
*`GET / hello.xls`（带有`Accept：* / *`标头）有一个扩展名，但是无法识别该扩展名，因此它将以JSON（默认格式）进行响应。
* 带有`Accept：application / xml`标头的`GET / hello.xls`有一个无法识别的扩展名，但`Accept`标题对应一个识别的格式，因此它将用XML响应。
* 带有`Accept：text / plain`标题的`GET / hello.xls`有一个无法识别的扩展*和*一个无法识别的`Accept`标题，因此它将以JSON（默认格式）响应。

You can override this process explicitly by specifying `env['api.format']` in the API itself.
For example, the following API will let you upload arbitrary files and return their contents as an attachment with the correct MIME type.
您可以通过在API本身中指定`env ['api.format']`来显式覆盖此过程。
例如，以下API将允许您上载任意文件并将其内容作为具有正确MIME类型的附件返回。

```ruby
class Twitter::API < Grape::API
  post 'attachment' do
    filename = params[:file][:filename]
    content_type MIME::Types.type_for(filename)[0].to_s
    env['api.format'] = :binary # there's no formatter for :binary, data will be returned "as is"
    header 'Content-Disposition', "attachment; filename*=UTF-8''#{CGI.escape(filename)}"
    params[:file][:tempfile].read
  end
end
```

You can have your API only respond to a single format with `format`. If you use this, the API will **not** respond to file
extensions other than specified in `format`. For example, consider the following API.
您可以让您的API仅使用`format`响应单一格式。 如果你使用它，API将不会**响应`format`中指定的文件扩展名。 例如，请考虑以下API。

```ruby
class SingleFormatAPI < Grape::API
  format :json

  get :hello do
    { hello: 'world' }
  end
end
```

* `GET /hello` will respond with JSON.
* `GET /hello.json` will respond with JSON.
* `GET /hello.xml`, `GET /hello.foobar`, or *any* other extension will respond with an HTTP 404 error code.
* `GET /hello?format=xml` will respond with an HTTP 406 error code, because the XML format specified by the request parameter
  is not supported.
* `GET /hello` with an `Accept: application/xml` header will still respond with JSON, since it could not negotiate a
  recognized content-type from the headers and JSON is the effective default.
*`GET / hello`将以JSON响应。
*`GET / hello.json`将以JSON响应。
*`GET / hello.xml`，`GET / hello.foobar`或* any *其他扩展名将以HTTP 404错误代码响应。
*`GET / hello？format = xml`将使用HTTP 406错误代码进行响应，因为不支持request参数指定的XML格式。
* 带有`Accept：application / xml`标头的`GET / hello`仍然会响应JSON，因为它无法从头部协商识别的内容类型，而JSON是有效的默认值。

The formats apply to parsing, too. The following API will only respond to the JSON content-type and will not parse any other
input than `application/json`, `application/x-www-form-urlencoded`, `multipart/form-data`, `multipart/related` and
`multipart/mixed`. All other requests will fail with an HTTP 406 error code.
这些格式也适用于解析。 以下API将仅响应JSON内容类型，并且不会解析除“application / json”，“application / x-www-form-urlencoded”，“multipart / form-data”，“multipart / related”之外的任何其他输入。 `和`multipart / mixed`。 所有其他请求将失败，出现HTTP 406错误代码。

```ruby
class Twitter::API < Grape::API
  format :json
end
```

When the content-type is omitted, Grape will return a 406 error code unless `default_format` is specified.
The following API will try to parse any data without a content-type using a JSON parser.
省略content-type时，除非指定了“default_format”，否则Grape将返回406错误代码。
以下API将尝试使用JSON解析器解析没有内容类型的任何数据。

```ruby
class Twitter::API < Grape::API
  format :json
  default_format :json
end
```

If you combine `format` with `rescue_from :all`, errors will be rendered using the same format.
If you do not want this behavior, set the default error formatter with `default_error_formatter`.
如果将`format`与`rescue_from：all`结合使用，将使用相同的格式呈现错误。
如果您不想要此行为，请使用`default_error_formatter`设置默认错误格式化程序。

```ruby
class Twitter::API < Grape::API
  format :json
  content_type :txt, 'text/plain'
  default_error_formatter :txt
end
```

Custom formatters for existing and additional types can be defined with a proc.
可以使用proc定义现有和其他类型的自定义格式化程序。

```ruby
class Twitter::API < Grape::API
  content_type :xls, 'application/vnd.ms-excel'
  formatter :xls, ->(object, env) { object.to_xls }
end
```

You can also use a module or class.
您还可以使用模块或类。

```ruby
module XlsFormatter
  def self.call(object, env)
    object.to_xls
  end
end

class Twitter::API < Grape::API
  content_type :xls, 'application/vnd.ms-excel'
  formatter :xls, XlsFormatter
end
```

Built-in formatters are the following.
内置格式化器如下。

* `:json`: use object's `to_json` when available, otherwise call `MultiJson.dump`
* `:xml`: use object's `to_xml` when available, usually via `MultiXml`, otherwise call `to_s`
* `:txt`: use object's `to_txt` when available, otherwise `to_s`
* `:serializable_hash`: use object's `serializable_hash` when available, otherwise fallback to `:json`
* `:binary`: data will be returned "as is"
*`：json`：在可用时使用对象的`to_json`，否则调用`MultiJson.dump`
*`：xml`：在可用时使用对象的`to_xml`，通常通过`MultiXml`，否则调用`to_s`
*`：txt`：在可用时使用对象的`to_txt`，否则使用`to_s`
*`：serializable_hash`：在可用时使用对象的`serializable_hash`，否则回退到`：json`
*`：binary`：数据将“按原样”返回

If a body is present in a request to an API, with a Content-Type header value that is of an unsupported type a
"415 Unsupported Media Type" error code will be returned by Grape.
如果对API的请求中存在正文，并且Content-Type标头值为不受支持的类型，则Grape将返回“415 Unsupported Media Type”错误代码。

Response statuses that indicate no content as defined by [Rack](https://github.com/rack)
[here](https://github.com/rack/rack/blob/master/lib/rack/utils.rb#L567)
will bypass serialization and the body entity - though there should be none -
will not be modified.
响应状态，表示没有[Rack]（https://github.com/rack）定义的内容[这里（https://github.com/rack/rack/blob/master/lib/rack/utils.rb#） L567）将绕过序列化和正文实体 - 虽然应该没有 - 将不会被修改。

### JSONP

Grape supports JSONP via [Rack::JSONP](https://github.com/rack/rack-contrib), part of the
[rack-contrib](https://github.com/rack/rack-contrib) gem. Add `rack-contrib` to your `Gemfile`.
Grape通过[rack :: JSONP（https://github.com/rack/rack-contrib）支持JSONP，它是[rack-contrib]（https://github.com/rack/rack-contrib）gem的一部分。 将`rack-contrib`添加到你的`Gemfile`中。

```ruby
require 'rack/contrib'

class API < Grape::API
  use Rack::JSONP
  format :json
  get '/' do
    'Hello World'
  end
end
```

### CORS

Grape supports CORS via [Rack::CORS](https://github.com/cyu/rack-cors), part of the
[rack-cors](https://github.com/cyu/rack-cors) gem. Add `rack-cors` to your `Gemfile`,
then use the middleware in your config.ru file.
Grape通过[Rack :: CORS（https://github.com/cyu/rack-cors）支持CORS，这是[rack-cors]（https://github.com/cyu/rack-cors）gem的一部分。 将`rack-cors`添加到您的`Gemfile`，然后使用config.ru文件中的中间件。

```ruby
require 'rack/cors'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: :get
  end
end

run Twitter::API

```

## Content-type

Content-type is set by the formatter. You can override the content-type of the response at runtime
by setting the `Content-Type` header.
内容类型由格式化程序设置。 您可以通过设置`Content-Type`标头来在运行时覆盖响应的内容类型。

```ruby
class API < Grape::API
  get '/home_timeline_js' do
    content_type 'application/javascript'
    "var statuses = ...;"
  end
end
```

## API Data Formats

Grape accepts and parses input data sent with the POST and PUT methods as described in the Parameters
section above. It also supports custom data formats. You must declare additional content-types via
`content_type` and optionally supply a parser via `parser` unless a parser is already available within
Grape to enable a custom format. Such a parser can be a function or a class.
Grape接受并解析使用POST和PUT方法发送的输入数据，如上面的参数部分所述。 它还支持自定义数据格式。 您必须通过`content_type`声明其他内容类型，并可选择通过`parser`提供解析器，除非Grape中已经有一个解析器可用于启用自定义格式。 这样的解析器可以是函数或类。

With a parser, parsed data is available "as-is" in `env['api.request.body']`.
Without a parser, data is available "as-is" and in `env['api.request.input']`.
使用解析器，解析数据在`env ['api.request.body']`中“按原样”可用。
如果没有解析器，数据可以“原样”和`env ['api.request.input']`获得。

The following example is a trivial parser that will assign any input with the "text/custom" content-type
to `:value`. The parameter will be available via `params[:value]` inside the API call.
以下示例是一个简单的解析器，它将任何带有“text / custom”内容类型的输入分配给`：value`。 该参数将通过API调用中的`params [：value]`提供。

```ruby
module CustomParser
  def self.call(object, env)
    { value: object.to_s }
  end
end
```

```ruby
content_type :txt, 'text/plain'
content_type :custom, 'text/custom'
parser :custom, CustomParser

put 'value' do
  params[:value]
end
```

You can invoke the above API as follows.
您可以按如下方式调用上述API。

```
curl -X PUT -d 'data' 'http://localhost:9292/value' -H Content-Type:text/custom -v
```

You can disable parsing for a content-type with `nil`. For example, `parser :json, nil` will disable JSON parsing altogether. The request data is then available as-is in `env['api.request.body']`.
您可以使用`nil`禁用内容类型的解析。 例如，`parser：json，nil`将完全禁用JSON解析。 然后，请求数据在`env ['api.request.body']`中可用。

## JSON and XML Processors

Grape uses `JSON` and `ActiveSupport::XmlMini` for JSON and XML parsing by default. It also detects and supports [multi_json](https://github.com/intridea/multi_json) and [multi_xml](https://github.com/sferik/multi_xml). Adding those gems to your Gemfile and requiring them will enable them and allow you to swap the JSON and XML back-ends.
默认情况下，Grape使用`JSON`和`ActiveSupport :: XmlMini`进行JSON和XML解析。 它还检测并支持[multi_json]（https://github.com/intridea/multi_json）和[multi_xml]（https://github.com/sferik/multi_xml）。 将这些gems添加到Gemfile并要求它们将启用它们并允许您交换JSON和XML后端。

## RESTful Model Representations

Grape supports a range of ways to present your data with some help from a generic `present` method,
which accepts two arguments: the object to be presented and the options associated with it. The options
hash may include `:with`, which defines the entity to expose.
Grape支持一系列方法来呈现您的数据，并提供一些通用的`present`方法的帮助，该方法接受两个参数：要呈现的对象以及与之关联的选项。 选项哈希可以包括`：with`，它定义要公开的实体。

### Grape Entities

Add the [grape-entity](https://github.com/ruby-grape/grape-entity) gem to your Gemfile.
Please refer to the [grape-entity documentation](https://github.com/ruby-grape/grape-entity/blob/master/README.md)
for more details.
将[grape-entity]（https://github.com/ruby-grape/grape-entity）gem添加到您的Gemfile中。请参阅[葡萄实体文档]（https://github.com/ruby- 葡萄/葡萄实体/ blob / master / README.md）了解更多详情。

The following example exposes statuses.
以下示例公开了状态。

```ruby
module API
  module Entities
    class Status < Grape::Entity
      expose :user_name
      expose :text, documentation: { type: 'string', desc: 'Status update text.' }
      expose :ip, if: { type: :full }
      expose :user_type, :user_id, if: ->(status, options) { status.user.public? }
      expose :digest do |status, options|
        Digest::MD5.hexdigest(status.txt)
      end
      expose :replies, using: API::Status, as: :replies
    end
  end

  class Statuses < Grape::API
    version 'v1'

    desc 'Statuses index' do
      params: API::Entities::Status.documentation
    end
    get '/statuses' do
      statuses = Status.all
      type = current_user.admin? ? :full : :default
      present statuses, with: API::Entities::Status, type: type
    end
  end
end
```

You can use entity documentation directly in the params block with `using: Entity.documentation`.
您可以使用`using：Entity.documentation`直接在params块中使用实体文档。

```ruby
module API
  class Statuses < Grape::API
    version 'v1'

    desc 'Create a status'
    params do
      requires :all, except: [:ip], using: API::Entities::Status.documentation.except(:id)
    end
    post '/status' do
      Status.create! params
    end
  end
end
```

You can present with multiple entities using an optional Symbol argument.
您可以使用可选的Symbol参数显示多个实体。

```ruby
  get '/statuses' do
    statuses = Status.all.page(1).per(20)
    present :total_page, 10
    present :per_page, 20
    present :statuses, statuses, with: API::Entities::Status
  end
```

The response will be

```
  {
    total_page: 10,
    per_page: 20,
    statuses: []
  }
```

In addition to separately organizing entities, it may be useful to put them as namespaced
classes underneath the model they represent.
除了单独组织实体之外，将它们作为命名空间类放在它们所代表的模型下面可能很有用。

```ruby
class Status
  def entity
    Entity.new(self)
  end

  class Entity < Grape::Entity
    expose :text, :user_id
  end
end
```

If you organize your entities this way, Grape will automatically detect the `Entity` class and
use it to present your models. In this example, if you added `present Status.new` to your endpoint,
Grape will automatically detect that there is a `Status::Entity` class and use that as the
representative entity. This can still be overridden by using the `:with` option or an explicit
`represents` call.
如果您以这种方式组织实体，Grape将自动检测“Entity”类并使用它来呈现您的模型。 在这个例子中，如果你将`present Status.new`添加到你的端点，Grape将自动检测到有一个`Status :: Entity`类并将其用作代表实体。 这仍然可以通过使用`：with`选项或显式`表示`调用来覆盖。

You can present `hash` with `Grape::Presenters::Presenter` to keep things consistent.
您可以使用`Grape :: Presenters :: Presenter`来呈现`hash`以保持一致。

```ruby
get '/users' do
  present { id: 10, name: :dgz }, with: Grape::Presenters::Presenter
end
````
The response will be

```ruby
{
  id:   10,
  name: 'dgz'
}
```

It has the same result with
它有相同的结果

```ruby
get '/users' do
  present :id, 10
  present :name, :dgz
end
```

### Hypermedia and Roar

You can use [Roar](https://github.com/apotonick/roar) to render HAL or Collection+JSON with the help of [grape-roar](https://github.com/ruby-grape/grape-roar), which defines a custom JSON formatter and enables presenting entities with Grape's `present` keyword.
您可以使用[Roar]（https://github.com/apotonick/roar）在[grape-roar]的帮助下渲染HAL或Collection + JSON（https://github.com/ruby-grape/grape- roar），它定义了一个自定义JSON格式化程序，并允许使用Grape的“present”关键字呈现实体。

### Rabl

You can use [Rabl](https://github.com/nesquena/rabl) templates with the help of the
[grape-rabl](https://github.com/ruby-grape/grape-rabl) gem, which defines a custom Grape Rabl
formatter.
您可以在[grape-rabl]（https://github.com/ruby-grape/grape-rabl）gem的帮助下使用[Rabl]（https://github.com/nesquena/rabl）模板， 定义了一个自定义的Grape Rabl格式化程序。

### Active Model Serializers

You can use [Active Model Serializers](https://github.com/rails-api/active_model_serializers) serializers with the help of the
[grape-active_model_serializers](https://github.com/jrhe/grape-active_model_serializers) gem, which defines a custom Grape AMS
formatter.
您可以在[grape-active_model_serializers]（https://github.com/jrhe/grape-active_model_serializers）gem的帮助下使用[Active Model Serializers]（https://github.com/rails-api/active_model_serializers）序列化程序 ，它定义了一个自定义的Grape AMS格式化程序。

## Sending Raw or No Data

In general, use the binary format to send raw data.
通常，使用二进制格式发送原始数据。

```ruby
class API < Grape::API
  get '/file' do
    content_type 'application/octet-stream'
    File.binread 'file.bin'
  end
end
```

You can set the response body explicitly with `body`.
您可以使用`body`显式设置响应主体。

```ruby
class API < Grape::API
  get '/' do
    content_type 'text/plain'
    body 'Hello World'
    # return value ignored
  end
end
```

Use `body false` to return `204 No Content` without any data or content-type.
使用`body false`返回没有任何数据或内容类型的`204 No Content`。

You can also set the response to a file with `file`.
您还可以使用`file`设置对文件的响应。

```ruby
class API < Grape::API
  get '/' do
    file '/path/to/file'
  end
end
```

If you want a file to be streamed using Rack::Chunked, use `stream`.
如果您想使用Rack :: Chunked传输文件，请使用`stream`。

```ruby
class API < Grape::API
  get '/' do
    stream '/path/to/file'
  end
end
```

## Authentication
(认证)

### Basic and Digest Auth
(基本和摘要身份验证)

Grape has built-in Basic and Digest authentication (the given `block`
is executed in the context of the current `Endpoint`).  Authentication
applies to the current namespace and any children, but not parents.
Grape具有内置的Basic和Digest认证（给定的`block`在当前`Endpoint`的上下文中执行）。 身份验证适用于当前命名空间和任何子级，但不适用于父级。

```ruby
http_basic do |username, password|
  # verify user's password here
  # 在这里验证用户的密码
  { 'test' => 'password1' }[username] == password
end
```

```ruby
http_digest({ realm: 'Test Api', opaque: 'app secret' }) do |username|
  # lookup the user's password here
  # 在这里查找用户的密码
  { 'user1' => 'password1' }[username]
end
```

### Register custom middleware for authentication
(注册自定义中间件进行身份验证)

Grape can use custom Middleware for authentication. How to implement these
Middleware have a look at `Rack::Auth::Basic` or similar implementations.
Grape可以使用自定义中间件进行身份验证。 如何实现这些中间件可以看看`Rack :: Auth :: Basic`或类似的实现。

For registering a Middleware you need the following options:
要注册中间件，您需要以下选项：

* `label` - the name for your authenticator to use it later
* `MiddlewareClass` - the MiddlewareClass to use for authentication
* `option_lookup_proc` - A Proc with one Argument to lookup the options at
runtime (return value is an `Array` as Parameter for the Middleware).
*`label`  - 验证者的名称，以便稍后使用
*`MiddlewareClass`  - 用于身份验证的MiddlewareClass
*`option_lookup_proc`  - 带有一个参数的Proc，用于在运行时查找选项（返回值是`Array`作为中间件的参数）。

Example:

```ruby

Grape::Middleware::Auth::Strategies.add(:my_auth, AuthMiddleware, ->(options) { [options[:realm]] } )


auth :my_auth, { realm: 'Test Api'} do |credentials|
  # lookup the user's password here
  { 'user1' => 'password1' }[username]
end

```

Use [Doorkeeper](https://github.com/doorkeeper-gem/doorkeeper), [warden-oauth2](https://github.com/opperator/warden-oauth2) or [rack-oauth2](https://github.com/nov/rack-oauth2) for OAuth2 support.

## Describing and Inspecting an API
(描述和检查API)

Grape routes can be reflected at runtime. This can notably be useful for generating documentation.
葡萄路线可以在运行时反映出来。 这对于生成文档非常有用。

Grape exposes arrays of API versions and compiled routes. Each route contains a `route_prefix`, `route_version`, `route_namespace`, `route_method`, `route_path` and `route_params`. You can add custom route settings to the route metadata with `route_setting`.
Grape公开API版本和编译路由的数组。 每个路由都包含一个`route_prefix`，`route_version`，`route_namespace`，`route_method`，`route_path`和`route_params`。 您可以使用`route_setting`将自定义路由设置添加到路径元数据中。

```ruby
class TwitterAPI < Grape::API
  version 'v1'
  desc 'Includes custom settings.'
  route_setting :custom, key: 'value'
  get do

  end
end
```

Examine the routes at runtime.
在运行时检查路由。

```ruby
TwitterAPI::versions # yields [ 'v1', 'v2' ]
TwitterAPI::routes # yields an array of Grape::Route objects
TwitterAPI::routes[0].version # => 'v1'
TwitterAPI::routes[0].description # => 'Includes custom settings.'
TwitterAPI::routes[0].settings[:custom] # => { key: 'value' }
```

Note that `Route#route_xyz` methods have been deprecated since 0.15.0.
请注意，自0.15.0以来，已弃用`Route＃route_xyz`方法。

Please use `Route#xyz` instead.
请改用`Route＃xyz`。

Note that difference of `Route#options` and `Route#settings`.
注意`Route＃options`和`Route＃settings`的区别。

The `options` can be referred from your route, it should be set by specifing key and value on verb methods such as `get`, `post` and `put`.
`options`可以从你的路由中引用，它应该通过在动词方法上指定键和值来设置，例如`get`，`post`和`put`。

The `settings` can also be referred from your route, but it should be set by specifing key and value on `route_setting`.
`settings`也可以从你的路由引用，但它应该通过在`route_setting`上指定键和值来设置。

## Current Route and Endpoint
(当前路线和终点)

It's possible to retrieve the information about the current route from within an API call with `route`.
可以使用`route`从API调用中检索有关当前路由的信息。

```ruby
class MyAPI < Grape::API
  desc 'Returns a description of a parameter.'
  params do
    requires :id, type: Integer, desc: 'Identity.'
  end
  get 'params/:id' do
    route.route_params[params[:id]] # yields the parameter description
  end
end
```

The current endpoint responding to the request is `self` within the API block
or `env['api.endpoint']` elsewhere. The endpoint has some interesting properties,
such as `source` which gives you access to the original code block of the API
implementation. This can be particularly useful for building a logger middleware.
响应请求的当前端点是API块中的“self”或其他地方的“env ['api.endpoint']`。 端点有一些有趣的属性，例如`source`，它允许您访问API实现的原始代码块。 这对于构建记录器中间件特别有用。

```ruby
class ApiLogger < Grape::Middleware::Base
  def before
    file = env['api.endpoint'].source.source_location[0]
    line = env['api.endpoint'].source.source_location[1]
    logger.debug "[api] #{file}:#{line}"
  end
end
```

## Before and After

Blocks can be executed before or after every API call, using `before`, `after`,
`before_validation` and `after_validation`.
可以在每次API调用之前或之后使用`before`，`after`，`before_validation`和`after_validation`执行块。

Before and after callbacks execute in the following order:
回调之前和之后按以下顺序执行：

1. `before`
2. `before_validation`
3. _validations_
4. `after_validation`
5. _the API call_
6. `after`

Steps 4, 5 and 6 only happen if validation succeeds.
只有验证成功，才会发生步骤4,5和6。

If a request for a resource is made with an unsupported HTTP method (returning
HTTP 405) only `before` callbacks will be executed.  The remaining callbacks will
be bypassed.
如果使用不受支持的HTTP方法（返回HTTP 405）进行资源请求，则仅执行`之前'回调。 其余的回调将被绕过。

If a request for a resource is made that triggers the built-in `OPTIONS` handler,
only `before` and `after` callbacks will be executed.  The remaining callbacks will
be bypassed.
如果对资源的请求触发了内置的“OPTIONS”处理程序，则只会执行`before`和`after`回调。 其余的回调将被绕过。

For example, using a simple `before` block to set a header.
例如，使用简单的`before`块来设置标题。

```ruby
before do
  header 'X-Robots-Tag', 'noindex'
end
```

**Namespaces**

Callbacks apply to each API call within and below the current namespace:
回调适用于当前命名空间内和下方的每个API调用：

```ruby
class MyAPI < Grape::API
  get '/' do
    "root - #{@blah}"
  end

  namespace :foo do
    before do
      @blah = 'blah'
    end

    get '/' do
      "root - foo - #{@blah}"
    end

    namespace :bar do
      get '/' do
        "root - foo - bar - #{@blah}"
      end
    end
  end
end
```

The behavior is then:
那么行为是：

```bash
GET /           # 'root - '
GET /foo        # 'root - foo - blah'
GET /foo/bar    # 'root - foo - bar - blah'
```

Params on a `namespace` (or whichever alias you are using) will also be available when using `before_validation` or `after_validation`:
当使用`before_validation`或`after_validation`时，`namespace'（或你正在使用的别名）的参数也可用：

```ruby
class MyAPI < Grape::API
  params do
    requires :blah, type: Integer
  end
  resource ':blah' do
    after_validation do
      # if we reach this point validations will have passed
      @blah = declared(params, include_missing: false)[:blah]
    end

    get '/' do
      @blah.class
    end
  end
end
```

The behavior is then:
那么行为是：

```bash
GET /123        # 'Integer'
GET /foo        # 400 error - 'blah is invalid'
```

**Versioning**

When a callback is defined within a version block, it's only called for the routes defined in that block.
在版本块中定义回调时，仅调用该块中定义的路由。

```ruby
class Test < Grape::API
  resource :foo do
    version 'v1', :using => :path do
      before do
        @output ||= 'v1-'
      end
      get '/' do
        @output += 'hello'
      end
    end

    version 'v2', :using => :path do
      before do
        @output ||= 'v2-'
      end
      get '/' do
        @output += 'hello'
      end
    end
  end
end
```

The behavior is then:
那么行为是：

```bash
GET /foo/v1       # 'v1-hello'
GET /foo/v2       # 'v2-hello'
```

**Altering Responses**
（改变回应）
Using `present` in any callback allows you to add data to a response:
在任何回调中使用`present`可以将数据添加到响应中：

```ruby
class MyAPI < Grape::API
  format :json

  after_validation do
    present :name, params[:name] if params[:name]
  end

  get '/greeting' do
    present :greeting, 'Hello!'
  end
end
```

The behavior is then:
那么行为是：

```bash
GET /greeting              # {"greeting":"Hello!"}
GET /greeting?name=Alan    # {"name":"Alan","greeting":"Hello!"}
```

Instead of altering a response, you can also terminate and rewrite it from any callback using `error!`, including `after`. This will cause all subsequent steps in the process to not be called. **This includes the actual api call and any callbacks**
您也可以使用`error !`（包括`after`）从任何回调中终止并重写它，而不是更改响应。 这将导致不调用过程中的所有后续步骤。 **这包括实际的api通话和任何回调**

## Anchoring

Grape by default anchors all request paths, which means that the request URL
should match from start to end to match, otherwise a `404 Not Found` is
returned. However, this is sometimes not what you want, because it is not always
known upfront what can be expected from the call. This is because Rack-mount by
default anchors requests to match from the start to the end, or not at all.
Rails solves this problem by using a `anchor: false` option in your routes.
In Grape this option can be used as well when a method is defined.
默认情况下，Grape会锚定所有请求路径，这意味着请求URL应该从头到尾匹配匹配，否则返回“404 Not Found”。 但是，这有时并不是您想要的，因为并不总是能够预先了解调用所期望的内容。 
这是因为默认情况下，Rack-mount会锚定从开始到结束的匹配请求，或者根本不匹配。
Rails通过在您的路由中使用`anchor：false`选项解决了这个问题。 在Grape中，定义方法时也可以使用此选项。

For instance when your API needs to get part of an URL, for instance:
例如，当您的API需要获取URL的一部分时，例如：

```ruby
class TwitterAPI < Grape::API
  namespace :statuses do
    get '/(*:status)', anchor: false do

    end
  end
end
```

This will match all paths starting with '/statuses/'. There is one caveat though:
the `params[:status]` parameter only holds the first part of the request url.
Luckily this can be circumvented by using the described above syntax for path
specification and using the `PATH_INFO` Rack environment variable, using
`env['PATH_INFO']`. This will hold everything that comes after the '/statuses/'
part.
这将匹配以'/ statuses /'开头的所有路径。 但有一点需要注意：`params [：status]`参数只保存请求url的第一部分。
幸运的是，通过使用上述路径规范语法并使用`PATH_INFO` Rack环境变量，使用`env ['PATH_INFO']`可以避免这种情况。 
这将包含'/ status /'部分之后的所有内容。

## Using Custom Middleware
（使用自定义中间件）
### Grape Middleware

You can make a custom middleware by using `Grape::Middleware::Base`.
It's inherited from some grape official middlewares in fact.
您可以使用`Grape :: Middleware :: Base`制作自定义中间件。
事实上，它是从一些葡萄官方中间件继承而来的。

For example, you can write a middleware to log application exception.
例如，您可以编写中间件来记录应用程序异常。

```ruby
class LoggingError < Grape::Middleware::Base
  def after
    return unless @app_response && @app_response[0] == 500
    env['rack.logger'].error("Raised error on #{env['PATH_INFO']}")
  end
end
```

Your middleware can overwrite application response as follows, except error case.
除错误情况外，您的中间件可以如下覆盖应用程序响应。

```ruby
class Overwriter < Grape::Middleware::Base
  def after
    [200, { 'Content-Type' => 'text/plain' }, ['Overwritten.']]
  end
end
```

You can add your custom middleware with `use`, that push the middleware onto the stack, and you can also control where the middleware is inserted using `insert`, `insert_before` and `insert_after`.
您可以使用`use`添加自定义中间件，将中间件推入堆栈，您还可以使用`insert`，`insert_before`和`insert_after`来控制中间件的插入位置。

```ruby
class CustomOverwriter < Grape::Middleware::Base
  def after
    [200, { 'Content-Type' => 'text/plain' }, [@options[:message]]]
  end
end


class API < Grape::API
  use Overwriter
  insert_before Overwriter, CustomOverwriter, message: 'Overwritten again.'
  insert 0, CustomOverwriter, message: 'Overwrites all other middleware.'

  get '/' do
  end
end
```

### Rails Middleware

Note that when you're using Grape mounted on Rails you don't have to use Rails middleware because it's already included into your middleware stack.
请注意，当您在Rails上使用Grape时，您不必使用Rails中间件，因为它已经包含在您的中间件堆栈中。

You only have to implement the helpers to access the specific `env` variable.
您只需实现帮助程序即可访问特定的`env`变量。

### Remote IP
（远程IP）

By default you can access remote IP with `request.ip`. This is the remote IP address implemented by Rack. Sometimes it is desirable to get the remote IP [Rails-style](http://stackoverflow.com/questions/10997005/whats-the-difference-between-request-remote-ip-and-request-ip-in-rails) with `ActionDispatch::RemoteIp`.
默认情况下，您可以使用`request.ip`访问远程IP。 这是Rack实现的远程IP地址。 有时需要获得远程IP [Rails-style]（http://stackoverflow.com/questions/10997005/whats-the-difference-between-request-remote-ip-and-request-ip-in-rails ）使用`ActionDispatch :: RemoteIp`。

Add `gem 'actionpack'` to your Gemfile and `require 'action_dispatch/middleware/remote_ip.rb'`. Use the middleware in your API and expose a `client_ip` helper. See [this documentation](http://api.rubyonrails.org/classes/ActionDispatch/RemoteIp.html) for additional options.
将`gem'actionpack'`添加到你的Gemfile和`require'action_dispatch / middleware / remote_ip.rb'。 使用API中的中间件并公开`client_ip`帮助程序。 有关其他选项，请参阅[本文档]（http://api.rubyonrails.org/classes/ActionDispatch/RemoteIp.html）。

```ruby
class API < Grape::API
  use ActionDispatch::RemoteIp

  helpers do
    def client_ip
      env['action_dispatch.remote_ip'].to_s
    end
  end

  get :remote_ip do
    { ip: client_ip }
  end
end
```

## Writing Tests

### Writing Tests with Rack

Use `rack-test` and define your API as `app`.

#### RSpec

You can test a Grape API with RSpec by making HTTP requests and examining the response.
您可以通过发出HTTP请求并检查响应来测试带有RSpec的Grape API。

```ruby
require 'spec_helper'

describe Twitter::API do
  include Rack::Test::Methods

  def app
    Twitter::API
  end

  context 'GET /api/statuses/public_timeline' do
    it 'returns an empty array of statuses' do
      get '/api/statuses/public_timeline'
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)).to eq []
    end
  end
  context 'GET /api/statuses/:id' do
    it 'returns a status by id' do
      status = Status.create!
      get "/api/statuses/#{status.id}"
      expect(last_response.body).to eq status.to_json
    end
  end
end
```

There's no standard way of sending arrays of objects via an HTTP GET, so POST JSON data and specify the correct content-type.
没有通过HTTP GET发送对象数组的标准方法，因此POST JSON数据并指定正确的内容类型。

```ruby
describe Twitter::API do
  context 'POST /api/statuses' do
    it 'creates many statuses' do
      statuses = [{ text: '...' }, { text: '...'}]
      post '/api/statuses', statuses.to_json, 'CONTENT_TYPE' => 'application/json'
      expect(last_response.body).to eq 201
    end
  end
end
```

#### Airborne

You can test with other RSpec-based frameworks, including [Airborne](https://github.com/brooklynDev/airborne), which uses `rack-test` to make requests.
您可以使用其他基于RSpec的框架进行测试，包括[Airborne]（https://github.com/brooklynDev/airborne），它使用`rack-test`来发出请求。

```ruby
require 'airborne'

Airborne.configure do |config|
  config.rack_app = Twitter::API
end

describe Twitter::API do
  context 'GET /api/statuses/:id' do
    it 'returns a status by id' do
      status = Status.create!
      get "/api/statuses/#{status.id}"
      expect_json(status.as_json)
    end
  end
end
```

#### MiniTest

```ruby
require 'test_helper'

class Twitter::APITest < MiniTest::Test
  include Rack::Test::Methods

  def app
    Twitter::API
  end

  def test_get_api_statuses_public_timeline_returns_an_empty_array_of_statuses
    get '/api/statuses/public_timeline'
    assert last_response.ok?
    assert_equal [], JSON.parse(last_response.body)
  end

  def test_get_api_statuses_id_returns_a_status_by_id
    status = Status.create!
    get "/api/statuses/#{status.id}"
    assert_equal status.to_json, last_response.body
  end
end
```

### Writing Tests with Rails

#### RSpec

```ruby
describe Twitter::API do
  context 'GET /api/statuses/public_timeline' do
    it 'returns an empty array of statuses' do
      get '/api/statuses/public_timeline'
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq []
    end
  end
  context 'GET /api/statuses/:id' do
    it 'returns a status by id' do
      status = Status.create!
      get "/api/statuses/#{status.id}"
      expect(response.body).to eq status.to_json
    end
  end
end
```

In Rails, HTTP request tests would go into the `spec/requests` group. You may want your API code to go into
`app/api` - you can match that layout under `spec` by adding the following in `spec/rails_helper.rb`.
在Rails中，HTTP请求测试将进入`spec / requests`组。 您可能希望您的API代码进入`app / api`  - 您可以通过在`spec / rails_helper.rb`中添加以下内容来匹配`spec`下的布局。

```ruby
RSpec.configure do |config|
  config.include RSpec::Rails::RequestExampleGroup, type: :request, file_path: /spec\/api/
end
```

#### MiniTest

```ruby
class Twitter::APITest < ActiveSupport::TestCase
  include Rack::Test::Methods

  def app
    Rails.application
  end

  test 'GET /api/statuses/public_timeline returns an empty array of statuses' do
    get '/api/statuses/public_timeline'
    assert last_response.ok?
    assert_equal [], JSON.parse(last_response.body)
  end

  test 'GET /api/statuses/:id returns a status by id' do
    status = Status.create!
    get "/api/statuses/#{status.id}"
    assert_equal status.to_json, last_response.body
  end
end
```

### Stubbing Helpers

Because helpers are mixed in based on the context when an endpoint is defined, it can
be difficult to stub or mock them for testing. The `Grape::Endpoint.before_each` method
can help by allowing you to define behavior on the endpoint that will run before every
request.
因为在定义端点时根据上下文混合了帮助程序，所以很难对它们进行存根或模拟以进行测试。 `Grape :: Endpoint.before_each`方法可以帮助您定义将在每个请求之前运行的端点上的行为。

```ruby
describe 'an endpoint that needs helpers stubbed' do
  before do
    Grape::Endpoint.before_each do |endpoint|
      allow(endpoint).to receive(:helper_name).and_return('desired_value')
    end
  end

  after do
    Grape::Endpoint.before_each nil
  end

  it 'stubs the helper' do

  end
end
```

## Reloading API Changes in Development
    (重新加载开发中的API更改)

### Reloading in Rack Applications
    (重新加载机架应用程序)
Use [grape-reload](https://github.com/AlexYankee/grape-reload).

### Reloading in Rails Applications
    (Reloading in Rails Applications)

Add API paths to `config/application.rb`.

```ruby
# Auto-load API and its subdirectories
config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]
```

Create `config/initializers/reload_api.rb`.

```ruby
if Rails.env.development?
  ActiveSupport::Dependencies.explicitly_unloadable_constants << 'Twitter::API'

  api_files = Dir[Rails.root.join('app', 'api', '**', '*.rb')]
  api_reloader = ActiveSupport::FileUpdateChecker.new(api_files) do
    Rails.application.reload_routes!
  end
  ActionDispatch::Callbacks.to_prepare do
    api_reloader.execute_if_updated
  end
end
```

For Rails >= 5.1.4, change this:
对于Rails> = 5.1.4，更改为：

```ruby
ActionDispatch::Callbacks.to_prepare do
  api_reloader.execute_if_updated
end
```

to this:

```ruby
ActiveSupport::Reloader.to_prepare do
  api_reloader.execute_if_updated
end
```

See [StackOverflow #3282655](http://stackoverflow.com/questions/3282655/ruby-on-rails-3-reload-lib-directory-for-each-request/4368838#4368838) for more information.

## Performance Monitoring

### Active Support Instrumentation
    (性能监控)
Grape has built-in support for [ActiveSupport::Notifications](http://api.rubyonrails.org/classes/ActiveSupport/Notifications.html) which provides simple hook points to instrument key parts of your application.

The following are currently supported:
目前支持以下内容：

#### endpoint_run.grape

The main execution of an endpoint, includes filters and rendering.
端点的主要执行包括过滤器和渲染。

* *endpoint* - The endpoint instance

#### endpoint_render.grape

The execution of the main content block of the endpoint.
执行端点的主要内容块。

* *endpoint* - The endpoint instance

#### endpoint_run_filters.grape

* *endpoint* - The endpoint instance
* *filters* - The filters being executed
* *type* - The type of filters (before, before_validation, after_validation, after)
* *端点*  - 端点实例
* * filters *  - 正在执行的过滤器
* * type *  - 过滤器的类型（before，before_validation，after_validation，after）

#### endpoint_run_validators.grape

The execution of validators.
执行验证器。

* *endpoint* - The endpoint instance
* *validators* - The validators being executed
* *request* - The request being validated
* *端点*  - 端点实例
* *验证器*  - 正在执行的验证器
* * request *  - 正在验证的请求

#### format_response.grape

Serialization or template rendering.
序列化或模板渲染。

* *env* - The request environment
* *formatter* - The formatter object (e.g., `Grape::Formatter::Json`)
* * env *  - 请求环境
* * formatter *  - 格式化程序对象（例如，`Grape :: Formatter :: Json`）

See the [ActiveSupport::Notifications documentation](http://api.rubyonrails.org/classes/ActiveSupport/Notifications.html) for information on how to subscribe to these events.
有关如何订阅这些事件的信息，请参阅[ActiveSupport :: Notifications文档]（http://api.rubyonrails.org/classes/ActiveSupport/Notifications.html）。

### Monitoring Products
    (监控产品)
Grape integrates with following third-party tools:
Grape与以下第三方工具集成：

* **New Relic** - [built-in support](https://docs.newrelic.com/docs/agents/ruby-agent/frameworks/grape-instrumentation) from v3.10.0 of the official [newrelic_rpm](https://github.com/newrelic/rpm) gem, also [newrelic-grape](https://github.com/xinminlabs/newrelic-grape) gem
* **Librato Metrics** - [grape-librato](https://github.com/seanmoon/grape-librato) gem
* **[Skylight](https://www.skylight.io/)** - [skylight](https://github.com/skylightio/skylight-ruby) gem, [documentation](https://docs.skylight.io/grape/)
* **[AppSignal](https://www.appsignal.com)** - [appsignal-ruby](https://github.com/appsignal/appsignal-ruby) gem, [documentation](http://docs.appsignal.com/getting-started/supported-frameworks.html#grape)

## Contributing to Grape
    (为葡萄做贡献)
Grape is work of hundreds of contributors. You're encouraged to submit pull requests, propose
features and discuss issues.

See [CONTRIBUTING](CONTRIBUTING.md).

## License

MIT License. See LICENSE for details.

## Copyright

Copyright (c) 2010-2018 Michael Bleigh, Intridea Inc. and Contributors.
