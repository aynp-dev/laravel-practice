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
- PHP Intelephense

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

# WSLでの作業を作成
mkdir /root/dockers
cd /root/dockers

# ここのリポジトリからソース取得
git clone git@github.com:aynp-dev/laravel-practice.git laravel
cd laravel

# Docker起動
docker compose up -d --build

# WSLからDockerコンテナ内にコマンド
docker exec -it -w /var/www/html/laravel laravel_app composer update
docker exec -it -w /var/www/html/laravel laravel_app php artisan migrate
ENTER ⏎
docker exec -it -w /var/www/html/laravel laravel_app chown -R www-data:www-data ../laravel/
```

<ins>VS Codeでフォルダを指定 </ins>

「フォルダを開く」メニューから 「/root/dockers」を指定してOK  
✅親フォルダー内の全てのフィアルの作成者を信頼します。  
⇒ はい、作成者を信頼します。  




# 確認

- Laravel

http://localhost  
  
laravel degubbar 入ってます  
ソースコードはVS Codeで　ROOT / dockers / src

- Laravel 管理画面

http://localhost/admin/  
ログインユーザーを登録して遊んでみる
Laravel Backpack　入ってます。
調べて見てCRUD生成などやってみよう

- PHP MyAdmin

http://localhost:88  
ユーザー名：root  
パスワード:root  
データベースの構造を見てみよう

────────────────────────────────────────────────
# 一度セットアップ完了してる場合のDocker起動
<ins>VS Codeのターミナルから</ins>
```
cd /root/dockers/laravel
docker compose up -d
```
