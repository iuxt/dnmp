## 这个东西有什么用

这个项目可以让你很快的搭建一套PHP环境,比如跑个wordpress等
想重新编译的话,请删除docker-compose.yml,并且复制docker-compose-build.yml到docker-compose.yml

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

## 其他

### 创建数据库

```bash
docker run --rm --network dnmp_default mysql:5.7.32 mysql -uroot -hmysql -p123456 -e 'CREATE DATABASE `wordpress` CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci';'
```

### 将mysql连接到dnmp

```bash
docker network connect dnmp_default mysql
```
