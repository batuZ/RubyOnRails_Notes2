# linux安装docker
yum -y install docker
# 启动docker service
sysemctl start docker
# 设置开机启动
sysemctl enable docker

# 查看docker信息
docker version || docker info

# -------------------------- images -----------------

# 查询线上镜像
docker search centos

# 下载镜像
docker pull centos

# 查看本地镜像
docker images

#删除本地指定镜像
docker rmi -f ms_test:1

# 导出镜像文件，把指定的镜像保存成tar包
docker savo -o /user/output.tar centos:latest

# 导入镜像文件，
docker load -i /user/output.tar

#登陆dockhub
docker login [-u username -p password -e email]

#标记image,把目image标记上用户名
docker tag ms_test:1 304701204/gotos:32

#推到dockhub
docker push 304701204/gotos:32

# -------------------------- 容器 -----------------

# 查看所有运行或运行过的容器
docker ps -a

# 把容器当前状态提交为镜像
docker commit 容器ID user_name/image_name:tag

# 交互启动镜像
docker run -i -t centos:4 /bin/bash

# 后台启动并开始程序,-d 镜像，-c 启动应用程序，返回值为容器ID
docker run -d centos:4 bash -c 'echo hello world'
# 映射端口 -p 物理端口:容器端口
docker run -d -p 80:80 centos:4 bash -c 'echo hello world'
# 进入正在运行的容器
docker exec -i -t 容器ID /bin/bash

# 启动已有容器
docker start 容器ID或name

# 关闭容器
docker kill(stop) 容器ID或name

# 获取容器的输出日志
docker logs 容器ID或name

