# Active Storage Rails5.2 新增上传下载功能

增加关系表
rails active_storage:install
rails db:migrate

在modle中增加附件，可以有多个
has_one_attached :image  ## 一对一关系
has_many_attached :images  ## 一对多关系

同时修改健壮参数
params.require(:project).permit(..., :image)   # 一对一关系
params.require(:project).permit(..., images: [])   # 一对多关系

通过config/storage.yml配置上传过来的文件保存位置
    test:
      service: Disk
      root: <%= Rails.root.join("tmp/storage") %>

    local:
      service: Disk
      root: <%= Rails.root.join("storage") %>

通过启动模式配置文件 config/environments/development.rb 指定使用哪种 service
  
    config.active_storage.service = :local
    //指向上面的 local:
