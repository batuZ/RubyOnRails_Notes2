# Docker [资料](https://www.widuu.com/chinese_docker/index.html)

#### linux安装docker
yum -y install docker

#### 启动docker service
sysemctl start docker

#### 设置开机启动
sysemctl enable docker

#### 查看docker信息
docker version || docker info

#### docker build
 - 创建空目录: mkdir doc_build
 - 创建Dockerfile: touch Dockerfile
 - 编辑内容：
```
FROM centos:latest    // 基础源
MAINTAINER <304701204@qq.com>   // 作者
RUN yum -y install wegt   // 安装依赖
ADD start.sh /user/local/bin/start.sh   // 添加支持文件,把文件中start.sh 复制到容器/user/local/bin/start.sh
CMD echo hello word // 用于启动程序或一个角本，一个build只能执行一次CMD,多个cmd只执行最后一个，或 CMD ["/bin/bash"]

```
 - 创建build: docker build -t centos:latest ./ #=> docker build -t 父镜像 Dockerfile目录

## images

#### 查询线上镜像
docker search centos

#### 下载镜像
docker pull centos

#### 查看本地镜像
docker images

#### 删除本地指定镜像
docker rmi -f ms_test:1

#### 导出镜像文件，把指定的镜像保存成tar包
docker savo -o /user/output.tar centos:latest

#### 导入镜像文件，
docker load -i /user/output.tar

#### 登陆dockhub
docker login [-u username -p password -e email]

#### 标记image,把目image标记上用户名
docker tag ms_test:1 304701204/gotos:32

#### 推到dockhub
docker push 304701204/gotos:32

## 容器

#### 查看所有运行或运行过的容器
docker ps -a

#### 把容器当前状态提交为镜像
docker commit 容器ID user_name/image_name:tag

#### 交互启动镜像
docker run -i -t centos:4 /bin/bash

#### 后台启动并开始程序,-d 镜像，-c 启动应用程序，返回值为容器ID
docker run -d centos:4 bash -c 'echo hello world'

#### 映射端口 -p 物理端口:容器端口
docker run -d -p 80:80 centos:4 bash -c 'echo hello world'

#### 进入正在运行的容器
docker exec -i -t 容器ID /bin/bash

#### 启动已有容器
docker start 容器ID或name

#### 关闭容器
docker kill(stop) 容器ID或name

#### 获取容器的输出日志
docker logs 容器ID或name

