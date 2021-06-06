## 这个东西有什么用

这个项目可以让你很快的搭建一套PHP环境,比如跑个wordpress等

## 使用前准备

1. 克隆仓库
```bash
git clone https://github.com/iuxt/dnmp.git
```
2. 复制配置文件模板
```bash
cp .env.example .env
```

3. 创建必须的目录
```bash
mkdir www mysql_data
```
4. 把你的代码放到www目录下, 然后修改目录权限
```bash
sudo chown -R www-data:www-data www
```
5. 安装docker-compose
```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

6. 安装docker
```bash
curl -fsSL get.docker.com | bash
sudo usermod -aG docker $USER
```

7. 启动
```bash
docker-compose up -d
```

## 其他
### 创建数据库
```bash
docker run --rm --network dnmp_default mysql:5.7.32 mysql -uroot -hmysql -p123456 -e 'CREATE DATABASE `wordpress` CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci';'
```
