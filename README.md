# Laravel 練習用

### 環境（必要なもの）
- WSL(Ubuntu-24.04)
- VS Code(Visual Studio Code)
- Docker

### WSL(Ubuntu-24.04)
<ins>PowerShell</ins>

```
wsl --install -d Ubuntu-24.04
```

### VS Code
<ins>拡張機能の準備</ins>

- WSL
- Japanese Language Pack for Visual Studio Code

<ins>ターミナルを表示して次を実行</ins>
```
# パッケージ更新
sudo apt -y update
sudo apt -y upgrade

# Dockerリポジトリの公開鍵をUbuntu推奨ディレクトリへ格納
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Dockerリポジトリ登録
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc]  https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Docker Engineのインストール
sudo apt update
sudo apt install -y docker-ce docker-ce-cli \
  containerd.io docker-buildx-plugin docker-compose-plugin

mkdir /root/dockers
cd /root/dockers

git clone git@github.com:aynp-dev/laravel-practice.git laravel
cd laravel
docker compose up -d --build

docker exec -it -w /var/www/html/laravel laravel_app composer update
docker exec -it -w /var/www/html/laravel laravel_app php artisan migrate
ENTER ⏎
docker exec -it -w /var/www/html/laravel laravel_app chown -R www-data:www-data ../laravel/
```

<ins>VS Codeでフォルダを指定 </ins>

「フォルダを開く」メニューから 「/var/www」を指定してOK  
✅親フォルダー内の全てのフィアルの作成者を信頼します。  
⇒ はい、作成者を信頼します。  




# 確認
### PHP MyAdmin

http://localhost:88

ユーザー名：root

パスワード:root

### Laravel

http://localhost

### Laravel 管理画面

http://localhost/admin/

ログインユーザーは登録してください


### Laravel のソースコード
<ins>VS Code</ins>

ROOT / dockers / laravel



