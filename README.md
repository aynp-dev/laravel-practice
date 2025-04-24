# Laravel 練習用

### 環境（必要なもの）
- WSL(Ubuntu-24.04)
- VS Code(Visual Studio Code)
- Docker

### WSL(Ubuntu-24.04)
PowerShell

```
wsl --install -d Ubuntu-24.04
```

### VS Code
拡張機能の準備

- WSL
- Japanese Language Pack for Visual Studio Code



フォルダを指定  
「フォルダを開く」メニューから 「/root」を指定してOK  
✅親フォルダー内の全てのフィアルの作成者を信頼します。  
⇒ はい、作成者を信頼します。  

VS Codeのターミナルから
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
```
