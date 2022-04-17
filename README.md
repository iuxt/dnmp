# 使用说明

## 这个东西有什么用

这个项目可以让你很快的搭建一套PHP环境,比如跑个wordpress等

## 使用前准备

1. 克隆仓库

    ```bash
    git clone https://github.com/iuxt/dnmp.git
    ```

1. 复制配置文件模板

    ```bash
    cp .env.example .env
    ```

1. 把你的代码放到`data/www`目录下, 然后修改目录权限

    ```bash
    sudo ./chown.sh
    ```

1. 安装docker

    ```bash
    curl -fsSL get.docker.com | bash
    sudo usermod -aG docker $USER
    ```

1. 安装docker-compose

    ```bash
    pip3 install docker-compose
    ```

1. 启动

    > 不想重新构建，可以先执行`docker-compose pull`

    ```bash
    docker-compose up -d
    ```

1. 访问

    绑定hosts 127.0.0.1 到 test.com
    浏览器访问test.com不出意外，你就可以看到phpinfo页面。

## 其他

### 执行SQL

```bash
source .env
docker run --rm --network dnmp_default mysql:${MYSQL_VERSION} mysql -uroot -hmysql -p${MYSQL_ROOT_PASSWORD}  -e 'CREATE DATABASE `wordpress` CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci';'
```

### arm架构机器

~~mysql官方镜像没有支持ARM架构，可以将镜像换成mysql/mysql-server~~mysql最新版已经有支持arm的镜像了

~~docker-compose.yaml~~

```yaml
  mysql:
    image: mysql/mysql-server:${MYSQL_VERSION}
```

### 自签证书

建议直接使用mkcert<https://github.com/FiloSottile/mkcert>

```bash
./service/nginx/ssl/gencert.sh
```

> 这个脚本会生成一堆文件，其中：  
> ca.crt      是CA证书，需要在客户端信任  
> ca.key      是CA私钥  
> server.key  服务器私钥，配置在nginx上面  
> server.crt  服务器证书，配置在nginx上面  
