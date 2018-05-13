# Asset_Pipeline 静态资源文件管理
[官方资料](https://ruby-china.github.io/rails-guides/asset_pipeline.html#precompiling-assets)

### 配置文件 Rails.root/config/initializers/assets.rb

```ruby
# 向assets中增加可访问路径（ps:想在view中使用还要在application.js或.css中配置一下）
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# 向assets中增需要预编译的对象
Rails.application.config.assets.precompile += %w( admin.js admin.css )
```

### assets 下默认配置

app/assets/config/manifest.js
```ruby
//= link_tree ../images                   #
//= link_directory ../javascripts .js
//= link_directory ../stylesheets .css
```
